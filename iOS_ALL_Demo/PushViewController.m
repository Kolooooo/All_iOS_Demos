//
//  PushViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2018/1/12.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()
<UINavigationControllerDelegate>


@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
}

#pragma mark - UINavigationControllerDelegate
/// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    /// 判断将要要显示的控制器是否是自己
    BOOL isShow = [viewController isKindOfClass:[self class]];
    /// 隐藏
    [self.navigationController setNavigationBarHidden:isShow animated:YES];
}

@end
