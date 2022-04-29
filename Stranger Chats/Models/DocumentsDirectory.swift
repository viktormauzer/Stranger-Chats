//
//  DocumentsDirectory.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 26.04.2022..
//

import Foundation

struct DocumentsDirectory {
    static func getDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
