//
//  UIView+Layer.m
//  2015-05-06-PopDemo
//
//  Created by TangJR on 15/5/8.
//  Copyright (c) 2015年 tangjr. All rights reserved.
//

#import "UIView+Layer.h"

@implementation UIView (Layer)

- (void)addAnchorPoint:(CGPoint)anchorPoint {
    
    self.layer.anchorPoint = anchorPoint;
    self.center = CGPointMake(self.center.x - (0.5 - self.layer.anchorPoint.x) * self.bounds.size.width, self.center.y - (0.5 - self.layer.anchorPoint.y) * self.bounds.size.height);
}

- (void)addBorderWithColor:(UIColor *)color width:(CGFloat)width {
    
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

@end