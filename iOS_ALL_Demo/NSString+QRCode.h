//
//  NSString+QRCode.h
//  ShareJobStudent
//
//  Created by Jeason on 2016/10/26.
//  Copyright © 2016年 GeekBean Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (QRCode)

+ (NSString *)stringWithQRCodeImage:(UIImage *)image;

@end
