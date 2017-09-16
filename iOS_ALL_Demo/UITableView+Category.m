//
//  UITableView+Category.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 16/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "UITableView+Category.h"

@implementation UITableView (Category)

- (void)bottomLineColor:(UIColor *_Nonnull)color{
    //设置分割线的颜色
    self.separatorColor = color;
}

// ken.todo: 改变iOS7上tableview的分割线长度问题
- (void)setBottomLineWidthEdgeInsets:(UIEdgeInsets)edgeInsets{
//    if ([self respondsToSelector:@selector (setSeparatorInset:)]) {
//        [self setLayoutMargins:edgeInsets];
//    }
    
    //分割线设置 上 左 下
    //    [self setSeparatorInset:edgeInsets];
    // [self setSeparatorInset:UIEdgeInsetsMake(0, 30, 0, 0)];//分割线设置 上 左 下
}

@end
