//
//  PresentViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2018/4/12.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import "PresentViewController.h"
#import "NavigationController.h"

@interface PresentViewController ()

@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NavigationController *vc = [[NavigationController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
