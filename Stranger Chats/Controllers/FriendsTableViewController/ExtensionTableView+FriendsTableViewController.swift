//
//  ExtensionTableView+FriendsTableViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 12.04.2022..
//

import UIKit

extension FriendsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.TableView.friendCell, for: indexPath) as? FriendCell else { fatalError("Cannot dequeue friendcell") }
        
        cell.selectionStyle = .none
        
        cell.friendNameText.text = friends[indexPath.row].name
        cell.friendEmailText.text = friends[indexPath.row].email
        cell.friendProfilePhoto.image = friends[indexPath.row].profileImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] _, _, _ in
            if let friendToDelete = self?.friends[indexPath.row] {
                let imagePath = DocumentsDirectory.getDirectory().appendingPathComponent(friendToDelete.profileImageName)
                try? FileManager.default.removeItem(atPath: imagePath.path)
                
                self?.fsDB.deleteFriend(friendToDelete)
                self?.friends.remove(at: indexPath.row)
                self?.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
        
        deleteAction.image = UIImage(systemName: K.Icons.trash)?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        deleteAction.backgroundColor = .systemBackground
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: nil) { [weak self] _, _, _ in
            if let friendToEdit = self?.friends[indexPath.row] {
                let addFriendVC = AddFriendViewController()
                addFriendVC.delegate = self
                addFriendVC.friend = friendToEdit
                self?.friendIndexPath = indexPath
                
                let navigationController = UINavigationController(rootViewController: addFriendVC)
                self?.present(navigationController, animated: true)
            }
        }
        
        editAction.image = UIImage(systemName: K.Icons.edit)?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        editAction.backgroundColor = .systemBackground
        
        let config = UISwipeActionsConfiguration(actions: [editAction])
        return config
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let messagesViewController = MessagesViewController()
        messagesViewController.friend = friends[indexPath.row]
        navigationController?.pushViewController(messagesViewController, animated: true)
    }
}
