//
//  TableViews.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 14.04.2022..
//

import UIKit

struct TableViews {
    static func messagesTableView() -> UITableView {
        let messagesTableView = UITableView()
        messagesTableView.separatorStyle = .none
        messagesTableView.translatesAutoresizingMaskIntoConstraints = false
        return messagesTableView
    }
}
