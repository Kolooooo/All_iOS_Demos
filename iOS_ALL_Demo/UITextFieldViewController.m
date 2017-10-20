//
//  UITextFieldViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 24/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "UITextFieldViewController.h"

@interface UITextFieldViewController ()

@end

@implementation UITextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI{
    
    UITextField *textTF = [[UITextField alloc] init];
    textTF.backgroundColor = [UIColor grayColor];
    textTF.frame = CGRectMake(0, 64, self.view.width, 300);
    textTF.placeholder = @"我是输入框啊";
    [textTF __setPlaceholderColor:[UIColor orangeColor]];
    [textTF __setPlaceholderFont:[UIFont boldSystemFontOfSize:14.0]];
    
    [self.view addSubview:textTF];
}

@end
