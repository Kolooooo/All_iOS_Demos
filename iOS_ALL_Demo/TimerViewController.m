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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
#pragma mark - 开始定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshLabelText) userInfo:nil repeats:YES];
}

- (void)dealloc{
    [self stopOrRemoveTimer];
}

#pragma mark - 结束移除定时器
- (void)stopOrRemoveTimer{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)refreshLabelText{
    if (self.second <= 0) {
        [self stopOrRemoveTimer];
        self.second = 0;
        return;
    }
    
    self.second--;
    self.secondLabel.text = [NSString stringWithFormat:@"%ld 秒", (long)self.second];
}

- (void)initUI{
    self.secondLabel = [[UILabel alloc] init];
    self.secondLabel.text = [NSString stringWithFormat:@"%ld 秒", (long)self.second];
    self.secondLabel.textAlignment = NSTextAlignmentCenter;
    self.secondLabel.textColor = [UIColor redColor];
    self.secondLabel.height = 20.0;
    self.secondLabel.width = __ScreenWidth;
    self.secondLabel.centerX = self.view.centerX;
    self.secondLabel.centerY = self.view.centerY;
    [self.view addSubview:self.secondLabel];
}

@end
