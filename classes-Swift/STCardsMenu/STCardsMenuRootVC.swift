//
//  STCardsMenuRootVC.swift
//  STCardsMenu-Swift
//
//  Created by TangJR on 12/15/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

import UIKit

class STCardsMenuRootVC: UIViewController {
    
    var childCount: Int = 0
    var lastSelectIndex: Int = 0
    let closeButton = STCardsMenuCloseButton()
    let clearWindow = STCardsMenuClearWindow()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(st_hex: 0xCDDBED)
        setupCloseButton()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        childCount = childViewControllers.count
        for i in 0 ..< childCount {
            let childVC = childViewControllers[i] as! STCardsMenuChildVC
            childVC.view.transform = CGAffineTransformMakeTranslation(CGFloat(i + 1) * STCardsMenuConst.VCX, CGFloat(i + 1) * STCardsMenuConst.VCY)
            childVC.view.layer.cornerRadius = 8.0
            childVC.delegate = self
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setupClearWindow()
    }
}

extension STCardsMenuRootVC: STCardsMenuChildVCDelegate {
    func hamburgButtonTapped(childVC: STCardsMenuChildVC, hamburgButton: STCardsMenuHamburgButton) {
        STCardsMenuAnimation.closeButtonShowAnimation(closeButton)
        STCardsMenuAnimation.hamburgButtonHideAnimation(hamburgButton, titleLabel: childVC.titleLabel)
        for i in 0 ..< childCount {
            let childVC = childViewControllers[i] as! STCardsMenuChildVC
            clearWindow.show()
            STCardsMenuAnimation.cardsMenuScaleLittleAnimation(childVC.view, point: CGPointMake((CGFloat(i) + 1.0) * STCardsMenuConst.VCX, (CGFloat(i) + 1.0) * STCardsMenuConst.VCY))
        }
    }
}

extension STCardsMenuRootVC: STCardsMenuClearWindowDelegate {
    func clearWindowTouched(clearWindow: STCardsMenuClearWindow, touchPoint: CGPoint) {
        if CGRectContainsPoint(closeButton.frame, touchPoint) {
            clickAtIndex(lastSelectIndex)
            return
        }
        for i in 0 ..< childCount {
            let childVC = childViewControllers[childCount - i - 1] as! STCardsMenuChildVC
            let isInside = CGRectContainsPoint(childVC.view.frame, touchPoint)
            if isInside {
                clickAtIndex(childCount - i - 1)
                break
            }
        }
    }
}

extension STCardsMenuRootVC {
    private func clickAtIndex(selectIndex: Int) {
        guard selectIndex <= childCount else {
            return
        }
        clearWindow.hide()
        lastSelectIndex = selectIndex
        let currentChildVC = childViewControllers[selectIndex] as! STCardsMenuChildVC
        STCardsMenuAnimation.hamburgButtonShowAnimation(currentChildVC.hamburgButton, titleLabel: currentChildVC.titleLabel)
        STCardsMenuAnimation.closeButtonHideAnimation(closeButton)
        for i in 0 ... selectIndex {
            let childVC = childViewControllers[i] as! STCardsMenuChildVC
            STCardsMenuAnimation.cardsMenuIdentityAnimation(childVC.view)
        }
        for i in selectIndex + 1 ..< childCount {
            let childVC = childViewControllers[i] as! STCardsMenuChildVC
            STCardsMenuAnimation.cardsMenuToRightAnimation(childVC.view)
        }
    }
    
    func closeButtonTapped(sender: UIButton) {
        clickAtIndex(lastSelectIndex)
    }
}

extension STCardsMenuRootVC {
    private func setupCloseButton() {
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        let leftConstraint = NSLayoutConstraint(item: closeButton, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: STCardsMenuConst.VCX)
        let topConstraint = NSLayoutConstraint(item: closeButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: STCardsMenuConst.VCX)
        let widthConstraint = NSLayoutConstraint(item: closeButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
        let heightConstraint = NSLayoutConstraint(item: closeButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
        closeButton.addConstraints([widthConstraint, heightConstraint])
        view.addConstraints([leftConstraint, topConstraint])
    }
    
    private func setupClearWindow() {
        clearWindow.delegate = self
        clearWindow.show()
    }
}