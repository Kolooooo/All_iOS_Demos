//
//  NSString+Regex.h
//  ShareJobStudent
//
//  Created by Jeason on 2016/11/28.
//  Copyright © 2016年 GeekBean Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regex)

/**
 邮箱
 */
- (BOOL)isEmailAddress;

/**
 金额（两位小数）
 */
- (BOOL)isMoney;

/**
 数字
 */
- (BOOL)isNumber;

/**
 空格
 */
- (BOOL)isBlank;

- (NSArray<NSTextCheckingResult *> *)allPhoneAndUrl;

@end
