//
//  FriendCell.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 26.04.2022..
//

import UIKit

class FriendCell: UITableViewCell {
    var friendNameText: UILabel!
    var friendEmailText: UILabel!
    var friendProfilePhoto: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .systemFill
        container.layer.cornerRadius = 20
        addSubview(container)
        
        friendNameText = UILabel()
        friendNameText.translatesAutoresizingMaskIntoConstraints = false
        
        friendEmailText = UILabel()
        friendEmailText.textColor = .secondaryLabel
        friendEmailText.font = UIFont.systemFont(ofSize: 14)
        friendEmailText.translatesAutoresizingMaskIntoConstraints = false
        
        let textVStack = StackViews.responsiveStackView(subviews: [friendNameText, friendEmailText], axis: .vertical, spacing: 0)
        container.addSubview(textVStack)
        
        textVStack.addSubview(friendNameText)
        textVStack.addSubview(friendEmailText)
        
        friendProfilePhoto = UIImageView()
        friendProfilePhoto.layer.cornerRadius = 30
        friendProfilePhoto.clipsToBounds = true
        friendProfilePhoto.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(friendProfilePhoto)
        
        lazy var disclosureIndicator = UIImageView()
        disclosureIndicator.translatesAutoresizingMaskIntoConstraints = false
        disclosureIndicator.image = UIImage(named: K.Assets.handImageName)
        
        container.addSubview(disclosureIndicator)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor, constant: 7.5),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7.5),
            
            friendProfilePhoto.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            friendProfilePhoto.widthAnchor.constraint(equalToConstant: 60),
            friendProfilePhoto.heightAnchor.constraint(equalToConstant: 60),
            friendProfilePhoto.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            disclosureIndicator.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            disclosureIndicator.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            disclosureIndicator.widthAnchor.constraint(equalToConstant: 45),
            disclosureIndicator.heightAnchor.constraint(equalToConstant: 45),
            
            textVStack.topAnchor.constraint(equalTo: container.topAnchor, constant: 15),
            textVStack.leadingAnchor.constraint(equalTo: friendProfilePhoto.trailingAnchor, constant: 10),
            textVStack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -15),
            textVStack.trailingAnchor.constraint(equalTo: disclosureIndicator.leadingAnchor, constant: -7.5),
            
            friendNameText.heightAnchor.constraint(equalToConstant: 25),
            friendEmailText.heightAnchor.constraint(equalTo: friendNameText.heightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
