//
//  NSString+AES.h
//  ShareJobStudent
//
//  Created by Sunnyyoung on 15/10/15.
//  Copyright © 2015年 GeekBean Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSString (AES)

- (NSString *)AESEncryptWithKey:(NSString *)key;
- (NSString *)AESDecryptWithKey:(NSString *)key;

@end
