//
//  UIBezierPathViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 24/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "UIBezierPathViewController.h"
#import "BezierView.h"

@interface UIBezierPathViewController ()

@end

@implementation UIBezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI{
    BezierView *bezierView = [[BezierView alloc] init];
    bezierView.backgroundColor = [UIColor grayColor];
    bezierView.frame = CGRectMake(0, 80, 80, 80);
    
    [self.view addSubview:bezierView];
    
    
//    // 创建path
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    
//    // 添加路径[1条点(100,100)到点(200,100)的线段]到path
//    [path moveToPoint:CGPointMake(100 , 100)];
//    
//    [path addLineToPoint:CGPointMake(200, 100)];
//    
//    // 将path绘制出来
//    [path stroke];
}

@end
