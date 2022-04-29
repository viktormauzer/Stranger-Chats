//
//  ActivityIndicatorView.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 08.04.2022..
//

import UIKit

struct ActivityIndicatorView {
    static func start(view: UIView) -> UIView {
        let activityIndicatorView = UIView()
        activityIndicatorView.backgroundColor = .secondarySystemBackground
        activityIndicatorView.layer.shadowColor = UIColor.black.cgColor
        activityIndicatorView.layer.shadowOpacity = 0.2
        activityIndicatorView.layer.shadowOffset = .zero
        activityIndicatorView.layer.shadowRadius = 15
        activityIndicatorView.layer.cornerRadius = 20
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicatorView)
        
        let logo = UIImageView()
        logo.image = UIImage(named: K.Assets.logoImageName)
        logo.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.addSubview(logo)
        
        let loadingIcon = UIImageView()
        loadingIcon.image = UIImage(named: K.Assets.loadingIcon)
        loadingIcon.translatesAutoresizingMaskIntoConstraints = false
        loadingIcon.rotate()
        activityIndicatorView.addSubview(loadingIcon)
        
        NSLayoutConstraint.activate([
            activityIndicatorView.widthAnchor.constraint(equalToConstant: 180),
            activityIndicatorView.heightAnchor.constraint(equalToConstant: 200),
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            logo.topAnchor.constraint(equalTo: activityIndicatorView.topAnchor, constant: 20),
            logo.centerXAnchor.constraint(equalTo: activityIndicatorView.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 120),
            logo.heightAnchor.constraint(equalToConstant: 120),
            
            loadingIcon.bottomAnchor.constraint(equalTo: activityIndicatorView.bottomAnchor, constant: -20),
            loadingIcon.centerXAnchor.constraint(equalTo: activityIndicatorView.centerXAnchor),
            loadingIcon.widthAnchor.constraint(equalToConstant: 30),
            loadingIcon.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        return activityIndicatorView
    }
    
    static func stop(_ view: UIView?, activityIndicatorView: UIView) {
        guard let view = view else { return }
        if activityIndicatorView.isDescendant(of: view) {
            activityIndicatorView.removeFromSuperview()
        }
    }
}
