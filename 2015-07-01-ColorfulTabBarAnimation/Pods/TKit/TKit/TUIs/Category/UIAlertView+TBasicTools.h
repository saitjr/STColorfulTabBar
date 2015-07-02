//
//  UIAlertView+TBasicTools.h
//  Pods
//
//  Created by TangJR on 15/5/21.
//
//

#import <UIKit/UIKit.h>

@interface UIAlertView (TBasicTools)

/**
 *  弹出一个只有确认按钮的警告框，标题为“温馨提示”
 *
 *  @param message 警告框内容
 */
+ (void)showWithMessage:(NSString *)message;

@end