//
//  ViewController.swift
//  STCardsMenu-Swift
//
//  Created by TangJR on 12/15/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let rootVC = RootViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addChildViewController(rootVC)
        view.addSubview(rootVC.view)
        
        setupChildViewControllers()
    }
    
    private func setupChildViewControllers() {
        let titles = ["CONTACT", "ABOUT", "TEAM", "PROJECTS"]
        let tintColors = [UIColor(st_hex: 0xF18264), UIColor(st_hex: 0xFEE177), UIColor(st_hex: 0x553860), UIColor(st_hex: 0xA5435D)]
        let backgroundColors = [UIColor(st_hex: 0x553860), UIColor(st_hex: 0xA5435D), UIColor(st_hex: 0xF18264), UIColor(st_hex: 0xFEE177)]
        for i in 0 ..< 4 {
            let childVC = ChildViewController()
            childVC.view.backgroundColor = backgroundColors[i]
            childVC.title = titles[i]
            childVC.tintColor = tintColors[i]
            rootVC.view.addSubview(childVC.view)
            rootVC.addChildViewController(childVC)
        }
    }
}