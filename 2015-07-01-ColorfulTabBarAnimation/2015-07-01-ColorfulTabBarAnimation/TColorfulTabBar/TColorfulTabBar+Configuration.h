//
//  TColorfulTabBar+Configuration.h
//  2015-07-01-ColorfulTabBarAnimation
//
//  Created by TangJR on 7/2/15.
//  Copyright (c) 2015 tangjr. All rights reserved.
//

#import "TColorfulTabBar.h"

@interface TColorfulTabBar (Configuration)

// item的颜色（个数要和item的个数相同）
- (NSArray *)itemColors;

// item的个数
- (NSInteger)itemCount;

@end