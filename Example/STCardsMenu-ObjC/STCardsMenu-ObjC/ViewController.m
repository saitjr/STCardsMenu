//
//  ViewController.m
//  STCardsMenu-ObjC
//
//  Created by TangJR on 12/14/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

#import "ViewController.h"
#import "STCardsMenuRootVC.h"
#import "UIColor+STCreation.h"
#import "STCardsMenuChildVC.h"

@interface ViewController ()

@property (weak, nonatomic) STCardsMenuRootVC *cardsMenuRootVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    STCardsMenuRootVC *rootVC = [STCardsMenuRootVC new];
    [self.view addSubview:rootVC.view];
    [self addChildViewController:rootVC];
    self.cardsMenuRootVC = rootVC;
    
    [self setupChildViewControllers];
}

- (void)setupChildViewControllers {
    NSArray *backgroundColors = @[[UIColor st_colorWithHex:0x553860], [UIColor st_colorWithHex:0xA5435D], [UIColor st_colorWithHex:0xF18264], [UIColor st_colorWithHex:0xFEE177]];
    NSArray *titles = @[@"CONTACT", @"ABOUT", @"TEAM", @"PROJECTS"];
    NSArray *tintColors = @[[UIColor st_colorWithHex:0xF18264], [UIColor st_colorWithHex:0xFEE177], [UIColor st_colorWithHex:0x553860], [UIColor st_colorWithHex:0xA5435D]];
    for (int i = 0; i < 4; i++) {
        STCardsMenuChildVC *childVC = [STCardsMenuChildVC new];
        childVC.tintColor = tintColors[i];
        childVC.title = titles[i];
        childVC.view.backgroundColor = backgroundColors[i];
        [self.cardsMenuRootVC.view addSubview:childVC.view];
        [self.cardsMenuRootVC addChildViewController:childVC];
    }
}

@end