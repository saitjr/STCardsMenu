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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(st_hex: 0xCDDBED)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        childCount = childViewControllers.count
        for i in 0 ..< childCount {
            let childVC = childViewControllers[i]
            childVC.view.transform = CGAffineTransformMakeTranslation(CGFloat(i + 1) * STCardsMenuConst.VCX, CGFloat(i + 1) * STCardsMenuConst.VCY)
            childVC.view.layer.cornerRadius = 8.0
        }
    }
}