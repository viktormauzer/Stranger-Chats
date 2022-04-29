//
//  ExtensionTableViewDelegate+MessagesViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 14.04.2022..
//

import UIKit

extension MessagesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.TableView.messageCell, for: indexPath) as? MessageCell else { fatalError("cannot dequeue reusable messageCell") }
        guard let senderCell = tableView.dequeueReusableCell(withIdentifier: K.TableView.messageCellSender, for: indexPath) as? MessageCellSender else { fatalError("cannot dequeue reusable messageCellSender") }
        
        cell.selectionStyle = .none
        senderCell.selectionStyle = .none
        cell.backgroundColor = .clear
        senderCell.backgroundColor = .clear
        
        if messages[indexPath.row].senderID == fsDB.currentUserID {
            senderCell.messageText.text = messages[indexPath.row].text
            senderCell.messageDate.text = messages[indexPath.row].formattedDate
            return senderCell
        } else {
            cell.messageText.text = messages[indexPath.row].text
            cell.messageDate.text = messages[indexPath.row].formattedDate
            return cell
        }
    }
}


