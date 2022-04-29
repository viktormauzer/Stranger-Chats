//
//  Friend.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 12.04.2022..
//

import Foundation
import UIKit

struct Friend: Identifiable, Codable {
    let id: String
    let name: String
    let email: String
    let userID: String
    let chatIDRef: String
    let profileImageName: String
    
    var profileImage: UIImage? {
        if profileImageName != K.Assets.blankProfileImageName {
            let path = DocumentsDirectory.getDirectory().appendingPathComponent(profileImageName)
            if let image = UIImage(contentsOfFile: path.path) {
                return image
            } else {
                return UIImage(named: K.Assets.blankProfileImageName)
            }
        } else {
            let image = UIImage(named: K.Assets.blankProfileImageName)
            return image
        }
    }
}
