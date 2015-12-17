//
//  File.swift
//  STCardsMenu-Swift
//
//  Created by TangJR on 12/16/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

import UIKit

class STCardsMenuAnimation {
    static func cardsMenuIdentityAnimation(view: UIView) {
        UIView.animateWithDuration(STCardsMenuConst.AnimationDuration, animations: { () -> Void in
            view.transform = CGAffineTransformIdentity
            })  { (finish: Bool) -> Void in
                view.layer.cornerRadius = 0.0
        }
    }
    
    static func cardsMenuToRightAnimation(view: UIView) {
        UIView.animateWithDuration(STCardsMenuConst.AnimationDuration, animations: { () -> Void in
            view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(UIScreen.mainScreen().bounds), CGRectGetMinY(view.frame))
            }) { (finish: Bool) -> Void in
                view.layer.cornerRadius = 0.0
        }
    }
    
    static func cardsMenuScaleLittleAnimation(view: UIView, point: CGPoint) {
        UIView.animateWithDuration(STCardsMenuConst.AnimationDuration, animations: { () -> Void in
            view.transform = CGAffineTransformMakeTranslation(point.x, point.y)
            view.layer.cornerRadius = 8.0
            }) { (finish: Bool) -> Void in
                
        }
    }
    
    static func hamburgButtonHideAnimation(hamburgButton: STCardsMenuHamburgButton, titleLabel: UILabel) {
        hamburgButton.hidden = false
        hamburgButton.alpha = 1.0
        UIView.animateWithDuration(STCardsMenuConst.AnimationDuration, animations: { () -> Void in
            hamburgButton.transform = CGAffineTransformIdentity
            hamburgButton.alpha = 0.0
            titleLabel.transform = CGAffineTransformIdentity
            }) { (finish: Bool) -> Void in
                hamburgButton.hidden = true
        }
    }
    
    static func hamburgButtonShowAnimation(hamburgButton: STCardsMenuHamburgButton, titleLabel: UILabel) {
        hamburgButton.hidden = false
        hamburgButton.alpha = 0.0
        UIView.animateWithDuration(STCardsMenuConst.AnimationDuration, animations: { () -> Void in
            titleLabel.transform = CGAffineTransformMakeTranslation(CGRectGetMaxX(hamburgButton.frame), CGRectGetMinY(titleLabel.frame))
            hamburgButton.alpha = 1.0
            }) { (finish: Bool) -> Void in
                
        }
    }
    
    static func closeButtonHideAnimation(closeButton: STCardsMenuCloseButton) {
        UIView.animateWithDuration(STCardsMenuConst.AnimationDuration, animations: { () -> Void in
            closeButton.alpha = 0.0
            closeButton.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(CGFloat(M_PI_4) / 4.0), CGAffineTransformMakeTranslation(STCardsMenuConst.VCX - 5.0, STCardsMenuConst.VCY + 5.0))
            }) { (finish: Bool) -> Void in
                closeButton.hidden = true
        }
    }
    
    static func closeButtonShowAnimation(closeButton: STCardsMenuCloseButton) {
        closeButton.hidden = false
        UIView.animateWithDuration(STCardsMenuConst.AnimationDuration, animations: { () -> Void in
            closeButton.alpha = 1.0
            closeButton.transform = CGAffineTransformIdentity
            }) { (finish: Bool) -> Void in
                
        }
    }
}