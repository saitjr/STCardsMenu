//
//  STCardsMenuAnimation.h
//  STCardsMenu-ObjC
//
//  Created by TangJR on 12/14/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat STVCX = 30.0;
static const CGFloat STVCY = 80.0;

@interface STCardsMenuAnimation : NSObject

+ (void)cardIdentityAnimationWithView:(UIView *)view;
+ (void)cardMoveToRightAnimationWithView:(UIView *)view;
+ (void)cardScaleLittleAnimationWithView:(UIView *)view point:(CGPoint)point;

+ (void)titleIdentityAnimationWithView:(UIView *)view;
+ (void)titleMoveToRightAnimationWithView:(UIView *)view;

+ (void)hamburgIdentityAnimationWithView:(UIView *)view;
+ (void)hamburgShowAnimationWithView:(UIView *)view;

+ (void)closeButtonShowAnimationWithView:(UIView *)view;
+ (void)closeButtonHideAnimationWithView:(UIView *)view;

@end