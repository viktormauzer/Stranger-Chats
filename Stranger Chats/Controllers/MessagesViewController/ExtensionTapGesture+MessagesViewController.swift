//
//  ExtensionTapGesture+MessagesViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 19.04.2022..
//

import UIKit

extension MessagesViewController {
    func setupHideKeyboardOnTap() {
        self.messagesTableView.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }

    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}
