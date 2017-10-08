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

//- (void)ken{
    // 默认选中第一行
//    [tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
//    // 实现了选中第一行的方法
//    [self tableView:_mainIndustryTableView didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    //例如：
    // 默认下选中状态
//    - (void)customAtIndex:(UITableView *)tableView
//    {
//        // 默认选中第一行
//        [tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
//        if ([tableView isEqual:_mainIndustryTableView]) {
//            [self tableView:tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
//        }    
//    }
//}

- (void)scrollToPoint:(CGPoint)point animated:(BOOL)animated{
    [self setContentOffset:point animated:animated];
}

- (void)reloadForSection:(NSInteger)section
                     row:(NSInteger)row
               animation:(UITableViewRowAnimation)animation{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    NSArray *indexPaths = @[indexPath];
    
    [self reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

@end
