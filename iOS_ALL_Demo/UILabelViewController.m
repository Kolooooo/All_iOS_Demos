//
//  UILabelViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 02/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "UILabelViewController.h"
#import "UILabel+Extension.h"
#import "Config.h"

@interface UILabelViewController ()

@property (nonatomic, strong) UILabel  *label1;

@end

@implementation UILabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self showTheMethod];
}

- (void)showTheMethod{
    [self.label1 wordSpacingWithFloat:10];
    [self.label1 lineSpacingWithFloat:10];
    [self.label1 alignLeftTop];
    
    
    // 总文字的高度：
    CGFloat  textH = [self.label1 sizeThatFits:CGSizeMake(self.label1.frame.size.width, MAXFLOAT)].height;
    // 每行文字的高度：
    CGFloat lineHeight = self.label1.font.lineHeight;
    
    
    NSLog(@"%f %f", textH, lineHeight);
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 10, textH)];
    view.backgroundColor = [UIColor purpleColor];
    view.alpha = 0.3;
    
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10, 64, 10, lineHeight)];
    view1.backgroundColor = [UIColor redColor];
    view1.alpha = 0.3;
    
    
    [self.view addSubview:view];
    [self.view addSubview:view1];
}

- (void)initUI{
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.label1 = [[UILabel alloc] init];
    self.label1.frame = CGRectMake(0, 64, ScreenWidth, 1000);
    self.label1.backgroundColor = [UIColor grayColor];
    self.label1.numberOfLines = 0;
    self.label1.text = @"我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角, 我需要对齐到左上角。";


    [self.view addSubview:self.label1];
}

@end
