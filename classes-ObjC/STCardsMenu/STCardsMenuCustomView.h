//
//  STCardsMenuCustomView.h
//  STCardsMenu-ObjC
//
//  Created by TangJR on 12/15/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STCardsMenuClearWindow;

@protocol STCardsMenuClearWindowDelegate <NSObject>

- (void)clearWindow:(STCardsMenuClearWindow *)window touchPoint:(CGPoint)touchPoint event:(UIEvent *)event;

@end

@interface STCardsMenuHamburgButton : UIButton

@end

@interface STCardsMenuCloseButton : UIView

@end

@interface STCardsMenuClearWindow : UIWindow

@property (weak, nonatomic) id<STCardsMenuClearWindowDelegate> delegate;

- (void)show;
- (void)hide;

@end