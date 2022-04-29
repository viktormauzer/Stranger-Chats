//
//  EntryFormViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 08.04.2022..
//

import UIKit

class EntryFormViewController: UIViewController {
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    
    var userAction: UserAction?
    
    let fbAuth = FirebaseAuth()
    let fsDB = FirestoreDB()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    
    //MARK: - ActionMethods
    
    @objc func loginUser(_ sender: UIButton) {
        let activityIndicator = ActivityIndicatorView.start(view: view)
        
        fbAuth.loginUser(email: emailTextField.text, password: passwordTextField.text) { [weak self] _, err in
            ActivityIndicatorView.stop(self?.view, activityIndicatorView: activityIndicator)
            
            if let err = err {
                let ac = Alert.simpleErrorAlert(err.localizedDescription)
                self?.present(ac, animated: true)
            } else {
                self?.pushToFriendsVC()
            }
        }
    }
    
    @objc func registerUser(_ sender: UIButton) {
        let activityIndicator = ActivityIndicatorView.start(view: view)
        
        fbAuth.registerUser(email: emailTextField.text, password: passwordTextField.text) { [weak self] _, err in
            ActivityIndicatorView.stop(self?.view, activityIndicatorView: activityIndicator)
            
            if let err = err {
                let ac = Alert.simpleErrorAlert(err.localizedDescription)
                self?.present(ac, animated: true)
            } else {
                do {
                    try self?.fsDB.saveUser(userEmail: self?.emailTextField.text)
                    self?.pushToFriendsVC()
                } catch {
                    self?.fbAuth.deleteUser()
                    let ac = Alert.simpleErrorAlert("Saving user to database failed.")
                    self?.present(ac, animated: true)
                }
            }
        }
    }
    
    
    //MARK: - HelperMethods
    
    func setupViewController() {
        title = userAction == .login ? "Login" : "Register"
        setupHideKeyboardOnTap()
    }
    
    func addTargetToSubmitButton(_ button: UIButton) {
        if userAction == .login {
            button.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        } else if userAction == .register {
            button.addTarget(self, action: #selector(registerUser), for: .touchUpInside)
        } else {
            button.addTarget(self, action: #selector(registerUser), for: .touchUpInside)
        }
    }
    
    func pushToFriendsVC() {
        let friendsVC = FriendsTableViewController()
        navigationController?.pushViewController(friendsVC, animated: true)
    }

}
