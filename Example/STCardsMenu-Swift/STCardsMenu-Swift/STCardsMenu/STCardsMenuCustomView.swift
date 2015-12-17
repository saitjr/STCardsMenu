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

class STCardsMenuCloseButton: UIView {
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        setupView()
    }
    
    convenience init () {
        self.init(frame:CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    private func setupView (){
        backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        let buttonWidth: CGFloat = 30.0;
        let leftX: CGFloat = STCardsMenuConst.CustomViewLineWidth / 2.0;
        let rightX: CGFloat = buttonWidth - STCardsMenuConst.CustomViewLineWidth;
        let topY: CGFloat = STCardsMenuConst.CustomViewLineWidth / 2.0;
        let bottomY: CGFloat = buttonWidth - STCardsMenuConst.CustomViewLineWidth;
        
        let context = UIGraphicsGetCurrentContext();
        CGContextSetLineCap(context, .Round);
        CGContextSetLineJoin(context, .Round);
        UIColor(st_hex: 0x7197AF).setStroke()
        CGContextSetLineWidth(context, STCardsMenuConst.CustomViewLineWidth);
        
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, leftX, topY);
        CGContextAddLineToPoint(context, rightX, bottomY);
        CGContextStrokePath(context);
        
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, rightX, topY);
        CGContextAddLineToPoint(context, leftX, bottomY);
        CGContextStrokePath(context);
    }
}

protocol STCardsMenuClearWindowDelegate: class {
    func clearWindowTouched(clearWindow: STCardsMenuClearWindow, touchPoint: CGPoint)
}

class STCardsMenuClearWindow: UIWindow {
    
    weak var delegate: STCardsMenuClearWindowDelegate?
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        setupView()
    }
    
    convenience init () {
        self.init(frame:CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen().bounds), CGRectGetHeight(UIScreen.mainScreen().bounds)))
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    private func setupView (){
        backgroundColor = UIColor.clearColor()
    }
}

extension STCardsMenuClearWindow {
    func show() {
        makeKeyAndVisible()
        alpha = 1.0
        hidden = false
    }
    
    func hide() {
        hidden = true
    }
}

extension STCardsMenuClearWindow {
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        if let touch: UITouch = touches.first {
            let touchPoint = touch.locationInView(self)
            delegate?.clearWindowTouched(self, touchPoint: touchPoint)
        }
    }
}