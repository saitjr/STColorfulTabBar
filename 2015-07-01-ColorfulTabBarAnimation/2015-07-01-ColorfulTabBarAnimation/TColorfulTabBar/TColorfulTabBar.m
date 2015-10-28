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

@property (weak, nonatomic) UIView *colorfulView; ///< 彩色的view
@property (strong, nonatomic) UIView *colorfulMaskView; ///< 需要显示部分(mask)

@property (assign, nonatomic) NSInteger fromeIndex; ///< tabbar之前选中的index
@property (assign, nonatomic) NSInteger toIndex; ///< tabbar即将选中的index

@end

@implementation TColorfulTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // 设置彩色view
        [self setupColorView];
        // 设置遮罩层
        [self setupMaskLayer];
    }
    
    return self;
}

// 设置遮罩层
- (void)setupMaskLayer {
    
    // 根据按钮个数，设置宽度
    CGFloat itemWidth = SELF_WIDTH / self.itemCount;
    
    // 初始化遮罩层的view
    UIView *colorMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, itemWidth, SELF_HEIGHT)];
    colorMaskView.backgroundColor = [UIColor blackColor];
    self.colorfulMaskView = colorMaskView;
    // 将遮罩层view的layer设置为彩色view的遮罩
    self.colorfulView.layer.mask = self.colorfulMaskView.layer;
}

// 设置彩色view
- (void)setupColorView {
    
    // 初始化和tabbar一样大的彩色view
    UIView *colorView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:colorView];
    self.colorfulView = colorView;
    
    NSArray *colors = [self itemColors];
    CGFloat itemWidth = SELF_WIDTH / [self itemCount];
    
    // 循环将彩色的色块添加到彩色view上
    for (int i = 0; i < [self itemCount]; i ++) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(itemWidth * i, 0, itemWidth, SELF_HEIGHT)];
        view.backgroundColor = colors[i];
        [self.colorfulView addSubview:view];
    }
}

// 动画
- (void)animation {
    
    // 按钮宽度
    CGFloat itemWidth = SELF_WIDTH / [self itemCount];
    // 遮罩每次移动时，都先会多出来一部分，然后再到另一个index，这个变量用来设置多出来那部分的宽度
    CGFloat extraWidth = itemWidth / 4;
    
    // 根据多出来的部分，设置frame
    CGRect scaleFrame = CGRectMake(CGRectGetMinX(self.colorfulMaskView.frame), 0, itemWidth + extraWidth, SELF_HEIGHT);
    // 根据toIndex，计算新的frame
    CGRect toFrame = CGRectMake(self.toIndex * itemWidth, 0, itemWidth, SELF_HEIGHT);
    
    // 判断遮罩层应该滑动的方向，来修改多出来部分的frame
    if (self.fromeIndex > self.toIndex) {
        
        scaleFrame = CGRectMake(CGRectGetMinX(self.colorfulMaskView.frame) - extraWidth, 0, itemWidth + extraWidth, SELF_HEIGHT);
    }
    
    // 动画分为两部分
    // 第一部分：遮罩先展开一部分
    // 第二部分：位移并缩小回原来的大小
    // 第一部分淡入，第二部分淡出
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        self.colorfulMaskView.frame = scaleFrame;
    } completion:^(BOOL finished) {
        
        if (finished) {
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                self.colorfulMaskView.frame = toFrame;
            } completion:NULL];
        }
    }];
}

# pragma mark - UITabBarDelegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSInteger index = [self.items indexOfObject:item];
    self.fromeIndex = self.toIndex;
    self.toIndex = index;
    [self animation];
}

#pragma mark - Override

// 因为tabbar设置代理先后顺序的原因，如果在初始化时，就将代理设置为自己，系统会在添加到UITabbarController上的时候，将代理设置为UITabbarController。
- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    self.delegate = self;
}

// 在这个方法中进行遮罩层的布局，横竖屏切换都会调用，所以可以进行横竖屏适配
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