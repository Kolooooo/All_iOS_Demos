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
@property (nonatomic, strong) UIView  *contantHeightView;
@property (nonatomic, strong) UIView  *lineHeightHeight;

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
    self.lineHeightHeight.height = [self.contantLabel lineHeight];
}

- (void)initUI{
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.contantLabel = [[UILabel alloc] init];
    self.contantLabel.frame = CGRectMake(0, 64, ScreenWidth, 1000);
    self.contantLabel.backgroundColor = [UIColor grayColor];
    self.contantLabel.numberOfLines = 0;
    self.contantLabel.text = @"我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角。\n 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角。";
    
    
    self.contantHeightView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 10, 0)];
    self.contantHeightView.backgroundColor = [UIColor redColor];
    self.contantHeightView.alpha = 0.5;
    
    self.lineHeightHeight = [[UIView alloc] initWithFrame:CGRectMake(10, 64, 10, 0)];
    self.lineHeightHeight.backgroundColor = [UIColor redColor];
    self.lineHeightHeight.alpha = 0.5;
    
    
    [self.view addSubview:self.contantLabel];
    [self.view addSubview:self.contantHeightView];
    [self.view addSubview:self.lineHeightHeight];
}

@end
