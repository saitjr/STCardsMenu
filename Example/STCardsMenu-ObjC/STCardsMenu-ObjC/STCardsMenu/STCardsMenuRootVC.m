//
//  STCardsMenuRootVC.m
//  STCardsMenu-ObjC
//
//  Created by TangJR on 12/14/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

#import "STCardsMenuRootVC.h"
#import "UIColor+STCreation.h"
#import "STCardsMenuAnimation.h"
#import "STCardsMenuChildVC.h"

@interface STCardsMenuRootVC () <STCardsMenuChildVCDelegate>

@property (assign, nonatomic) UInt8 childCount;
@property (assign, nonatomic) UInt8 lastSelectedIndex;
@property (strong, nonatomic) STCardsMenuCloseButton *closeButton;

@end

@implementation STCardsMenuRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor st_colorWithHex:0xCDDBED];
    [self closeButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.childCount = self.childViewControllers.count;
    for (UInt16 i = 0; i < self.childCount; i++) {
        STCardsMenuChildVC *childVC = self.childViewControllers[i];
        childVC.delegate = self;
        childVC.view.transform = CGAffineTransformMakeTranslation((i + 1) * STVCX, (i + 1) * STVCY);
        childVC.view.layer.cornerRadius = 8.0;
    }
}

- (void)clickAtIndex:(UInt8)selectIndex {
    if (selectIndex >= self.childCount) {
        return;
    }
    self.lastSelectedIndex = selectIndex;
    [STCardsMenuAnimation closeButtonHideAnimationWithView:self.closeButton];
    STCardsMenuChildVC *selectVC = self.childViewControllers[selectIndex];
    [STCardsMenuAnimation hamburgShowAnimationWithView:selectVC.hamburgButton];
    [STCardsMenuAnimation titleMoveToRightAnimationWithView:selectVC.titleLabel];
    for (UInt16 i = 0; i <= selectIndex; i++) {
        STCardsMenuChildVC *childVC = self.childViewControllers[i];
        childVC.clearButton.hidden = YES;
        [STCardsMenuAnimation cardIdentityAnimationWithView:childVC.view];
    }
    for (UInt16 i = selectIndex + 1; i < self.childCount; i++) {
        STCardsMenuChildVC *childVC = self.childViewControllers[i];
        childVC.clearButton.hidden = YES;
        [STCardsMenuAnimation cardMoveToRightAnimationWithView:childVC.view];
    }
}

#pragma mark - STCardsMenuChildVCDelegate

- (void)cardsMenu:(STCardsMenuChildVC *)cardsMenuVC hamburgButtonTapped:(STCardsMenuHamburgButton *)hamburgButton {
    [STCardsMenuAnimation closeButtonShowAnimationWithView:self.closeButton];
    [STCardsMenuAnimation hamburgIdentityAnimationWithView:hamburgButton];
    [STCardsMenuAnimation titleIdentityAnimationWithView:cardsMenuVC.titleLabel];
    for (UInt16 i = 0; i < self.childCount; i++) {
        STCardsMenuChildVC *childVC = self.childViewControllers[i];
        childVC.clearButton.hidden = NO;
        [STCardsMenuAnimation cardScaleLittleAnimationWithView:childVC.view point:CGPointMake((i + 1) * STVCX, (i + 1) * STVCY)];
    }
}

- (void)cardsMenu:(STCardsMenuChildVC *)cardsMenuVC clearButtonTapped:(UIButton *)hamburgButton {
    UInt8 selectIndex = [self.childViewControllers indexOfObject:cardsMenuVC];
    [self clickAtIndex:selectIndex];
}


#pragma mark - Button Tapped

- (void)closeButtonTapped:(STCardsMenuCloseButton *)sender {
    [self clickAtIndex:self.lastSelectedIndex];
}

#pragma mark - Getter / Setter

- (STCardsMenuCloseButton *)closeButton {
    if (!_closeButton) {
        _closeButton = [STCardsMenuCloseButton new];
        [_closeButton addTarget:self action:@selector(closeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        _closeButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_closeButton];
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_closeButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:STVCX];
        NSLayoutConstraint *topConstraint =  [NSLayoutConstraint constraintWithItem:_closeButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:STVCX];
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_closeButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30];
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_closeButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30];
        [self.view addConstraints:@[leftConstraint, topConstraint]];
        [_closeButton addConstraints:@[widthConstraint, heightConstraint]];
    }
    return _closeButton;
}

@end