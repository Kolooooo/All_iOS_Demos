
//
//  NSString+Regex.m
//  ShareJobStudent
//
//  Created by Jeason on 2016/11/28.
//  Copyright © 2016年 GeekBean Technology Co., Ltd. All rights reserved.
//

#import "NSString+Regex.h"

@implementation NSString (Regex)

#pragma mark - Public method

- (BOOL)isEmailAddress {
    NSString *regex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self isValidateByRegex:regex];
}

- (BOOL)isMoney {
    NSString *regex = @"^([1-9][\\d]{0,7}|0)(\\.[\\d]{0,2})?$";
    return [self isValidateByRegex:regex];
}

- (BOOL)isNumber {
    NSString *regex = @"^([0-9]{0,})$";
    return [self isValidateByRegex:regex];
}

- (BOOL)isBlank {
    NSString *regex = @"^\\s{1,}$";
    return [self isValidateByRegex:regex];
}

- (NSArray<NSTextCheckingResult *> *)allPhoneAndUrl {
    NSMutableArray<NSTextCheckingResult *> *allPhoneAndUrlArray = [NSMutableArray array];
    NSError *error = nil;
    NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypePhoneNumber | NSTextCheckingTypeLink error:&error];
    [detector enumerateMatchesInString:self options:kNilOptions range:NSMakeRange(0, self.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        switch (result.resultType) {
            case NSTextCheckingTypeLink: {
                if ([[UIApplication sharedApplication] canOpenURL:result.URL] && [[self substringWithRange:result.range] isContainChinese] == NO) {
                    [allPhoneAndUrlArray addObject:result];
                }
                break;
            }
            case NSTextCheckingTypePhoneNumber: {
                [allPhoneAndUrlArray addObject:result];
                break;
            }
            default:
                break;
        }

    }];
    return allPhoneAndUrlArray;
}


#pragma mark - Private method

- (BOOL)isValidateByRegex:(NSString *)regex {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isContainChinese {
    NSUInteger length = [self length];
    for (NSUInteger i = 0; i < length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [self substringWithRange:range];
        const char *cString = [subString UTF8String];
        if (strlen(cString) == 3) {
            return YES;
        }
    }
    return NO;
}

@end
