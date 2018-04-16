//
//  UINavigationController+__Show.h
//  iOS_ALL_Demo
//
//  Created by Ken on 2018/4/16.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (__Show)

/**
 展示一个控制器（透明，没有动画）
 
 @param showViewController 需要展示的控制器
 @param completion 显示完成的回调
 */
- (void)__showViewController:(UIViewController *_Nonnull)showViewController completion:(void (^ __nullable)(void))completion;

@end
