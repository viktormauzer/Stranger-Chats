//
//  FirebaseAuth.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 08.04.2022..
//

import Firebase
import Foundation

struct FirebaseAuth {
    func registerUser(email: String?, password: String?, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        guard let email = email else { return }
        guard let password = password else { return }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    func loginUser(email: String?, password: String?, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        guard let email = email else { return }
        guard let password = password else { return }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func deleteUser() {
        let user = Auth.auth().currentUser
        user?.delete()
    }
    
    func logoutUser() throws {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            throw signOutError
        }
    }
    
    func isUserLoggedIn() -> Bool {
        if Auth.auth().currentUser?.uid != nil {
            return true
        } else {
            return false
        }
    }
}
