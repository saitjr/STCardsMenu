//
//  STCardsMenuChildVC.m
//  STCardsMenu-ObjC
//
//  Created by TangJR on 12/14/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

#import "STCardsMenuChildVC.h"

@interface STCardsMenuChildVC () {
    UIColor *_tintColor;
}

@end

@implementation STCardsMenuChildVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.hamburgButton.alpha = 0;
    [self clearButton];
}

#pragma mark - Button Tapped

- (void)hamburgButtonTapped:(STCardsMenuHamburgButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cardsMenu:hamburgButtonTapped:)]) {
        [self.delegate cardsMenu:self hamburgButtonTapped:sender];
    }
}

- (void)clearButtonTapped:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cardsMenu:clearButtonTapped:)]) {
        [self.delegate cardsMenu:self clearButtonTapped:sender];
    }
}

#pragma mark - Getter / Setter

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.titleLabel.text = title;
}

- (void)setTintColor:(UIColor *)tintColor {
    _tintColor = tintColor;
    self.hamburgButton.tintColor = tintColor;
    self.titleLabel.textColor = tintColor;
}

- (UIColor *)tintColor {
    if (_tintColor) {
        _tintColor = [UIColor whiteColor];
    }
    return _tintColor;
}

- (STCardsMenuHamburgButton *)hamburgButton {
    if (!_hamburgButton) {
        _hamburgButton = [STCardsMenuHamburgButton new];
        _hamburgButton.tintColor = self.tintColor;
        _hamburgButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_hamburgButton addTarget:self action:@selector(hamburgButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_hamburgButton];
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_hamburgButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
        NSLayoutConstraint *topConstraint =  [NSLayoutConstraint constraintWithItem:_hamburgButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:10];
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_hamburgButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:40];
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_hamburgButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30];
        [self.view addConstraints:@[leftConstraint, topConstraint]];
        [_hamburgButton addConstraints:@[widthConstraint, heightConstraint]];
    }
    return _hamburgButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_titleLabel];
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
        NSLayoutConstraint *topConstraint =  [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:10];
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30];
        [self.view addConstraints:@[leftConstraint, topConstraint]];
        [_titleLabel addConstraints:@[heightConstraint]];
    }
    return _titleLabel;
}

- (UIButton *)clearButton {
    if (!_clearButton) {
        _clearButton = [UIButton new];
        [_clearButton addTarget:self action:@selector(clearButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        _clearButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_clearButton];
        NSLayoutConstraint *conX = [_clearButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
        NSLayoutConstraint *conY = [_clearButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor];
        NSLayoutConstraint *width = [_clearButton.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:1];
        NSLayoutConstraint *height = [_clearButton.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:1];
        [NSLayoutConstraint activateConstraints:@[conX, conY, width, height]];
    }
    return _clearButton;
}

@end