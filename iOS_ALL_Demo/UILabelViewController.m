//
//  UILabelViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 02/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "UILabelViewController.h"

@interface UILabelViewController ()

@property (nonatomic, strong) UILabel  *contantLabel;
@property (nonatomic, strong) UILabel  *contantHeightLabel;
@property (nonatomic, strong) UIView  *contantHeightView;
@property (nonatomic, strong) UIView  *lineHeightHeight;

@property (nonatomic, strong) UITextField *textTF1;
@property (nonatomic, strong) UITextField *textTF2;

@end

@implementation UILabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self showTheMethod];
}

- (void)showTheMethod{
    [self.contantLabel wordSpacingWithFloat:10];
    [self.contantLabel lineSpacingWithFloat:10];
    [self.contantLabel alignLeftTop];
    
    
    self.contantHeightView.height = [self.contantLabel contantHeight];
    self.lineHeightHeight.height  = [self.contantLabel lineHeight];
    
    
    [[[UISearchController alloc] init] logPrivateProperty];
    [self.view logViewHierarchy];
}

- (void)initUI{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.contantLabel = [[UILabel alloc] init];
    self.contantLabel.frame = CGRectMake(0, 64, ScreenWidth, 500);
    self.contantLabel.backgroundColor = [UIColor grayColor];
    self.contantLabel.numberOfLines = 0;
    self.contantLabel.text = @"我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角。\n 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角。";
    
    self.contantHeightLabel = [[UILabel alloc] init];
    self.contantHeightLabel.frame = CGRectMake(0, 0, ScreenWidth, 0);
    self.contantHeightLabel.backgroundColor = [UIColor brownColor];
    self.contantHeightLabel.numberOfLines = 0;
    self.contantHeightLabel.text = @"通过文字属性和宽度，计算文本高度, 通过文字属性和宽度，计算文本高度, 通过文字属性和宽度，计算文本高度, 通过文字属性和宽度，计算文本高度, 通过文字属性和宽度，计算文本高度, 通过文字属性和宽度，计算文本高度, 通过文字属性和宽度，计算文本高度, 通过文字属性和宽度，计算文本高度。";
    
    self.contantHeightView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 10, 0)];
    self.contantHeightView.backgroundColor = [UIColor redColor];
    self.contantHeightView.alpha = 0.5;
    
    self.lineHeightHeight = [[UIView alloc] initWithFrame:CGRectMake(10, 64, 10, 0)];
    self.lineHeightHeight.backgroundColor = [UIColor redColor];
    self.lineHeightHeight.alpha = 0.5;
    
    
    [self.view addSubview:self.contantLabel];
    [self.view addSubview:self.contantHeightView];
    [self.view addSubview:self.lineHeightHeight];
    [self.view addSubview:self.contantHeightLabel];
    
    // ----
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(200, 400, 100, 100);
    button.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(touchButton) forControlEvents:UIControlEventTouchUpInside];
    [button setCornerRadius:CGSizeMake(20, 30) type:UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft];
    
    UITextField *textTF1 = [[UITextField alloc] initWithFrame:CGRectMake(100, 300, 50, 50)];
    self.textTF1 = textTF1;
    textTF1.backgroundColor = [UIColor purpleColor];
    
    UITextField *textTF2 = [[UITextField alloc] initWithFrame:CGRectMake(100, 400, 50, 50)];
    self.textTF2 = textTF2;
    textTF2.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:textTF1];
    [self.view addSubview:textTF2];
}

- (void)touchButton{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@ - %@", touches, event);
    
    [self.textTF1 resignFirstResponder];
    [self.textTF2 resignFirstResponder];
}

@end
