//
//  STCardsMenuCustomView.m
//  STCardsMenu-ObjC
//
//  Created by TangJR on 12/15/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

#import "STCardsMenuCustomView.h"
#import "UIColor+STCreation.h"

static const CGFloat STCardsMenuCustomViewLineWidth = 5.0;

@implementation STCardsMenuHamburgButton

- (void)drawRect:(CGRect)rect {
    CGFloat buttonWidth = 40.0;
    CGFloat buttonHeight = 30.0;
    CGFloat x = STCardsMenuCustomViewLineWidth / 2.0;
    CGFloat spacing = (buttonHeight - 3 * STCardsMenuCustomViewLineWidth) / 2.0;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineWidth(context, STCardsMenuCustomViewLineWidth);
    [self.tintColor setStroke];
    
    for (int i = 0; i < 3; i++) {
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, x, (spacing + STCardsMenuCustomViewLineWidth) * i + STCardsMenuCustomViewLineWidth / 2.0);
        CGContextAddLineToPoint(context, buttonWidth - STCardsMenuCustomViewLineWidth, (spacing + STCardsMenuCustomViewLineWidth) * i + STCardsMenuCustomViewLineWidth / 2.0);
        CGContextStrokePath(context);
    }
}

@end

@implementation STCardsMenuCloseButton

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGFloat buttonWidth = 30.0;
    CGFloat leftX = STCardsMenuCustomViewLineWidth / 2.0;
    CGFloat rightX = buttonWidth - STCardsMenuCustomViewLineWidth;
    CGFloat topY = STCardsMenuCustomViewLineWidth / 2.0;
    CGFloat bottomY = buttonWidth - STCardsMenuCustomViewLineWidth;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    [[UIColor st_colorWithHex:0x7197AF] setStroke];
    CGContextSetLineWidth(context, STCardsMenuCustomViewLineWidth);
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, leftX, topY);
    CGContextAddLineToPoint(context, rightX, bottomY);
    CGContextStrokePath(context);
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, rightX, topY);
    CGContextAddLineToPoint(context, leftX, bottomY);
    CGContextStrokePath(context);
}

@end

@implementation STCardsMenuClearWindow

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
        self.backgroundColor = [UIColor clearColor];
        self.alpha = 0.0;
    }
    return self;
}

- (void)show {
    self.alpha = 1.0;
    [self makeKeyAndVisible];
}

- (void)hide {
    self.hidden = YES;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    if (self.delegate && [self.delegate respondsToSelector:@selector(clearWindow:touchPoint:event:)]) {
        [self.delegate clearWindow:self touchPoint:touchPoint event:event];
    }
}

@end