//
//  Constants.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 08.04.2022..
//

import Foundation

struct K {
    struct Assets {
        static let logoImageName = "StrangerChatsLogo"
        static let profileImageName = "Profile"
        static let connectImageName = "Connect"
        static let friendsImageName = "Friends"
        static let handImageName = "Hand"
        static let loginRegisterImageName = "Login_Register"
        static let blankProfileImageName = "NoImage"
        static let loadingIcon = "SCLoadingIcon"
        static let messagesBackground = "messagesBackground"
    }
    
    struct TableView {
        static let friendCell = "FriendCell"
        static let messageCell = "MessageCell"
        static let messageCellSender = "MessageCellSender"
    }
    
    struct Icons {
        static let checkmark = "checkmark.seal.fill"
        static let xmark = "xmark.octagon.fill"
        static let trash = "trash.circle.fill"
        static let edit = "pencil.circle.fill"
        static let send = "paperplane.circle.fill"
    }
    
    struct Firestore {
        static let usersCollectionName = "users"
        static let friendsCollectionName = "friends"
        static let chatsCollectionName = "chats"
        static let messagesCollectionName = "messages"
        
        struct Keys {
            static let email = "email"
            static let id = "id"
            static let name = "name"
            static let userID = "userID"
            static let chatIDRef = "chatIDRef"
            static let sender = "sender"
            static let text = "text"
            static let date = "date"
            static let profileImageName = "profileImageName"
        }
    }
    
    struct Sizes {
        struct HElements {
            static let height = 40
            static let cornerRadius = 20
        }
    }
}
