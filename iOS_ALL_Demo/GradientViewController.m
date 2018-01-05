//
//  GradientViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/10/21.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "GradientViewController.h"
#import "UIView+__Gradient.h"

@interface GradientViewController ()

@property (nonatomic, strong) UIView  *view1;
@property (nonatomic, strong) UIView  *view2;
@property (nonatomic, strong) UIView  *view3;

@end

@implementation GradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self showTheMethod];
}

- (void)showTheMethod{
     [self.view1 __setGradientColorWithStartColor:[UIColor purpleColor] endColor:[UIColor blueColor]];
    
    
    [self.view2 __setGradientColorWithStartColor:[UIColor purpleColor] endColor:[UIColor blueColor] layerFrame:CGRectMake(0, 0, 200, self.view2.height)];

    
    [self.view3 __setGradientColorWithStartColor:[UIColor purpleColor] endColor:[UIColor blueColor] layerFrame:self.view3.bounds gradientDirection:__GradientDirectionV];
    
    
    DEBUGLOG(@"%@", self.view1.__gradientLayer);
}

- (void)initUI{
    self.view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, __ScreenWidth, 100)];
    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 250, __ScreenWidth, 100)];
    self.view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 400, __ScreenWidth, 100)];
    
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    [self.view addSubview:self.view3];
}

@end
