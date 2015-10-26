//
//  TColorfulTabBar.m
//  2015-07-01-ColorfulTabBarAnimation
//
//  Created by TangJR on 7/1/15.
//  Copyright (c) 2015 tangjr. All rights reserved.
//

#import "TColorfulTabBar.h"
#import "TColorfulTabBar+Configuration.h"
#import "UIColor+STColorInit.h"

#define SELF_WIDTH CGRectGetWidth(self.bounds)
#define SELF_HEIGHT CGRectGetHeight(self.bounds)

@interface TColorfulTabBar () <UITabBarDelegate>

@property (weak, nonatomic) UIView *colorfulView;
@property (strong, nonatomic) UIView *colorfulMaskView;

@property (assign, nonatomic) NSInteger fromeIndex;
@property (assign, nonatomic) NSInteger toIndex;

@end

@implementation TColorfulTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setupColorView];
        [self setupMaskLayer];
    }
    
    return self;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    self.delegate = self;
}

- (void)setupMaskLayer {
    
    CGFloat itemWidth = SELF_WIDTH / self.itemCount;
    
    UIView *colorMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, itemWidth, SELF_HEIGHT)];
    colorMaskView.backgroundColor = [UIColor blackColor];
    self.colorfulMaskView = colorMaskView;
    self.colorfulView.layer.mask = self.colorfulMaskView.layer;
}

- (void)setupColorView {
    
    UIView *colorView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:colorView];
    self.colorfulView = colorView;
    
    NSArray *colors = [self itemColors];
    CGFloat itemWidth = SELF_WIDTH / [self itemCount];
    
    for (int i = 0; i < [self itemCount]; i ++) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(itemWidth * i, 0, itemWidth, SELF_HEIGHT)];
        view.backgroundColor = colors[i];
        [self.colorfulView addSubview:view];
    }
}

- (void)animation {
    
    CGFloat itemWidth = SELF_WIDTH / [self itemCount];
    CGFloat extraWidth = itemWidth / 4;
    
    CGRect scaleFrame = CGRectMake(CGRectGetMinX(self.colorfulMaskView.frame), 0, itemWidth + extraWidth, SELF_HEIGHT);
    CGRect toFrame = CGRectMake(self.toIndex * itemWidth, 0, itemWidth, SELF_HEIGHT);
    
    if (self.fromeIndex > self.toIndex) {
        
        scaleFrame = CGRectMake(CGRectGetMinX(self.colorfulMaskView.frame) - extraWidth, 0, itemWidth + extraWidth, SELF_HEIGHT);
    }
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.colorfulMaskView.frame = scaleFrame;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            self.colorfulMaskView.frame = toFrame;
        } completion:NULL];
    }];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSInteger index = [self.items indexOfObject:item];
    self.fromeIndex = self.toIndex;
    self.toIndex = index;
    [self animation];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat itemWidth = SELF_WIDTH / [self itemCount];
    NSArray *subviews = self.colorfulView.subviews;
    
    self.colorfulMaskView.frame = CGRectMake(self.toIndex * itemWidth, 0, itemWidth, CGRectGetHeight(self.colorfulMaskView.frame));
    
    for (int i = 0; i < subviews.count; i ++) {
        
        UIView *view = subviews[i];
        view.frame = CGRectMake(itemWidth * i, 0, itemWidth, SELF_HEIGHT);
    }
}

@end