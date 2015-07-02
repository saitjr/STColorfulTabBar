//
//  TScrollView.h
//  TKit
//
//  Created by TangJR on 15/2/12.
//  Copyright (c) 2015年 tangjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TScrollView;

@protocol TScrollViewDelegate <NSObject>

- (void)tScrollview:(TScrollView *)tScrollView touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)tScrollview:(TScrollView *)tScrollView touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)tScrollview:(TScrollView *)tScrollView touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

@end

@interface TScrollView : UIScrollView

@property (assign, nonatomic) id<TScrollViewDelegate> tDelegate;

@end