//
//  UINavigationController+__Category.m
//  QunhuanTribe
//
//  Created by Ken on 2017/12/16.
//  Copyright © 2017年 GarveyCalvin. All rights reserved.
//

#import "UINavigationController+__Category.h"

@implementation UINavigationController (__Category)

- (void)__setBottomLineHidden{
    self.navigationBar.shadowImage = [[UIImage alloc] init];
}

- (void)__setBackgroundColor:(UIColor *_Nonnull)color{
    UIImage *image = [UIImage __imageWithColor:color];
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (void)__setTintColor:(UIColor *_Nonnull)color{
    self.navigationBar.tintColor = color;
}

- (void)__setNavTitleColor:(UIColor *_Nonnull)color{
    [self.navigationBar setTitleTextAttributes:@{
                                                 NSForegroundColorAttributeName:color
                                                 }];
}

- (void)__addRightBarButtonItem:(UIImage *_Nonnull)iconImage target:(id _Nullable)target selector:(SEL _Nullable)selector{
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithImage:iconImage style:UIBarButtonItemStylePlain target:target action:selector];
    
    if (![target isKindOfClass:NSClassFromString(@"UIViewController")]) {
        NSAssert(NO, @"target is not UIViewController class");
        return;
    }
    
    UIViewController *viewController =  (UIViewController *)target;
    viewController.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)__addRightBarButtonItemWithTitle:(NSString *_Nonnull)title target:(id _Nullable)target selector:(SEL _Nullable)selector{
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:selector];
    
    if (![target isKindOfClass:NSClassFromString(@"UIViewController")]) {
        NSAssert(NO, @"target is not UIViewController class");
        return;
    }
    
    UIViewController *viewController =  (UIViewController *)target;
    viewController.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)__addLeftBarButtonItem:(UIImage *_Nonnull)iconImage target:(id _Nullable)target selector:(SEL _Nullable)selector{
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithImage:iconImage style:UIBarButtonItemStylePlain target:target action:selector];
    
    if (![target isKindOfClass:NSClassFromString(@"UIViewController")]) {
        NSAssert(NO, @"target is not UIViewController class");
        return;
    }
    
    UIViewController *viewController = (UIViewController *)target;
    viewController.navigationItem.leftBarButtonItem = leftButtonItem;
}

- (void)__addLeftBarButtonItemWithTitle:(NSString *_Nonnull)title target:(id _Nullable)target selector:(SEL _Nullable)selector{
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:selector];
    
    if (![target isKindOfClass:NSClassFromString(@"UIViewController")]) {
        NSAssert(NO, @"target is not UIViewController class");
        return;
    }
    
    UIViewController *viewController =  (UIViewController *)target;
    viewController.navigationItem.leftBarButtonItem = leftButtonItem;
}

- (void)__addCustomRightBarButtonItemWithCustomView:(UIView *_Nonnull)customView{
    self.visibleViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
}

- (void)__addCustomLeftBarButtonItemWithCustomView:(UIView *_Nonnull)customView{
    self.visibleViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
}

@end

