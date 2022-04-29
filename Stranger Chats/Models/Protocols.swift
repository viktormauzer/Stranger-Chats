//
//  Protocols.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 12.04.2022..
//

import Foundation

protocol AddFriendDelegate {
    func didAddFriend(_ AddFriendViewController: AddFriendViewController, friend: Friend)
    func didUpdateFriend(_ AddFriendCiewController: AddFriendViewController, friend: Friend)
}
