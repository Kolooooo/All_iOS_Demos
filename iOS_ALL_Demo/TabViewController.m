//
//  TabViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2017/12/26.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "TabViewController.h"
#import "__TabView.h"

@interface TabViewController ()

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    __TabView *tabView = [[__TabView alloc] init];
    tabView.frame = CGRectMake(0.0, 64.0, __ScreenWidth, __ScreenHeight - 64.0);
    tabView.pageCount = 3;
    tabView.titles = @[
                       @"1", @"2", @"3"
                       ];
    tabView.currentLineColor = [UIColor purpleColor];
    tabView.titleSelectedColor = [UIColor purpleColor];
    tabView.titleNoSelectedColor = [UIColor blackColor];
    [self.view addSubview:tabView];
}

@end
