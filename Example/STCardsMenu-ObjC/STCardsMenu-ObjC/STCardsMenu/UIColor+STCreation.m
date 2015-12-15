//
//  UIColor+STCreation.m
//  STCardsMenu-ObjC
//
//  Created by TangJR on 12/14/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

#import "UIColor+STCreation.h"

@implementation UIColor (STCreation)

+ (instancetype)st_colorWithHex:(NSInteger)hex {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1];
}

@end