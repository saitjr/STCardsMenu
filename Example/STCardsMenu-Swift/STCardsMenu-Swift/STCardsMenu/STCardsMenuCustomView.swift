//
//  STCardsMenuCustomView.swift
//  STCardsMenu-Swift
//
//  Created by TangJR on 12/16/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

import UIKit

class STCardsMenuHamburgButton: UIButton {
    
    override func drawRect(rect: CGRect) {
        let buttonWidth: CGFloat = 40.0
        let buttonHeight: CGFloat = 30.0
        let x: CGFloat = STCardsMenuConst.CustomViewLineWidth / 2.0
        let spacing: CGFloat = (buttonHeight - 3.0 * STCardsMenuConst.CustomViewLineWidth) / 2.0
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineCap(context, .Round)
        CGContextSetLineJoin(context, .Round)
        CGContextSetLineWidth(context, STCardsMenuConst.CustomViewLineWidth)
        tintColor.setStroke()
        
        for i in 0 ..< 3 {
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, x, (spacing + STCardsMenuConst.CustomViewLineWidth) * CGFloat(i) + STCardsMenuConst.CustomViewLineWidth / 2.0)
            CGContextAddLineToPoint(context, buttonWidth - STCardsMenuConst.CustomViewLineWidth, (spacing + STCardsMenuConst.CustomViewLineWidth) * CGFloat(i) + STCardsMenuConst.CustomViewLineWidth / 2.0);
            CGContextStrokePath(context);
        }
    }
}

class STCardsMenuCloseButton: UIButton {
    override func drawRect(rect: CGRect) {
        
    }
}