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
    bezierView.backgroundColor = [UIColor whiteColor];
    bezierView.frame = self.view.frame;
    
    [self.view addSubview:bezierView];
}

@end
