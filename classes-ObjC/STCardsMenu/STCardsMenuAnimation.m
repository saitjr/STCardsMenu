//
//  STCardsMenuAnimation.m
//  STCardsMenu-ObjC
//
//  Created by TangJR on 12/14/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

#import "STCardsMenuAnimation.h"
#import "STCardsMenuConst.h"

static const NSTimeInterval STCardsMenuAnimationDuration = 0.5;

@implementation STCardsMenuAnimation

+ (void)cardIdentityAnimationWithView:(UIView *)view {
    view.userInteractionEnabled = NO;
    [UIView animateWithDuration:STCardsMenuAnimationDuration animations:^{
        view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        view.layer.cornerRadius = 0.0;
        view.userInteractionEnabled = YES;
    }];
}

+ (void)cardScaleLittleAnimationWithView:(UIView *)view point:(CGPoint)point {
    view.userInteractionEnabled = NO;
    [UIView animateWithDuration:STCardsMenuAnimationDuration animations:^{
        view.transform = CGAffineTransformMakeTranslation(point.x, point.y);
        view.layer.cornerRadius = 8.0;
    } completion:^(BOOL finished) {
        view.userInteractionEnabled = YES;
    }];
}

+ (void)cardMoveToRightAnimationWithView:(UIView *)view {
    view.userInteractionEnabled = NO;
    [UIView animateWithDuration:STCardsMenuAnimationDuration animations:^{
        view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetMinY(view.frame));
    } completion:^(BOOL finished) {
        view.layer.cornerRadius = 0.0;
        view.userInteractionEnabled = YES;
    }];
}

+ (void)titleIdentityAnimationWithView:(UIView *)view {
    [UIView animateWithDuration:STCardsMenuAnimationDuration animations:^{
        view.transform = CGAffineTransformIdentity;
    }];
}

+ (void)titleMoveToRightAnimationWithView:(UIView *)view {
    [UIView animateWithDuration:STCardsMenuAnimationDuration animations:^{
        view.transform = CGAffineTransformMakeTranslation(CGRectGetMinX(view.frame) + 40, CGRectGetMinY(view.frame));
    }];
}

+ (void)hamburgIdentityAnimationWithView:(UIView *)view {
    [UIView animateWithDuration:STCardsMenuAnimationDuration animations:^{
        view.transform = CGAffineTransformIdentity;
        view.alpha = 0;
    }];
}

+ (void)hamburgShowAnimationWithView:(UIView *)view {
    [UIView animateWithDuration:STCardsMenuAnimationDuration animations:^{
        view.alpha = 1;
        view.transform = CGAffineTransformMakeTranslation(20, CGRectGetMinY(view.frame));
    }];
}

+ (void)closeButtonShowAnimationWithView:(UIView *)view {
    view.hidden = NO;
    [UIView animateWithDuration:STCardsMenuAnimationDuration animations:^{
        view.alpha = 1;
        view.transform = CGAffineTransformIdentity;
    }];
}

+ (void)closeButtonHideAnimationWithView:(UIView *)view {
    [UIView animateWithDuration:STCardsMenuAnimationDuration animations:^{
        view.alpha = 0;
        view.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(M_PI_4 / 4), CGAffineTransformMakeTranslation(STVCX - 5.0, STVCY + 5.0));
    } completion:^(BOOL finished) {
        view.hidden = YES;
    }];
}

@end