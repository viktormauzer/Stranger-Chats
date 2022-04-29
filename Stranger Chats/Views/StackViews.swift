//
//  StackViews.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 08.04.2022..
//

import UIKit

struct StackViews {
    static func responsiveStackView(subviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = axis
        stack.spacing = spacing
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
