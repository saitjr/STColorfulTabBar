//
//  UIBarButtonItem+InitFunctions.h
//  Pods
//
//  Created by TangJR on 15/5/5.
//
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (InitFunctions)

/**
 *  自定义初始化一个UIBarButtonItem
 *
 *  @param target               目标响应者
 *  @param action               事件
 *  @param imageName            图片名称
 *  @param highlightedImageName 高亮图片名称
 *
 *  @return 初始化完成的UIBarButtonItem
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName;

@end
