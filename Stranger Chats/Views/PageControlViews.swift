//
//  PageControlViews.swift
//  Stranger Chats
//
//  Created by Viktor Mauzer on 21.04.2022..
//

import UIKit

struct PageControlViews {
    static func onboardingPageControl() -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .label
        pageControl.pageIndicatorTintColor = .secondaryLabel
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }
}
