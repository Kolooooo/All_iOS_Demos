//
//  UIImage+Color.h
//  ShareJobStudent
//
//  Created by Sunnyyoung on 15/8/16.
//  Copyright (c) 2015年 GeekBean Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color;
- (UIColor *)colorAtPixel:(CGPoint)point;
//返回该图片是否有透明度通道
- (BOOL)hasAlphaChannel;

@end
