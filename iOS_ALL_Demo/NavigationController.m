//
//  NavigationController.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2018/1/12.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import "NavigationController.h"
#import "PushViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _initUI];
}

- (void)_handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionUp:{
            PushViewController *vc = [[PushViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case UISwipeGestureRecognizerDirectionLeft:{
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            
            break;
        }
        case UISwipeGestureRecognizerDirectionDown:{
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            break;
        }
        case UISwipeGestureRecognizerDirectionRight:{
            
            break;
        }
            
        default:
            break;
    }
}

- (void)_initUI{
    UISwipeGestureRecognizer * recognizer;
    
    /// 添加右滑手势
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(_handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:recognizer];
    
    /// 添加左滑手势
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(_handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:recognizer];
    
    /// 添加上滑手势
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(_handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [self.view addGestureRecognizer:recognizer];
    
    /// 添加下滑手势
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(_handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [self.view addGestureRecognizer:recognizer];
}

@end
