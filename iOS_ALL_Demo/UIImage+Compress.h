//
//  UIImage+Compress.h
//  ShareJobStudent
//
//  Created by Sunnyyoung on 15/11/9.
//  Copyright © 2015年 GeekBean Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Compress)

+ (UIImage *)compressImage:(UIImage *)image;
+ (UIImage *)compressImage:(UIImage *)image compressRatio:(CGFloat)ratio;
+ (UIImage *)compressImage:(UIImage *)image compressRatio:(CGFloat)ratio maxCompressRatio:(CGFloat)maxRatio;

@end
