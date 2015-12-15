//
//  STCardsMenuChildVC.h
//  STCardsMenu-ObjC
//
//  Created by TangJR on 12/14/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STCardsMenuCustomView.h"

@class STCardsMenuChildVC;

@protocol STCardsMenuChildVCDelegate <NSObject>

- (void)cardsMenu:(STCardsMenuChildVC *)cardsMenuVC hamburgButtonTapped:(STCardsMenuHamburgButton *)hamburgButton;
- (void)cardsMenu:(STCardsMenuChildVC *)cardsMenuVC clearButtonTapped:(UIButton *)hamburgButton;

@end

@interface STCardsMenuChildVC : UIViewController

@property (strong, nonatomic) UIColor *tintColor;
@property (weak, nonatomic) id<STCardsMenuChildVCDelegate> delegate;

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) STCardsMenuHamburgButton *hamburgButton;
@property (strong, nonatomic) UIButton *clearButton;

@end