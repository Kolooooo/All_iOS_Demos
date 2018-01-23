//
//  NSString+__Time.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2018/1/21.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import "NSString+__Time.h"

@implementation NSString (__Time)

- (NSString *_Nonnull)__HHMMSSFromSS:(NSString *_Nonnull)totalTime{
    
    NSInteger seconds = [totalTime integerValue];
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    
    return format_time;
}

- (NSString *_Nonnull)__MMSSFromSS:(NSString *_Nonnull)totalTime{
    
    NSInteger seconds = [totalTime integerValue];
    
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%ld",seconds/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    
    return format_time;
}

@end
