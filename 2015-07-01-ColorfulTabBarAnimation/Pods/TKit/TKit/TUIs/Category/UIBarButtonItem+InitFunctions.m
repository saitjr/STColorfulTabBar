//
//  UIBarButtonItem+InitFunctions.m
//  Pods
//
//  Created by TangJR on 15/5/5.
//
//

#import "UIBarButtonItem+InitFunctions.h"

@implementation UIBarButtonItem (InitFunctions)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName {
    
    UIButton *button = [[UIButton alloc] init];
    
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    
    CGRect frame = CGRectZero;
    frame.size = button.currentBackgroundImage.size;
    button.frame = frame;
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end