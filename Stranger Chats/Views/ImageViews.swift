//
//  ImageViews.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 08.04.2022..
//

import UIKit

struct ImageViews {
    static func namedImage(imageName: String) -> UIImageView {
        let logo = UIImageView()
        logo.image = UIImage(named: imageName)
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }
}
