//
//  NSMutableArray+TBasicTools.h
//  Pods
//
//  Created by TangJR on 15/5/21.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (TBasicTools)

/**
 *  安全放入对象，对象为空不放入
 *
 *  @param object 对象
 */
- (void)addSafeObject:(id)object;

/**
 *  如果对象为空，就放入空对象占位
 *
 *  @param object 对象
 */
- (void)addIfNilObject:(id)object;

@end