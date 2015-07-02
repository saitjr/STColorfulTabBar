//
//  UIImage+Blur.h
//  Popping
//
//  Created by André Schneider on 10.07.14.
//  Copyright (c) 2014 André Schneider. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TBasicTools)

/**
 *  UIImage没有缓存的便利构造方法
 *
 *  @param imageName 图片名称（要带后缀名）
 *
 *  @return 图片
 */
+ (UIImage *)imageNoCacheWithName:(NSString *)imageName;

/**
 *  模糊图片
 *
 *  @return 模糊后的图片
 */
- (UIImage *)blurredImage;

/**
 *  根据坐标与大小裁剪图片
 *
 *  @param rect 裁剪范围
 *
 *  @return 裁剪后的图片
 */
- (UIImage *)clipWithRect:(CGRect)rect;

/**
 *  根据最大范围缩放图片，类似于css中的max-height与max-width
 *
 *  @param maxSize 最大范围
 *
 *  @return 缩放后的图片
 */
- (UIImage *)scaleWithMaxSize:(CGSize)maxSize;

/**
 *  根据缩放比例，缩放图片
 *
 *  @param scale 缩放比例
 *
 *  @return 缩放后的图片
 */
- (UIImage *)scaleWithScale:(CGFloat)scale;

@end