//
//  ExtensionScrollDelegate+WelcomeViewController.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 21.04.2022..
//

import UIKit

extension WelcomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.frame.size.width > 0 else { return }
        
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}
