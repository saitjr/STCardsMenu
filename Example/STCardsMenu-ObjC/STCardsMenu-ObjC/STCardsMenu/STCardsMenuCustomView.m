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

- (void)setTintColor:(UIColor *)tintColor {
    [super setTintColor:tintColor];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGFloat buttonWidth = 40.0;
    CGFloat buttonHeight = 30.0;
    CGFloat x = STCardsMenuCustomViewLineWidth / 2.0;
    CGFloat spacing = (buttonHeight - 3 * STCardsMenuCustomViewLineWidth) / 2.0;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    [self.tintColor setStroke];
    CGContextSetLineWidth(context, STCardsMenuCustomViewLineWidth);
    
    for (int i = 0; i < 3; i++) {
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, x, (spacing + STCardsMenuCustomViewLineWidth) * i + STCardsMenuCustomViewLineWidth / 2.0);
        CGContextAddLineToPoint(context, buttonWidth - STCardsMenuCustomViewLineWidth, (spacing + STCardsMenuCustomViewLineWidth) * i + STCardsMenuCustomViewLineWidth / 2.0);
        CGContextStrokePath(context);
    }
}

@end

@implementation STCardsMenuCloseButton

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