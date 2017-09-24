

#pragma mark 判断view是不是指定视图的子视图
/*
 * BOOL isSubView = [subView isDescendantOfView:superView];
 */

#pragma mark 获得视图在指定视图上的frame 
/*
 * - (CGRect)convertRect:(CGRect)rect toView:(UIView *)view;
 */


#import <UIKit/UIKit.h>

@interface UIView (Category)

/// 根据子视图 获取 子视图所在的控制器
///
/// return 子视图所在的控制器
- (UIViewController *_Nonnull)viewController;

/**
 获取视图在window 上的位置与大小

 @return 返回视图在window 上的位置与大小
 */
- (CGRect)rectFromWindow;

/**
 打印视图结构
 */
- (void)logViewHierarchy;

/**
 设置圆角
 
 @param cornerRadii 圆角的size
 @param corners 圆角的四个位置
 */
- (void)setCornerRadius:(CGSize)cornerRadii type:(UIRectCorner)corners;

/// 从xib中创建一个视图, 默认firstObject
+ (instancetype _Nonnull)viewFromXib;

/**
 从xib中创建一个视图

 @param viewIndex view 所在xib 的index
 @return 从xib中创建出来的视图
 */
+ (instancetype _Nullable)viewFromXibWithViewIndex:(NSInteger)viewIndex;

#pragma mark - 添加查看测试信息按钮
/// 添加测试信息按钮到视图窗
///
/// @param rect   按钮的大小
/// @param color   按钮的颜色
- (void)addDebugInfoButtonToWindowWithRect:(CGRect)rect color:(UIColor *_Nonnull)color;

@end


