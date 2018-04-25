//
//  UINavigationController+__Show.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2018/4/16.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import "UINavigationController+__Show.h"

@implementation UINavigationController (__Show)

- (void)__showViewController:(UIViewController *_Nonnull)showViewController completion:(void (^ __nullable)(void))completion {
    if (showViewController == nil) return;
    
    __weak UIViewController *weakShowViewController = showViewController;
    weakShowViewController.definesPresentationContext = YES;
    
    /// 在一个透明视图上添加不透明的子控件
    weakShowViewController.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0f];
    weakShowViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:weakShowViewController animated:NO completion:completion];
}

@end
