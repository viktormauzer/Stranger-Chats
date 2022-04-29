//
//  FirestoreDB.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 11.04.2022..
//

import Firebase
import Foundation

struct FirestoreDB {
    let db = Firestore.firestore()
    
    var currentUserID: String {
        if let userID = Auth.auth().currentUser?.uid {
            return userID
        } else {
            return ""
        }
    }
    
    func saveUser(userEmail: String?) throws {
        guard let userEmail = userEmail else { return }
        var error: Error?
        
        db.collection(K.Firestore.usersCollectionName).document(currentUserID).setData([
            K.Firestore.Keys.email: userEmail
        ]) { err in
            error = err
        }
        
        if let error = error { throw error }
    }
    
    func checkIfUserExists(_ email: String?) async throws -> Bool {
        guard let email = email else { return false }
        var dbError: Error?
        
        do {
            let querySnapshot = try await db.collection(K.Firestore.usersCollectionName).getDocuments()
            return querySnapshot.documents.contains { document in
                if let documentString = document.data()[K.Firestore.Keys.email] as? String {
                    if documentString.lowercased() == email.lowercased() {
                        return true
                    }
                }
                return false
            }
        } catch {
            dbError = error
        }
        
        if let dbError = dbError { throw dbError }
        
        return false
    }
    
    func addFriend(friend: Friend) async {
        let friendAddedCurrentUser = await checkIfFriendAddedCurrentUser(friend: friend)
        
        if friendAddedCurrentUser {
            if let friendChatRef = await getFriendChatIDRef(friend: friend) {
                let updatedFriend = Friend(id: friend.id, name: friend.name, email: friend.email, userID: friend.userID, chatIDRef: friendChatRef, profileImageName: friend.profileImageName)
                await saveFriendToDB(friend: updatedFriend)
            }
        } else {
            let chatID = await createChat()

            let updatedFriend = Friend(id: friend.id, name: friend.name, email: friend.email, userID: friend.userID, chatIDRef: chatID.documentID, profileImageName: friend.profileImageName)
            await saveFriendToDB(friend: updatedFriend)
        }
    }
    
    private func createChat() async -> DocumentReference {
        let chatRefID = db.collection(K.Firestore.chatsCollectionName).addDocument(data: [
            K.Firestore.Keys.date: Date().timeIntervalSince1970
        ]) { err in
            if let err = err {
                print(err)
            }
        }
        
        return chatRefID
    }
    
