//
//  NSTimerViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2018/1/5.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import "NSTimerViewController.h"

@interface NSTimerViewController ()

@end

@implementation NSTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //使用timer定时，每秒触发一次，然后就是写selector了。
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    
//    [timer setFireDate:[NSDate date]]; //继续。
//    [timer setFireDate:[NSDate distantPast]];//开启
//    [timer setFireDate:[NSDate distantFuture]];//暂停
}

- (void)timerFireMethod:(NSTimer*)theTimer{
    NSCalendar *cal = [NSCalendar currentCalendar];//定义一个NSCalendar对象
    NSDateComponents *endTime = [[NSDateComponents alloc] init];    //初始化目标时间...奥运时间好了
    [endTime setYear:2008];
    [endTime setMonth:8];
    [endTime setDay:8];
    [endTime setHour:8];
    [endTime setMinute:8];
    [endTime setSecond:8];
    
    NSDate *todate = [cal dateFromComponents:endTime]; //把目标时间装载入date
    
    NSDate *today = [NSDate date];    //得到当前时间
    
    //用来得到具体的时差
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *d = [cal components:unitFlags fromDate:today toDate:todate options:0];
    
    NSLog(@"%d年%d月%d日%d时%d分%d秒",[d year],[d month], [d day], [d hour], [d minute], [d second]);
}

@end
