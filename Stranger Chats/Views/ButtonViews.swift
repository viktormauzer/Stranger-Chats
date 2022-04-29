//
//  Buttons.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 08.04.2022..
//

import UIKit

struct ButtonViews {
    static func primaryButton(title: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.heightAnchor.constraint(equalToConstant: CGFloat(K.Sizes.HElements.height)).isActive = true
        button.layer.cornerRadius = CGFloat(K.Sizes.HElements.cornerRadius)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        /*
        button.layer.shadowColor = UIColor.systemRed.cgColor
        button.layer.shadowRadius = 15
        button.layer.shadowOpacity = 0.4
         */
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func secondaryButton(title: String) -> UIButton {
        let button = UIButton()
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.label.cgColor
        button.setTitle(title, for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    static func sendButton() -> UIButton {
        let button = UIButton()
        //let buttonIcon = UIImage(systemName: K.Icons.send)
        //button.setImage(buttonIcon, for: .normal)
        button.tintColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
