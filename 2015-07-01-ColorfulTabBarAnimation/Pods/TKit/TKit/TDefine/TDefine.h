//
//  TDefine.h
//  TKit
//
//  Created by TangJR on 15/5/1.
//  Copyright (c) 2015年 tangjr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TConst.h"

#pragma mark - 项目定义

#pragma mark - 基本常量定义

#pragma mark - 断言

#pragma mark - 宏定义

// 屏幕大小
#define T_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define T_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define T_NAV_BAR_HEIGHT 64
#define T_TAB_BAR_HEIGHT 50

// 正式环境屏蔽控制台打印
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d NSLog:\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#define NSLog(FORMAT, ...) nil
#endif