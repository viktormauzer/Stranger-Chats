//
//  SlideViews.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 21.04.2022..
//

import UIKit

struct SlideViews {
    static func slide(_ scrollView: UIScrollView, imageName: String, text: String) -> UIView {
        let slide = UIView()
        slide.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        
        let textLabel = UILabel()
        textLabel.text = text
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        
        let vStack = StackViews.responsiveStackView(subviews: [imageView, textLabel], axis: .vertical, spacing: 25)
        
        slide.addSubview(vStack)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            vStack.topAnchor.constraint(equalTo: slide.topAnchor),
            vStack.centerXAnchor.constraint(equalTo: slide.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: slide.centerYAnchor),
            vStack.bottomAnchor.constraint(equalTo: slide.bottomAnchor)
        ])
        
        return slide
    }
}
