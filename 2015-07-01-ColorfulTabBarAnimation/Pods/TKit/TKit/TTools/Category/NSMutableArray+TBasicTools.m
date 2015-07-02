//
//  NSMutableArray+TBasicTools.m
//  Pods
//
//  Created by TangJR on 15/5/21.
//
//

#import "NSMutableArray+TBasicTools.h"

@implementation NSMutableArray (TBasicTools)

- (void)addSafeObject:(id)object {
    
    if (object != nil && ![object isEqual:[NSNull null]]) {
        
        [self addObject:object];
    }
}

- (void)addIfNilObject:(id)object {
    
    if (object != nil && ![object isEqual:[NSNull null]]) {
        
        [self addObject:object];
        return;
    }
    [object addObject:[NSNull null]];
}

@end