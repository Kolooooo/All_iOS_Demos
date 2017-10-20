

#import "UITableView+__Category.h"

@implementation UITableView (__Category)

- (void)__setBottomLineColor:(UIColor *_Nonnull)color{
    //设置分割线的颜色
    self.separatorColor = color;
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

- (void)__scrollToPoint:(CGPoint)point animated:(BOOL)animated{
    [self setContentOffset:point animated:animated];
}

- (void)__reloadForSection:(NSInteger)section
                     row:(NSInteger)row
               animation:(UITableViewRowAnimation)animation{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    NSArray *indexPaths = @[indexPath];
    
    [self reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

@end
