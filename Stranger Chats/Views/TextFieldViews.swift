//
//  TextFieldViews.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 08.04.2022..
//

import UIKit

struct TextFieldViews {
    static func nameTextField() -> UITextField {
        let nameField = UITextField()
        nameField.placeholder = "Enter friend's name"
        nameField.textContentType = .name
        nameField.translatesAutoresizingMaskIntoConstraints = false
        return nameField
    }
    
    static func emailTextField() -> UITextField {
        let emailField = UITextField()
        emailField.keyboardType = .emailAddress
        emailField.placeholder = "Enter your email address"
        emailField.textContentType = .emailAddress
        emailField.autocapitalizationType = .none
        emailField.translatesAutoresizingMaskIntoConstraints = false
        return emailField
    }
    
    static func passwordTextField() -> UITextField {
        let passwordField = UITextField()
        passwordField.isSecureTextEntry = true
        passwordField.textContentType = .password
        passwordField.placeholder = "Enter your password"
        passwordField.autocapitalizationType = .none
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }
    
    static func messageTextField() -> UITextField {
        let messageField = UITextField()
        messageField.placeholder = "Your message..."
        messageField.translatesAutoresizingMaskIntoConstraints = false
        return messageField
    }
}
