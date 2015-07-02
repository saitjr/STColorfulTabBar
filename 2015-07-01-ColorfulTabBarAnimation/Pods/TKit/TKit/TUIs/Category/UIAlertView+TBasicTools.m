//
//  UIAlertView+TBasicTools.m
//  Pods
//
//  Created by TangJR on 15/5/21.
//
//

#import "UIAlertView+TBasicTools.h"

@implementation UIAlertView (TBasicTools)

+ (void)showWithMessage:(NSString *)message {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:message delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil];
    [alertView show];
}

@end