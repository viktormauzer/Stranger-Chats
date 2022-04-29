//
//  Message.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 14.04.2022..
//

import Foundation

struct Message {
    let senderID: String
    let text: String
    let date: Double
    
    var formattedDate: String {
        let dateSent = Date(timeIntervalSince1970: date)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: dateSent)
    }
}
