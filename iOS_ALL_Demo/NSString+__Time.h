//
//  NSString+__Time.h
//  iOS_ALL_Demo
//
//  Created by Ken on 2018/1/21.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (__Time)

/// 传入 秒 得到 xx:xx:xx
- (NSString *_Nonnull)__HHMMSSFromSS:(NSString *_Nonnull)totalTime;

/// 传入 秒 得到 xx:xx
- (NSString *_Nonnull)__MMSSFromSS:(NSString *_Nonnull)totalTime;

@end
