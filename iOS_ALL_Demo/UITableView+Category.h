//
//  UITableView+Category.h
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 16/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Category)

/**
 改变tableview 下划线颜色

 @param color 颜色
 */
- (void)bottomLineColor:(UIColor *_Nonnull)color;

- (void)setBottomLineWidthEdgeInsets:(UIEdgeInsets)edgeInsets;

/**
 刷新某组某行

 @param section 组
 @param row 行
 @param animation 动画类型
 */
- (void)reloadForSection:(NSInteger)section
                     row:(NSInteger)row
           animation:(UITableViewRowAnimation)animation;

@end
