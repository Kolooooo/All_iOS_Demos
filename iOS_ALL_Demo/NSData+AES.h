//
//  NSData+AES.h
//  ShareJobStudent
//
//  Created by Sunnyyoung on 15/10/17.
//  Copyright © 2015年 GeekBean Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES)

+ (NSData *)encodedDataWithData:(NSData *)data encodeKey:(NSString *)encodeKey;
+ (NSData *)decodedDataWithData:(NSData *)data decodeKey:(NSString *)decodeKey;

@end
