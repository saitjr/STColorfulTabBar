//
//  UIView+TBasicTools.m
//  TKit
//
//  Created by TangJR on 15/5/3.
//  Copyright (c) 2015年 tangjr. All rights reserved.
//

#import "UIView+TBasicTools.h"

@implementation UIView (TBasicTools)

- (void)removeAllSubviews {
    
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (UIViewController *)currentViewController {
    
    UIView *tempView = self;
    
    if ([[tempView nextResponder]isKindOfClass:[UIViewController class]]) {
        return (UIViewController *)[tempView nextResponder];
    }
    else{
        
        for (UIView * superview = tempView.superview; superview; superview = superview.superview) {
            if ([[superview nextResponder] isKindOfClass:[UIViewController class]]) {
                return (UIViewController *)[superview nextResponder];
            }
        }
    }
    return nil;
}

- (UIImage *)screenShot {
    
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end