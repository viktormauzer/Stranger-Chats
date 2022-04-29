//
//  ViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 07.04.2022..
//

import UIKit

class WelcomeViewController: UIViewController {
    var horizontalScrollView: UIScrollView!
    var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        horizontalScrollView.delegate = self
    }
    
    
    //MARK: - ActionMethods
    
    @objc func loginPressed(_ sender: UIButton) {
        pushToEntryFormVC(userAction: .login)
    }
    
    @objc func registerPressed(_ sender: UIButton) {
        pushToEntryFormVC(userAction: .register)
    }
    
    @objc func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        horizontalScrollView.setContentOffset(CGPoint(x: CGFloat(current) * horizontalScrollView.frame.size.width, y: 0), animated: true)
    }
    
    
    //MARK: - HelperMethods
    
    func pushToEntryFormVC(userAction: UserAction) {
        let entryFormVC = EntryFormViewController()
        entryFormVC.userAction = userAction
        navigationController?.pushViewController(entryFormVC, animated: true)
    }

}
