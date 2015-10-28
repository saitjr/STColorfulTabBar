//
//  UIColor+STColorInit.h
//  2015-07-01-ColorfulTabBarAnimation
//
//  Created by TangJR on 10/26/15.
//  Copyright © 2015 tangjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (STColorInit)

// 16进制颜色
+ (UIColor *)colorWithHex:(NSInteger)hexValue;
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

@end
