//
//  STCardsMenuChildVC.swift
//  STCardsMenu-Swift
//
//  Created by TangJR on 12/15/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

import UIKit

class STCardsMenuChildVC: UIViewController {
    
    var tintColor: UIColor?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    lazy var hamburgButton = STCardsMenuHamburgButton {
        let hamburgButton = STCardsMenuHamburgButton()
        
        return hamburgButton
    }()
}