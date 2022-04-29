//
//  File.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 19.04.2022..
//

import UIKit

class MessageCellSender: UITableViewCell {
    var messageText: UILabel!
    var messageBubble: UIView!
    var messageDate: UILabel!
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            messageBubble = UIView()
            messageBubble.translatesAutoresizingMaskIntoConstraints = false
            messageBubble.layer.cornerRadius = 18
            messageBubble.backgroundColor = .systemRed
            messageBubble.layer.masksToBounds = true
            addSubview(messageBubble)
            
            messageText = UILabel()
            messageText.translatesAutoresizingMaskIntoConstraints = false
            messageText.textColor = .white
            messageText.numberOfLines = 0
            messageBubble.addSubview(messageText)
            
            messageDate = UILabel()
            messageDate.translatesAutoresizingMaskIntoConstraints = false
            messageDate.font = UIFont.systemFont(ofSize: 9.0)
            messageDate.textColor = .systemGray
            addSubview(messageDate)
            
            NSLayoutConstraint.activate([
                messageBubble.topAnchor.constraint(equalTo: topAnchor, constant: 5),
                messageBubble.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
                messageBubble.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
                messageBubble.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                
                messageText.topAnchor.constraint(equalTo: messageBubble.topAnchor, constant: 10),
                messageText.leadingAnchor.constraint(equalTo: messageBubble.leadingAnchor, constant: 10),
                messageText.trailingAnchor.constraint(equalTo: messageBubble.trailingAnchor, constant: -10),
                messageText.bottomAnchor.constraint(equalTo: messageBubble.bottomAnchor, constant: -10),
                
                messageDate.trailingAnchor.constraint(equalTo: messageBubble.leadingAnchor, constant: -6),
                messageDate.bottomAnchor.constraint(equalTo: messageBubble.bottomAnchor)
            ])
            
        }
             
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
