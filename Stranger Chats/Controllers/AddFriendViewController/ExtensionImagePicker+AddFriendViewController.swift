//
//  ExtensionImagePicker+AddFriendViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 26.04.2022..
//

import UIKit

extension AddFriendViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = DocumentsDirectory.getDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.5) {
            do {
                try jpegData.write(to: imagePath)
                friendProfileImageName = imageName
                profilePhoto.image = image
            } catch {
                let ac = Alert.simpleErrorAlert("Cannot save image.")
                present(ac, animated: true)
            }
        }
        
        if let oldImageName = friend?.profileImageName {
            let oldImagePath = DocumentsDirectory.getDirectory().appendingPathComponent(oldImageName)
            try? FileManager.default.removeItem(atPath: oldImagePath.path)
        }

        dismiss(animated: true)
    }
}
