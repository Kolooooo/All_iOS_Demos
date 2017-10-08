//
//  NSString+AES.m
//  ShareJobStudent
//
//  Created by Sunnyyoung on 15/10/15.
//  Copyright © 2015年 GeekBean Technology Co., Ltd. All rights reserved.
//

#import "NSString+AES.h"
#import "NSData+AES.h"

@implementation NSString (AES)

#pragma mark - Public method

- (NSString *)AESEncryptWithKey:(NSString *)key {
    NSData *encryptedData = [NSData encodedDataWithData:[self dataUsingEncoding:NSUTF8StringEncoding] encodeKey:key];
    NSString *encrypedString = [encryptedData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    encrypedString = [encrypedString stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    encrypedString = [encrypedString stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    return encrypedString;
}

- (NSString *)AESDecryptWithKey:(NSString *)key {
    NSData *decryptedData = [NSData decodedDataWithData:[self dataUsingEncoding:NSUTF8StringEncoding] decodeKey:key];
    NSString *decryptedString = [decryptedData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    decryptedString = [decryptedString stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    decryptedString = [decryptedString stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    return decryptedString;
}

@end
