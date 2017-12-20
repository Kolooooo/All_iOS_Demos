//
//  PickerViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/12/20.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()
@property (nonatomic, strong) __PickerView  *pickerView;
@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.pickerView = [[__PickerView alloc] initWithFrame:CGRectMake(0, 0, __ScreenWidth, __ScreenHeight)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.pickerView show];
}

@end
