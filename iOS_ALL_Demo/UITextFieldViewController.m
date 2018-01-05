//
//  UITextFieldViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 24/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "UITextFieldViewController.h"

@interface UITextFieldViewController ()<UITextFieldDelegate>

@end

@implementation UITextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI{
    
    UITextField *textTF = [[UITextField alloc] init];
    textTF.delegate = self;
    textTF.backgroundColor = [UIColor grayColor];
    textTF.frame = CGRectMake(0, 64, self.view.width, 300);
    textTF.placeholder = @"我是输入框啊";
    
    [textTF __setPlaceholderColor:[UIColor orangeColor]];
    [textTF __setPlaceholderFont:[UIFont boldSystemFontOfSize:14.0]];
    
    [self.view addSubview:textTF];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;{
    
#pragma mark 键盘确认按钮
    if ([string isEqualToString:@"\n"]){
        DEBUGLOG(@"%@", textField.text);
        return YES;
    }
    
#pragma mark 限制输入框输入字数
    // 得到输入框的内容
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    int maxFontCount = 10;
    if ([toBeString length] > maxFontCount) {
        textField.text = [toBeString substringToIndex:maxFontCount];
        return NO;
    }
    
    return YES;
}

@end
