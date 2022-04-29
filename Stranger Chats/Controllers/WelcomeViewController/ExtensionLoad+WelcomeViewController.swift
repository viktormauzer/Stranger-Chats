//
//  ExtensionLoad+WelcomeViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 08.04.2022..
//

import UIKit

extension WelcomeViewController {
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        horizontalScrollView = ScrollViews.horizontalScrollView()
        
        let slide1 = SlideViews.slide(horizontalScrollView, imageName: K.Assets.friendsImageName, text: "Communicate with your strange friends online")
        let slide2 = SlideViews.slide(horizontalScrollView, imageName: K.Assets.connectImageName, text: "Connect with people via their email address")
        let slide3 = SlideViews.slide(horizontalScrollView, imageName: K.Assets.profileImageName, text: "Create your profile or log in now and start chatting")
        
        let slides = [slide1, slide2, slide3]
        
        let hStack = StackViews.responsiveStackView(subviews: slides, axis: .horizontal, spacing: 0)
        
        pageControl = PageControlViews.onboardingPageControl()
        pageControl.numberOfPages = slides.count
        pageControl.addTarget(self, action: #selector(pageControlDidChange), for: .valueChanged)
        
        let vStack = StackViews.responsiveStackView(subviews: [horizontalScrollView, pageControl], axis: .vertical, spacing: 0)
        
        let loginButton = ButtonViews.primaryButton(title: "Login")
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        
        let registerButton = ButtonViews.secondaryButton(title: "Register")
        registerButton.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        
        
        view.addSubview(vStack)
        vStack.addSubview(horizontalScrollView)
        horizontalScrollView.addSubview(hStack)
        vStack.addSubview(pageControl)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        for slide in slides {
            slide.widthAnchor.constraint(equalTo: horizontalScrollView.widthAnchor).isActive = true
        }
        
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vStack.heightAnchor.constraint(equalToConstant: 380),
            
            horizontalScrollView.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            horizontalScrollView.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
            horizontalScrollView.bottomAnchor.constraint(equalTo: pageControl.topAnchor),
            
            hStack.topAnchor.constraint(equalTo: horizontalScrollView.topAnchor),
            hStack.leadingAnchor.constraint(equalTo: horizontalScrollView.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: horizontalScrollView.trailingAnchor),
            hStack.bottomAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor),
            
            pageControl.topAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 60),
            pageControl.leadingAnchor.constraint(equalTo: horizontalScrollView.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: horizontalScrollView.trailingAnchor),
            
            loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -10),
            
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            registerButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
