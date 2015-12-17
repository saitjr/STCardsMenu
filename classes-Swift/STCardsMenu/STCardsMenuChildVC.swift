//
//  STCardsMenuChildVC.swift
//  STCardsMenu-Swift
//
//  Created by TangJR on 12/15/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

import UIKit

protocol STCardsMenuChildVCDelegate: class {
    
    func hamburgButtonTapped(childVC: STCardsMenuChildVC, hamburgButton: STCardsMenuHamburgButton)
}

class STCardsMenuChildVC: UIViewController {
    
    var tintColor: UIColor?
    weak var delegate: STCardsMenuChildVCDelegate?
    let hamburgButton = STCardsMenuHamburgButton()
    let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupHamburgButton()
        setupTitlabel()
    }
}

extension STCardsMenuChildVC {
    private func setupHamburgButton() {
        view.addSubview(hamburgButton)
        hamburgButton.hidden = true
        hamburgButton.tintColor = tintColor
        hamburgButton.addTarget(self, action: Selector("hamburgButtonTapped:"), forControlEvents: .TouchUpInside)
        hamburgButton.translatesAutoresizingMaskIntoConstraints = false
        let leftConstraint = NSLayoutConstraint(item: hamburgButton, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 20.0)
        let topConstriant = NSLayoutConstraint(item: hamburgButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 20.0)
        let widthConstraint = NSLayoutConstraint(item: hamburgButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40.0)
        let heightConstraint =  NSLayoutConstraint(item: hamburgButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
        hamburgButton.addConstraints([widthConstraint, heightConstraint])
        view.addConstraints([leftConstraint, topConstriant])
    }
    
    private func setupTitlabel() {
        view.addSubview(titleLabel)
        titleLabel.text = title
        titleLabel.textColor = tintColor
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        let leftConstraint = NSLayoutConstraint(item: titleLabel, attribute: .Left, relatedBy: .Equal, toItem: view, attribute: .Left, multiplier: 1.0, constant: 10.0)
        let topConstraint = NSLayoutConstraint(item: titleLabel, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 10.0)
        let heightConstraint = NSLayoutConstraint(item: titleLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
        titleLabel.addConstraints([heightConstraint])
        view.addConstraints([leftConstraint, topConstraint])
    }
}

extension STCardsMenuChildVC {
    func hamburgButtonTapped(sender: STCardsMenuHamburgButton) {
        delegate?.hamburgButtonTapped(self, hamburgButton: sender)
    }
}