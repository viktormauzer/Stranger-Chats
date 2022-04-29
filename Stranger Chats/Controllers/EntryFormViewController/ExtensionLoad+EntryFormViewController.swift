//
//  ExtensionLoad+EntryFormViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 08.04.2022..
//

import UIKit

extension EntryFormViewController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        let container = UIScrollView()
        let screenRect = UIScreen.main.bounds
        container.contentSize = CGSize(width: screenRect.size.width, height: screenRect.size.height)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let loginRegisterImage = ImageViews.namedImage(imageName: K.Assets.loginRegisterImageName)
        
        emailTextField = TextFieldViews.emailTextField()
        passwordTextField = TextFieldViews.passwordTextField()
        
        let emailFieldContainer = ContainerViews.roundedContainer()
        let passwordFieldContainer = ContainerViews.roundedContainer()
        emailFieldContainer.addSubview(emailTextField)
        passwordFieldContainer.addSubview(passwordTextField)
        
        let submitButton = ButtonViews.primaryButton(title: "Submit")
        addTargetToSubmitButton(submitButton)
        
        let vStack = StackViews.responsiveStackView(subviews: [emailFieldContainer, passwordFieldContainer, submitButton], axis: .vertical, spacing: 10)
        
        view.addSubview(container)
        container.addSubview(vStack)
        container.addSubview(loginRegisterImage)
        vStack.addSubview(emailFieldContainer)
        vStack.addSubview(passwordFieldContainer)
        vStack.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
             
            vStack.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            vStack.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.9),
            
            emailTextField.centerYAnchor.constraint(equalTo: emailFieldContainer.centerYAnchor),
            emailTextField.centerXAnchor.constraint(equalTo: emailFieldContainer.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: passwordFieldContainer.centerYAnchor),
            passwordTextField.centerXAnchor.constraint(equalTo: passwordFieldContainer.centerXAnchor),
            
            emailTextField.widthAnchor.constraint(equalTo: emailFieldContainer.widthAnchor, multiplier: 0.9),
            passwordTextField.widthAnchor.constraint(equalTo: passwordFieldContainer.widthAnchor, multiplier: 0.9),
            
            loginRegisterImage.bottomAnchor.constraint(equalTo: vStack.topAnchor),
            loginRegisterImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginRegisterImage.widthAnchor.constraint(equalToConstant: 200),
            loginRegisterImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
