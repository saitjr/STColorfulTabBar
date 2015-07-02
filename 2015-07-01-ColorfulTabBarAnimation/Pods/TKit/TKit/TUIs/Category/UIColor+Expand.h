//
//  UIColor+Expand.h
//  demo
//
//  Created by 张鹏 on 13-5-15.
//  Copyright (c) 2013年 zhangpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Expand)

/**
 * @brief: 获取随机颜色rgba
 *
 * @return: 随机颜色
 */
+ (UIColor *)normalRandomColor;

/**
 * @brief: 获取随机颜色hsba
 *
 * @return: 随机颜色
 */
+ (UIColor *)specialRandomColor;

/**
 *  通过16进制获取颜色
 *
 *  @param hexValue   16进制的颜色
 *  @param alphaValue 透明度
 *
 *  @return 颜色
 */
+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

/**
 *  通过16进制获取颜色，没有透明度
 *
 *  @param hexValue 16进制的颜色
 *
 *  @return 颜色
 */
+ (UIColor *)colorWithHex:(NSInteger)hexValue;

@end
