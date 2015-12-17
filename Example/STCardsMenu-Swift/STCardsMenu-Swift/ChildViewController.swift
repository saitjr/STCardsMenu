//
//  ChildViewController.swift
//  STCardsMenu-Swift
//
//  Created by TangJR on 12/17/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

import UIKit

class ChildViewController: STCardsMenuChildVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    private func setupUI() {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "WELCOME"
        welcomeLabel.textColor = UIColor.whiteColor()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        
        let centerXConstraint = NSLayoutConstraint(item: welcomeLabel, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let centerYConstraint = NSLayoutConstraint(item: welcomeLabel, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        view.addConstraints([centerXConstraint, centerYConstraint])
    }
}
