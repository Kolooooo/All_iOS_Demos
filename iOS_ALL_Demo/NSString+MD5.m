//
//  NSString+MD5.m
//  ShareJobCompany
//
//  Created by Sunnyyoung on 14-12-1.
//  Copyright (c) 2014年 Sunnyyoung. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (MD5)

- (NSString *)MD5String {
    const char *string = self.UTF8String;
    unsigned char result[16] = { 0 };
    CC_MD5(string, (CC_LONG)strlen(string), result);

    NSMutableString *md5 = [NSMutableString stringWithCapacity:sizeof(16)];
    for (int i = 0; i < sizeof(result); ++i) {
        [md5 appendFormat:@"%02x", result[i]];
    }
    return md5;
}

@end