    private func getFriendChatIDRef(friend: Friend) async -> String? {
        do {
            let querySnapshot = try await         db.collection(K.Firestore.usersCollectionName).document(friend.userID).collection(K.Firestore.friendsCollectionName).getDocuments()
            for document in querySnapshot.documents {
                if let friendUserID = document.data()[K.Firestore.Keys.userID] as? String {
                    if friendUserID == currentUserID {
                        if let friendChatIDRef = document.data()[K.Firestore.Keys.chatIDRef] as? String {
                            return friendChatIDRef
                        }
                    }
                }
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    private func checkIfFriendAddedCurrentUser(friend: Friend) async -> Bool {
        do {
            let querySnasphot = try await db.collection(K.Firestore.usersCollectionName).document(friend.userID).collection(K.Firestore.friendsCollectionName).getDocuments()
            if querySnasphot.documents.isEmpty {
                return false
            } else {
                return querySnasphot.documents.contains { document in
                    if let friendUserID = document.data()[K.Firestore.Keys.userID] as? String {
                        if friendUserID == currentUserID {
                            return true
                        } else {
                            return false
                        }
                    }
                    return false
                }
            }
        } catch {
            print(error)
        }
                
        return false
    }
    
    private func saveFriendToDB(friend: Friend) async {
        do {
            try await db.collection(K.Firestore.usersCollectionName).document(currentUserID).collection(K.Firestore.friendsCollectionName).document(friend.id).setData([
                K.Firestore.Keys.name: friend.name,
                K.Firestore.Keys.email: friend.email,
                K.Firestore.Keys.userID: friend.userID,
                K.Firestore.Keys.chatIDRef: friend.chatIDRef,
                K.Firestore.Keys.profileImageName: friend.profileImageName
            ], merge: true)
        } catch {
            print(error)
        }
    }
    
    func getFriendUserID(_ email: String?) async -> String {
        guard let email = email else { return "" }
        
        do {
            let querySnapshot = try await db.collection(K.Firestore.usersCollectionName).getDocuments()
            for document in querySnapshot.documents {
                if let friendEmail = document.data()[K.Firestore.Keys.email] as? String {
                    if friendEmail.lowercased() == email.lowercased() {
                        return document.documentID
                    }
                }
            }
        } catch {
            print(error)
        }
        return ""
    }
    
    func loadFriends() async throws -> [Friend]? {
        var friends = [Friend]()
        var loadError: LoadingError
        
        do {
            let querySnapshot = try await db.collection(K.Firestore.usersCollectionName).document(currentUserID).collection(K.Firestore.friendsCollectionName).getDocuments()
            for friend in querySnapshot.documents {
                guard let name = friend.data()[K.Firestore.Keys.name] as? String else { loadError = .typecastFailed; throw loadError }
                guard let email = friend.data()[K.Firestore.Keys.email] as? String else { loadError = .typecastFailed; throw loadError }
                guard let userID = friend.data()[K.Firestore.Keys.userID] as? String else { loadError = .typecastFailed; throw loadError }
                guard let chatRef = friend.data()[K.Firestore.Keys.chatIDRef] as? String else { loadError = .typecastFailed; throw loadError }
                guard let profileImage = friend.data()[K.Firestore.Keys.profileImageName] as? String else { loadError = .typecastFailed; throw loadError }
                
                let loadedFriend = Friend(id: friend.documentID, name: name, email: email, userID: userID, chatIDRef: chatRef, profileImageName: profileImage)
                friends.append(loadedFriend)
            }
        } catch {
            loadError = .loadFromDBFailed
            throw loadError
        }
        
        return friends
    }
    
    func deleteFriend(_ friend: Friend) {
        db.collection(K.Firestore.usersCollectionName).document(currentUserID).collection(K.Firestore.friendsCollectionName).document(friend.id).delete()
    }
    
    func saveMessage(_ message: Message, _ friend: Friend) throws {
        var error: Error?
        
        db.collection(K.Firestore.chatsCollectionName).document(friend.chatIDRef).collection(K.Firestore.messagesCollectionName).addDocument(data: [
            K.Firestore.Keys.sender: message.senderID,
            K.Firestore.Keys.text: message.text,
            K.Firestore.Keys.date: message.date
        ]) { err in
            if let err = err {
                print(err)
                error = err
            }
        }
        
        if let error = error { throw error }
    }
    
    func loadMessages(_ friend: Friend?, updateMessageList: @escaping ([Message]) -> Void) throws -> ListenerRegistration {
        guard let friend = friend else { fatalError("cannot get friend to load messages") }
        var error: Error?
        
        let listener = db.collection(K.Firestore.chatsCollectionName).document(friend.chatIDRef).collection(K.Firestore.messagesCollectionName).order(by: K.Firestore.Keys.date).addSnapshotListener { querySnapshot, err in
            if let err = err {
                print(err)
                error = err
            } else {
                var messages = [Message]()
                for document in querySnapshot!.documents {
                    let data = document.data()
                    if let sender = data[K.Firestore.Keys.sender] as? String,
                    let messageText = data[K.Firestore.Keys.text] as? String,
                    let date = data[K.Firestore.Keys.date] as? Double {
                        let loadedMessage = Message(senderID: sender, text: messageText, date: date)
                        messages.append(loadedMessage)
                    }
                }
                updateMessageList(messages)
            }
        }
        
        if let error = error { throw error }
        return listener
    }

}
