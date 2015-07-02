//
//  TScrollView.m
//  TKit
//
//  Created by TangJR on 15/2/12.
//  Copyright (c) 2015年 tangjr. All rights reserved.
//

#import "TScrollView.h"

@implementation TScrollView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesBegan:touches withEvent:event];
    
    if (_tDelegate && [_tDelegate respondsToSelector:@selector(tScrollview:touchesBegan:withEvent:)]) {
        
        [_tDelegate tScrollview:self touchesBegan:touches withEvent:event];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesEnded:touches withEvent:event];
    
    if (_tDelegate && [_tDelegate respondsToSelector:@selector(tScrollview:touchesEnded:withEvent:)]) {
        
        [_tDelegate tScrollview:self touchesEnded:touches withEvent:event];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [super touchesMoved:touches withEvent:event];
    
    if (_tDelegate && [_tDelegate respondsToSelector:@selector(tScrollview:touchesMoved:withEvent:)]) {
        
        [_tDelegate tScrollview:self touchesMoved:touches withEvent:event];
    }
}

@end