//
//  MessagesViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 14.04.2022..
//

import Firebase
import UIKit

class MessagesViewController: UIViewController {
    var messageTextField: UITextField!
    var messagesTableView: UITableView!
    var vStack: UIStackView!
    
    var friend: Friend?
    var messages = [Message]()
    
    let fsDB = FirestoreDB()
    var listener: ListenerRegistration?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        listener = loadMessages()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        listener?.remove()
    }
    
    
    //MARK: - ActionMethods
    
    @objc func sendButtonPressed(_ sender: UIButton) {
        guard let messageText = messageTextField.text else { return }
        guard let friend = friend else { return }
        
        if messageText != "" {
            let newMessage = Message(senderID: fsDB.currentUserID, text: messageText, date: Date().timeIntervalSince1970)
            messages.append(newMessage)
            messageTextField.text = ""
            
            do {
                try fsDB.saveMessage(newMessage, friend)
            } catch {
                let ac = Alert.simpleErrorAlert("Sending message failed.")
                present(ac, animated: true)
            }
        }
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        let keyboardHeight = keyboardViewEndFrame.height - view.safeAreaInsets.bottom
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            vStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            vStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        }
    }
    
    
    //MARK: - HelperMethods
    
    func setupViewController() {
        title = friend?.name
        
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        messagesTableView.register(MessageCell.self, forCellReuseIdentifier: K.TableView.messageCell)
        messagesTableView.register(MessageCellSender.self, forCellReuseIdentifier: K.TableView.messageCellSender)
        
        setupNotificationCenter()
        self.setupHideKeyboardOnTap()
    }
    
    func setupNotificationCenter() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func loadMessages() -> ListenerRegistration? {
        let activityIndicator = ActivityIndicatorView.start(view: navigationController?.view ?? view)
        var listener: ListenerRegistration?
        
        do {
           listener = try fsDB.loadMessages(friend) { [weak self] fetchedMessages in
                self?.messages = fetchedMessages
                self?.messagesTableView.reloadData()
                
                self?.scrollToBottom()
                ActivityIndicatorView.stop(self?.navigationController?.view, activityIndicatorView: activityIndicator)
            }
            return listener
        } catch {
            let ac = Alert.simpleErrorAlert("Can't load messages from database.")
            present(ac, animated: true)
        }
        return listener
    }
    
    func scrollToBottom() {
        if messages.count != 0 {
            let indexPath = IndexPath(row: messages.count - 1, section: 0)
            messagesTableView.scrollToRow(at: indexPath, at: .none, animated: false)
        }
    }
    
}
