//
//  ContainerViews.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 25.04.2022..
//

import UIKit

struct ContainerViews {
    static func roundedContainer() -> UIView {
        let roundedContainer = UIView()
        roundedContainer.backgroundColor = .systemFill
        roundedContainer.heightAnchor.constraint(equalToConstant: CGFloat(K.Sizes.HElements.height)).isActive = true
        roundedContainer.layer.cornerRadius = CGFloat(K.Sizes.HElements.cornerRadius)
        
        roundedContainer.translatesAutoresizingMaskIntoConstraints = false
        return roundedContainer
    }
}
