//
//  ExtensionTextFieldDelegate+AddFriendViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 11.04.2022..
//

import UIKit

extension AddFriendViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        emailTextFieldStartedTyping()
        
        typingTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {  _ in
            self.timerSeconds += 1
            
            if self.timerSeconds == 2 {
                Task {
                    do {
                        let userExists = try await self.fsDB.checkIfUserExists(textField.text)
                        if userExists {
                            self.enableAddFriend()
                        } else {
                            self.disableAddFriend()
                        }
                    } catch {
                        let ac = Alert.simpleErrorAlert("Cannot connect to database")
                        self.present(ac, animated: true)
                    }
                }
            }
        })
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        timerSeconds = 0
        emailTextFieldStartedTyping()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        typingTimer?.invalidate()
    }
    
    func emailTextFieldStartedTyping() {
        let textFieldActivityIndicator = UIActivityIndicatorView()
        textFieldActivityIndicator.startAnimating()
        emailField.rightView = textFieldActivityIndicator
        emailField.rightViewMode = .always
    }
}
