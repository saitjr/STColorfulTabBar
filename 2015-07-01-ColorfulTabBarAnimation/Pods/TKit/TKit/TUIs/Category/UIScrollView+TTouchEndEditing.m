//
//  UIScrollView+TouchEndEditing.m
//  TKit
//
//  Created by TangJR on 15/2/12.
//  Copyright (c) 2015年 tangjr. All rights reserved.
//

#import "UIScrollView+TTouchEndEditing.h"

@implementation UIScrollView (TTouchEndEditing)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
    [self endEditing:YES];
}

@end