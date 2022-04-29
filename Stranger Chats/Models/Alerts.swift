//
//  Alerts.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 11.04.2022..
//

import Foundation
import UIKit

struct Alert {
    static func simpleErrorAlert(_ error: String) -> UIAlertController {
        let ac = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        return ac
    }
}
