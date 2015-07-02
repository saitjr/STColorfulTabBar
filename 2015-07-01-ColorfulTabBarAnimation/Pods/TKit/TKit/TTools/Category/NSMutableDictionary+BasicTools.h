//
//  NSMutableDictionary+BasicTools.h
//  TKit
//
//  Created by TangJR on 15/5/3.
//  Copyright (c) 2015年 tangjr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (BasicTools)

/**
 *  安全新增一个键值对（键与值都不为空）
 *
 *  @param object 值
 *  @param key    键
 */
- (void)setSafeObject:(id)object forKey:(id)key;

/**
 *  如果值为空，则放入空对象
 *
 *  @param object 值
 *  @param key    键
 */
- (void)setIfNilObject:(id)object forKey:(id)key;

@end