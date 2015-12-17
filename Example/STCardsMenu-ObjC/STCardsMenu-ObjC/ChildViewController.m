//
//  ChildViewController.m
//  STCardsMenu-ObjC
//
//  Created by TangJR on 12/17/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI {
    UILabel *welcomeLabel = [UILabel new];
    welcomeLabel.text = @"WELCOME";
    welcomeLabel.textColor = [UIColor whiteColor];
    welcomeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:welcomeLabel];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:welcomeLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:welcomeLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    [self.view addConstraints:@[centerXConstraint, centerYConstraint]];
}

@end