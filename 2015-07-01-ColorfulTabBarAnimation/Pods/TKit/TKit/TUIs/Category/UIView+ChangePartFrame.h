//
//  UIView+ChangePartFrame.h
//  TKit
//
//  Created by TangJR on 15/5/1.
//  Copyright (c) 2015年 tangjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ChangePartFrame)

@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGPoint origin;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGFloat centerX;
@property (assign, nonatomic) CGFloat centerY;

@end