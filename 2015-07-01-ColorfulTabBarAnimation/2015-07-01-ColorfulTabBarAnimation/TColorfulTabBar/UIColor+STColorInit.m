//
//  UIColor+STColorInit.m
//  2015-07-01-ColorfulTabBarAnimation
//
//  Created by TangJR on 10/26/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

#import "UIColor+STColorInit.h"

@implementation UIColor (STColorInit)

+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue {
    
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor *)colorWithHex:(NSInteger)hexValue {
    
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

@end