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
#import "STCardsMenuConst.h"

@interface STCardsMenuRootVC () <STCardsMenuChildVCDelegate, STCardsMenuClearWindowDelegate>

@property (assign, nonatomic) NSInteger childCount;
@property (assign, nonatomic) NSInteger lastSelectedIndex;
@property (strong, nonatomic) STCardsMenuCloseButton *closeButton;
@property (strong, nonatomic) STCardsMenuClearWindow *clearWindow;

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
    for (NSInteger i = 0; i < self.childCount; i++) {
        STCardsMenuChildVC *childVC = self.childViewControllers[i];
        childVC.view.transform = CGAffineTransformMakeTranslation((i + 1) * STVCX, (i + 1) * STVCY);
        childVC.view.layer.cornerRadius = 8.0;
        childVC.delegate = self;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.clearWindow show];
}

- (void)clickAtIndex:(UInt8)selectIndex {
    if (selectIndex >= self.childCount) {
        return;
    }
    self.lastSelectedIndex = selectIndex;
    [self.clearWindow hide];
    [STCardsMenuAnimation closeButtonHideAnimationWithView:self.closeButton];
    STCardsMenuChildVC *selectVC = self.childViewControllers[selectIndex];
    [STCardsMenuAnimation hamburgShowAnimationWithView:selectVC.hamburgButton];
    [STCardsMenuAnimation titleMoveToRightAnimationWithView:selectVC.titleLabel];
    for (NSInteger i = 0; i <= selectIndex; i++) {
        STCardsMenuChildVC *childVC = self.childViewControllers[i];
        [STCardsMenuAnimation cardIdentityAnimationWithView:childVC.view];
    }
    for (NSInteger i = selectIndex + 1; i < self.childCount; i++) {
        STCardsMenuChildVC *childVC = self.childViewControllers[i];
        [STCardsMenuAnimation cardMoveToRightAnimationWithView:childVC.view];
    }
}

#pragma mark - STCardsMenuChildVCDelegate

- (void)cardsMenu:(STCardsMenuChildVC *)cardsMenuVC hamburgButtonTapped:(STCardsMenuHamburgButton *)hamburgButton {
    [self.clearWindow show];
    [STCardsMenuAnimation closeButtonShowAnimationWithView:self.closeButton];
    [STCardsMenuAnimation hamburgIdentityAnimationWithView:hamburgButton];
    [STCardsMenuAnimation titleIdentityAnimationWithView:cardsMenuVC.titleLabel];
    for (NSInteger i = 0; i < self.childCount; i++) {
        STCardsMenuChildVC *childVC = self.childViewControllers[i];
        [STCardsMenuAnimation cardScaleLittleAnimationWithView:childVC.view point:CGPointMake((i + 1) * STVCX, (i + 1) * STVCY)];
    }
}

- (void)cardsMenu:(STCardsMenuChildVC *)cardsMenuVC clearButtonTapped:(UIButton *)hamburgButton {
    NSInteger selectIndex = [self.childViewControllers indexOfObject:cardsMenuVC];
    [self clickAtIndex:selectIndex];
}

#pragma mark - STCardsMenuClearWindowDelegate

- (void)clearWindow:(STCardsMenuClearWindow *)window touchPoint:(CGPoint)touchPoint event:(UIEvent *)event {
    if (CGRectContainsPoint(self.closeButton.frame, touchPoint)) {
        [self clickAtIndex:self.lastSelectedIndex];
        return;
    }
    for (NSInteger i = self.childCount - 1; i >= 0; i--) {
        STCardsMenuChildVC *childVC = self.childViewControllers[i];
        BOOL isInside = CGRectContainsPoint(childVC.view.frame, touchPoint);
        if (isInside) {
            [self.clearWindow hide];
            [self clickAtIndex:i];
            break;
        }
    }
}

#pragma mark - Getter / Setter

- (STCardsMenuCloseButton *)closeButton {
    if (!_closeButton) {
        _closeButton = [STCardsMenuCloseButton new];
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

- (UIWindow *)clearWindow {
    if (!_clearWindow) {
        _clearWindow = [STCardsMenuClearWindow new];
        _clearWindow.delegate = self;
    }
    return _clearWindow;
}

@end