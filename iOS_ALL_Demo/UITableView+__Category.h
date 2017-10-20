

#import <UIKit/UIKit.h>

@interface UITableView (__Category)

/**
 改变tableview 下划线颜色
 
 @param color 颜色
 */
- (void)__setBottomLineColor:(UIColor *_Nonnull)color;

/**
 滚动到指定坐标位置
 
 @param point 坐标
 @param animated 是否需要动画
 */
- (void)__scrollToPoint:(CGPoint)point animated:(BOOL)animated;

/**
 刷新某组某行
 
 @param section 组
 @param row 行
 @param animation 动画类型
 */
- (void)__reloadForSection:(NSInteger)section
                       row:(NSInteger)row
                 animation:(UITableViewRowAnimation)animation;

@end
