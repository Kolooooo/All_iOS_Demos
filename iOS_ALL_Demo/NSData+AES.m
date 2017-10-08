//
//  NSData+AES.m
//  ShareJobStudent
//
//  Created by Sunnyyoung on 15/10/17.
//  Copyright © 2015年 GeekBean Technology Co., Ltd. All rights reserved.
//

#import "NSData+AES.h"

@implementation NSData (AES)

#pragma mark - Encode method

+ (NSData *)encodedDataWithData:(NSData *)data encodeKey:(NSString *)encodeKey {
    //获取加密Key
    char keyPtr[kCCKeySizeAES128 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [encodeKey getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    //获取随机加密列
    char ivPtr[kCCKeySizeAES128 + 1];
    bzero(ivPtr, sizeof(ivPtr));
    for (NSInteger x = 0; x < sizeof(ivPtr)-1; x++) {
        ivPtr[x] = (char)('A' + (arc4random_uniform(26)));
    }
    NSData *ivData = [NSData dataWithBytes:ivPtr length:kCCKeySizeAES128];

    //加密
    size_t bufferSize = data.length + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numberOfBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          ivPtr,
                                          data.bytes,
                                          data.length,
                                          buffer,
                                          bufferSize,
                                          &numberOfBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        //拼接iv进行返回加密
        NSMutableData *encryptedData = [[NSMutableData alloc] init];
        [encryptedData appendData:ivData];
        [encryptedData appendData:[NSData dataWithBytesNoCopy:buffer length:numberOfBytesEncrypted freeWhenDone:YES]];
        return encryptedData;
    } else {
        free(buffer);
        return nil;
    }
}

#pragma mark - Decode method

+ (NSData *)decodedDataWithData:(NSData *)data decodeKey:(NSString *)decodeKey {
    //获取解密Key
    char keyPtr[kCCKeySizeAES128 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    [decodeKey getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    //获取随机加密列
    const void *ivPtr = [data subdataWithRange:NSMakeRange(0, kCCKeySizeAES128)].bytes;
    NSData *encryptedData = [data subdataWithRange:NSMakeRange(kCCKeySizeAES128, data.length - kCCKeySizeAES128)];

    //解密
    size_t bufferSize = encryptedData.length + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numberOfBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          ivPtr,
                                          encryptedData.bytes,
                                          encryptedData.length,
                                          buffer,
                                          bufferSize,
                                          &numberOfBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numberOfBytesDecrypted freeWhenDone:YES];
    } else {
        free(buffer);
        return nil;
    }
}

@end
