//
//  ScrollViews.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 21.04.2022..
//

import UIKit

struct ScrollViews {
    static func horizontalScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }
}
