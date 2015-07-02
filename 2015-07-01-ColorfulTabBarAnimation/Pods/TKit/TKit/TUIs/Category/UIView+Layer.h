//
//  UIView+Layer.h
//  2015-05-06-PopDemo
//
//  Created by TangJR on 15/5/8.
//  Copyright (c) 2015年 tangjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layer)

/**
 *  添加锚点
 *
 *  @param anchorPoint 锚点
 */
- (void)addAnchorPoint:(CGPoint)anchorPoint;

/**
 *  添加边框
 *
 *  @param color 边框颜色
 *  @param width 边框宽度
 */
- (void)addBorderWithColor:(UIColor *)color width:(CGFloat)width;

@end