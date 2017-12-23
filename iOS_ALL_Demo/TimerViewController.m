//
//  TimerViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2017/12/23.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@property (nonatomic, strong) UILabel  *secondLabel;
@property (nonatomic, strong) NSTimer  *timer;
@property (nonatomic, assign) NSInteger  second;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.second = 60;
    
    [self initUI];
    self.secondLabel.text = [NSString stringWithFormat:@"%ld 秒", (long)self.second];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self startTheTimer];
    
    /// 延时停止timer
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.second * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopOrRemoveTimer];
    });
}

- (void)dealloc{
    [self stopOrRemoveTimer];
}

/// 添加定时器
- (void)startTheTimer{
    /// 1 秒调用一次refreshLabelText 方法
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refreshLabelText) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/// 移除定时器
- (void)stopOrRemoveTimer{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)refreshLabelText{
    self.second--;
    self.secondLabel.text = [NSString stringWithFormat:@"%ld 秒", (long)self.second];
}

- (void)initUI{
    self.secondLabel = [[UILabel alloc] init];
    self.secondLabel.height = 20.0;
    self.secondLabel.width = __ScreenWidth;
    self.secondLabel.centerX = self.view.centerX;
    self.secondLabel.centerY = self.view.centerY;
    [self.view addSubview:self.secondLabel];
}


@end
