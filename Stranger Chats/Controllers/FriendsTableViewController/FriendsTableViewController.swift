//
//  FriendsTableViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 08.04.2022..
//

import UIKit

class FriendsTableViewController: UITableViewController {
    var friendIndexPath: IndexPath?
    
    let fbAuth = FirebaseAuth()
    let fsDB = FirestoreDB()
    
    var friends = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    
    //MARK: - ActionMethods
    
    @objc func addButtonPressed(_ sender: UIButton) {
        let addFriendFormVC = AddFriendViewController()
        addFriendFormVC.delegate = self
        
        let newNavigationController = UINavigationController(rootViewController: addFriendFormVC)
        present(newNavigationController, animated: true)
    }
    
    @objc func logoutButtonPressed(_ sender: UIButton) {
        do {
            try fbAuth.logoutUser()
            let welcomeViewController = WelcomeViewController()
            let newNavigationController = UINavigationController(rootViewController: welcomeViewController)
            view.window?.rootViewController = newNavigationController
        } catch {
            let ac = Alert.simpleErrorAlert("Error logging out")
            present(ac, animated: true)
        }
    }
    
    
    //MARK: - HelperMethods
    
    func setupViewController() {
        title = "Friends"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonPressed))
        
        tableView.register(FriendCell.self, forCellReuseIdentifier: K.TableView.friendCell)
        tableView.separatorStyle = .none
        
        loadFriends()
    }
    
    func loadFriends() {
        let activityIndicator = ActivityIndicatorView.start(view: (navigationController?.view) ?? view)
        
        Task {
            do {
                if let loadedFriends = try await fsDB.loadFriends() {
                    friends = loadedFriends
                    tableView.reloadData()
                    ActivityIndicatorView.stop(navigationController?.view, activityIndicatorView: activityIndicator)
                }
            } catch {
                let ac = Alert.simpleErrorAlert("Can't load friends from database.")
                present(ac, animated: true)
            }
        }
    }

}
