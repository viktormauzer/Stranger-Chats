//
//  ExtensionLoad+AddFriendViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 11.04.2022..
//

import UIKit

extension AddFriendViewController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        profilePhotoButton = UIButton()
        profilePhotoButton.addTarget(self, action: #selector(profilePhotoButtonPressed), for: .touchUpInside)
        profilePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        
        let profileButtonOverlay = UILabel()
        profileButtonOverlay.translatesAutoresizingMaskIntoConstraints = false
        profileButtonOverlay.text = "EDIT"
        profileButtonOverlay.textColor = .white
        profileButtonOverlay.layer.cornerRadius = 10
        profileButtonOverlay.clipsToBounds = true
        profileButtonOverlay.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        profileButtonOverlay.textAlignment = .center
        
        profilePhoto = UIImageView()
        profilePhoto.translatesAutoresizingMaskIntoConstraints = false
        profilePhoto.layer.cornerRadius = 40
        profilePhoto.clipsToBounds = true
        profilePhoto.image = UIImage(named: K.Assets.blankProfileImageName)
        
        nameField = TextFieldViews.nameTextField()
        emailField = TextFieldViews.emailTextField()
        emailField.placeholder = "Enter friend's email address"
        
        let addFriendImage = ImageViews.namedImage(imageName: K.Assets.friendsImageName)
        
        let nameContainerView = ContainerViews.roundedContainer()
        let emailContainerView = ContainerViews.roundedContainer()
        
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        if let friendToEdit = friend {
            profilePhoto.image = friendToEdit.profileImage
            
            nameField.text = friendToEdit.name
            
            emailField.text = friendToEdit.email
            emailField.isEnabled = false
            emailField.textColor = .systemGray2
        }
        
        view.addSubview(container)
        nameContainerView.addSubview(nameField)
        emailContainerView.addSubview(emailField)
        container.addSubview(profilePhotoButton)
        profilePhotoButton.addSubview(profilePhoto)
        profilePhoto.addSubview(profileButtonOverlay)
        container.addSubview(nameContainerView)
        container.addSubview(emailContainerView)
        container.addSubview(addFriendImage)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: emailContainerView.bottomAnchor),
            
            profilePhotoButton.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            profilePhotoButton.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            profilePhotoButton.widthAnchor.constraint(equalToConstant: 80),
            profilePhotoButton.heightAnchor.constraint(equalToConstant: 80),
            
            nameContainerView.topAnchor.constraint(equalTo: container.topAnchor),
            nameContainerView.leadingAnchor.constraint(equalTo: profilePhotoButton.trailingAnchor, constant: 15),
            nameContainerView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15),
            nameField.centerXAnchor.constraint(equalTo: nameContainerView.centerXAnchor),
            nameField.centerYAnchor.constraint(equalTo: nameContainerView.centerYAnchor),
            nameField.widthAnchor.constraint(equalTo: nameContainerView.widthAnchor, multiplier: 0.9),
            
            profilePhoto.topAnchor.constraint(equalTo: profilePhotoButton.topAnchor),
            profilePhoto.leadingAnchor.constraint(equalTo: profilePhotoButton.leadingAnchor),
            profilePhoto.trailingAnchor.constraint(equalTo: profilePhotoButton.trailingAnchor),
            profilePhoto.bottomAnchor.constraint(equalTo: profilePhotoButton.bottomAnchor),
            
            profileButtonOverlay.centerYAnchor.constraint(equalTo: profilePhoto.centerYAnchor),
            profileButtonOverlay.centerXAnchor.constraint(equalTo: profilePhoto.centerXAnchor),
            profileButtonOverlay.widthAnchor.constraint(equalToConstant: 50),
            profileButtonOverlay.heightAnchor.constraint(equalToConstant: 20),
            
            emailContainerView.topAnchor.constraint(equalTo: nameContainerView.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            emailContainerView.leadingAnchor.constraint(equalTo: nameContainerView.leadingAnchor),
            emailContainerView.trailingAnchor.constraint(equalTo: nameContainerView.trailingAnchor),
            emailField.centerXAnchor.constraint(equalTo: emailContainerView.centerXAnchor),
            emailField.centerYAnchor.constraint(equalTo: emailContainerView.centerYAnchor),
            emailField.widthAnchor.constraint(equalTo: emailContainerView.widthAnchor, multiplier: 0.9),
            
            addFriendImage.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 80),
            addFriendImage.widthAnchor.constraint(equalToConstant: 300),
            addFriendImage.heightAnchor.constraint(equalToConstant: 300),
            addFriendImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
