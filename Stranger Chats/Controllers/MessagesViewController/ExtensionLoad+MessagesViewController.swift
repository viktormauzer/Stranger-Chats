//
//  ExtensionLoad+MessagesViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 14.04.2022..
//

import UIKit

extension MessagesViewController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = .secondarySystemBackground
        
        messagesTableView = TableViews.messagesTableView()
        messageTextField = TextFieldViews.messageTextField()
        
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: K.Assets.messagesBackground)
        
        let messageFieldContainerView = ContainerViews.roundedContainer()
        messageFieldContainerView.addSubview(messageTextField)
        
        let buttonIcon = UIImageView()
        buttonIcon.image = UIImage(systemName: K.Icons.send)
        buttonIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let sendButton = ButtonViews.sendButton()
        sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
        sendButton.addSubview(buttonIcon)
        
        let hStack = StackViews.responsiveStackView(subviews: [messageFieldContainerView, sendButton], axis: .horizontal, spacing: 10)
        vStack = StackViews.responsiveStackView(subviews: [messagesTableView, hStack], axis: .vertical, spacing: 0)
        
        hStack.isLayoutMarginsRelativeArrangement = true
        vStack.isLayoutMarginsRelativeArrangement = true
        
        hStack.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        hStack.backgroundColor = .secondarySystemBackground
        hStack.alignment = .center
        
        view.addSubview(vStack)
        messagesTableView.backgroundView = backgroundImage
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            messagesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            messagesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messagesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            vStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            hStack.heightAnchor.constraint(equalToConstant: 60),
            
            messageTextField.centerXAnchor.constraint(equalTo: messageFieldContainerView.centerXAnchor),
            messageTextField.centerYAnchor.constraint(equalTo: messageFieldContainerView.centerYAnchor),
            messageTextField.widthAnchor.constraint(equalTo: messageFieldContainerView.widthAnchor, multiplier: 0.9),
            
            sendButton.widthAnchor.constraint(equalToConstant: 35),
            sendButton.heightAnchor.constraint(equalToConstant: 35),
            
            buttonIcon.widthAnchor.constraint(equalTo: sendButton.widthAnchor),
            buttonIcon.heightAnchor.constraint(equalTo: sendButton.heightAnchor),
            buttonIcon.centerXAnchor.constraint(equalTo: sendButton.centerXAnchor),
            buttonIcon.centerYAnchor.constraint(equalTo: sendButton.centerYAnchor)
        ])
    }
}
