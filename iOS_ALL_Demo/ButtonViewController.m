//
//  UIImageViewAndImage_ViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2017/12/30.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "UIImageViewAndImage_ViewController.h"

@interface UIImageViewAndImage_ViewController ()
@property (nonatomic, strong) UIImageView  *insetsMethod_ImageView;
@property (nonatomic, strong) UIImageView  *pointMethod_ImageView;
@end

@implementation UIImageViewAndImage_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _insetsMethod];
    [self _pointMethod];
}

- (void)_insetsMethod{
    self.insetsMethod_ImageView = [[UIImageView alloc] init];
    self.insetsMethod_ImageView.frame = CGRectMake(0.0, 64.0, __ScreenWidth, 100.0);
    self.insetsMethod_ImageView.backgroundColor = [UIColor orangeColor];
    UIImage *image = [UIImage imageNamed:@"nine_point"];
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    /// !!!: insets method
    image = [image __resizableImage:UIEdgeInsetsMake(imageHeight*0.5, imageWidth*0.5, imageHeight*0.5-1, imageWidth*0.5-1)];
    self.insetsMethod_ImageView.image = image;
    [self.view addSubview:self.insetsMethod_ImageView];
}

- (void)_pointMethod{
    self.pointMethod_ImageView = [[UIImageView alloc] init];
    self.pointMethod_ImageView.frame = CGRectMake(0.0, 174.0, __ScreenWidth, 100.0);
    self.pointMethod_ImageView.backgroundColor = [UIColor orangeColor];
    UIImage *image = [UIImage imageNamed:@"nine_point"];
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    /// !!!: point method
    CGPoint imagePoint = CGPointMake(imageWidth*0.5, imageHeight*0.5);
    image = [image __resizableImageWithPoint:imagePoint];
    self.pointMethod_ImageView.image = image;
    [self.view addSubview:self.pointMethod_ImageView];
}

- (UIImageView *)insetsMethod_ImageView{
    if (_insetsMethod_ImageView == nil) {
        _insetsMethod_ImageView = [[UIImageView alloc] init];
    }
    return _insetsMethod_ImageView;
}

- (UIImageView *)pointMethod_ImageView{
    if (_pointMethod_ImageView == nil) {
        _pointMethod_ImageView = [[UIImageView alloc] init];
    }
    return _pointMethod_ImageView;
}

@end
