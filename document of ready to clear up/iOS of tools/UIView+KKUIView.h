//
//  UIView+KKUIView
//  seller
//
//  Created by admin on 16/3/2.
//  Copyright © 2016年 sengo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KKUIView)

@property (nonatomic, assign) CGFloat KK_x;
@property (nonatomic, assign) CGFloat KK_y;
@property (nonatomic, assign) CGFloat KK_width;
@property (nonatomic, assign) CGFloat KK_height;
@property (nonatomic, assign) CGFloat KK_centerX;
@property (nonatomic, assign) CGFloat KK_centerY;

/// 根据子视图 获取 子视图所在的控制器
///
/// return 子视图所在的控制器
- (UIViewController *)KK_viewController;

#pragma mark - 添加查看测试信息按钮
/// 添加测试信息按钮到视图窗
///
/// @param rect   按钮的大小
/// @param color   按钮的颜色
/// @param superView   添加到哪个视图窗上面
-(void)KK_addDebugInfoButtonToWindowWithRect:(CGRect)rect color:(UIColor *)color;

/// 从xib中创建一个控件
+ (instancetype)KK_viewFromXib;

@end

#pragma mark - 记录系统的一些方法
// 判断view是不是指定视图的子视图
// BOOL isSubView = [subView isDescendantOfView:superView];

// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------

// 修改UITextField中Placeholder的文字颜色
// [textField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];

// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------
