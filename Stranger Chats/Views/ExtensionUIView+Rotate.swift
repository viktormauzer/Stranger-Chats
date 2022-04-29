//
//  ExtensionUIView+Rotate.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 27.04.2022..
//

import UIKit

extension UIView {
    func rotate() {
            let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotation.toValue = NSNumber(value: Double.pi * 2)
            rotation.duration = 1
            rotation.isCumulative = true
            rotation.repeatCount = Float.greatestFiniteMagnitude
            self.layer.add(rotation, forKey: "rotationAnimation")
        }
}
