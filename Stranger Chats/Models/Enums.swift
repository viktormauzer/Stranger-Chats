//
//  Enums.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 11.04.2022..
//

import Foundation

enum UserAction {
    case login, register
}

enum LoadingError: Error {
    case typecastFailed, loadFromDBFailed
}
