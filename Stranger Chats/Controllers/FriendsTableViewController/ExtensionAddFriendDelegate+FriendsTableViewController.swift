//
//  ExtensionAddFriendDelegate+FriendsTableViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 12.04.2022..
//

import UIKit

extension FriendsTableViewController: AddFriendDelegate {
    func didAddFriend(_ AddFriendViewController: AddFriendViewController, friend: Friend) {
        friends.append(friend)
        loadFriends()
    }
    
    func didUpdateFriend(_ AddFriendCiewController: AddFriendViewController, friend: Friend) {
        if let friendIndexPath = friendIndexPath {
            friends[friendIndexPath.row] = friend
            loadFriends()
        }
    }
}
