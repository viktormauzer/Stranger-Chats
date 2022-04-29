//
//  AddFriendViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 11.04.2022..
//

import UIKit

class AddFriendViewController: UIViewController {
    var nameField: UITextField!
    var emailField: UITextField!
    var profilePhoto: UIImageView!
    var profilePhotoButton: UIButton!
    
    var friend: Friend?
    var friendProfileImageName: String?
    
    let fsDB = FirestoreDB()
    var delegate: AddFriendDelegate?
    
    var typingTimer: Timer?
    var timerSeconds = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    
    //MARK: - ActionMethods
    
    @objc func addFriendPressed(_ sender: UIButton) {
        let name = nameField.text
        let email = emailField.text
        let profileImageName = friendProfileImageName ?? K.Assets.blankProfileImageName
        
        Task {
            if let friendToEdit = friend {
                let editedFriend = Friend(id: friendToEdit.id, name: name ?? "Friend", email: friendToEdit.email, userID: friendToEdit.userID, chatIDRef: friendToEdit.chatIDRef, profileImageName: profileImageName)
                await fsDB.addFriend(friend: editedFriend)
                delegate?.didUpdateFriend(self, friend: editedFriend)
            } else {
                let friendUserID = await fsDB.getFriendUserID(email)
                let newFriend = Friend(id: UUID().uuidString, name: name ?? "Friend", email: email ?? "", userID: friendUserID, chatIDRef: "", profileImageName: profileImageName)
                await fsDB.addFriend(friend: newFriend)
                delegate?.didAddFriend(self, friend: newFriend)
            }
        }
        dismiss(animated: true)
    }
    
    @objc func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc func profilePhotoButtonPressed(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        let ac = UIAlertController(title: "Edit", message: "Take new photo or get one from your library.", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Take photo", style: .default, handler: { [weak self] _ in
            picker.sourceType = .camera
            self?.present(picker, animated: true)
        }))
        
        ac.addAction(UIAlertAction(title: "Library", style: .default, handler: { [weak self] _ in
            picker.sourceType = .photoLibrary
            self?.present(picker, animated: true)
        }))
        
        ac.addAction(UIAlertAction(title: "Default", style: .default, handler: { [weak self] _ in
            if let oldImageName = self?.friend?.profileImageName {
                let oldImagePath = DocumentsDirectory.getDirectory().appendingPathComponent(oldImageName)
                try? FileManager.default.removeItem(atPath: oldImagePath.path)
            }
            self?.profilePhoto.image = UIImage(named: K.Assets.blankProfileImageName)
        }))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
    
    //MARK: - HelperMethods
    
    func setupViewController() {
        emailField.delegate = self
        
        var rightButtonTitle = "Add friend"
        if friend != nil { rightButtonTitle = "Edit friend" }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: rightButtonTitle, style: .done, target: self, action: #selector(addFriendPressed))
        
        if friend == nil { navigationItem.rightBarButtonItem?.isEnabled = false }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelPressed))
    }
    
    func enableAddFriend() {
        let checkMarkView = UIImageView()
        checkMarkView.image = UIImage(systemName: K.Icons.checkmark)?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        navigationItem.rightBarButtonItem?.isEnabled = true
        emailField.rightView = checkMarkView
    }
    
    func disableAddFriend() {
        let userNotFoundView = UIImageView()
        userNotFoundView.image = UIImage(systemName: K.Icons.xmark)?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        emailField.rightView = userNotFoundView
        navigationItem.rightBarButtonItem?.isEnabled = false
    }

}
