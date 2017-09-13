//
//  KKConfig.h
//  SeekStar
//
//  Created by Ken_lu on 17/1/5.
//  Copyright © 2017年 模特. All rights reserved.
//

#ifndef KKConfig_h
#define KKConfig_h


#pragma mark - 开关
/// 是否开发编写中的代码：YES：开启，NO：不开启
#define KKisOpenDoingCode NO


#pragma mark - 宏集合
#ifdef DEBUG
#define KKLog(...) NSLog(@"CLASS=%@, LINE=%d -> %@", [self class], __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define KKLog(...) {}
#endif

#define KKWeakSelf __weak typeof(self) weakSelf = self;
#define KKScreenHeight [UIScreen mainScreen].bounds.size.height
#define KKScreenWidth [UIScreen mainScreen].bounds.size.width
#define KKSharedAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
/// 将数据写到桌面的plist，后台返回来的数据将它写入plist 文件然后在路径上查看比较方便
#define KKWriteToPlist(data, filename) [data writeToFile:[NSString stringWithFormat:@"/Users/Sunny_Ken_MacBook/Downloads/%@.plist", filename] atomically:YES]; KKLog(@"plist 文件写入成功！");


#pragma mark 颜色
/// 颜色的选择
#define KKRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define KKHexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
/// 随机颜色
#define KKRandomColor [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];


#pragma mark 尺寸
/// iPhone 4/4s
/// 机器采用了retina屏幕，坐标是320 x 480，屏幕像素640 x 960，他们之间是1:2关系。即一个坐标对应2个像素。
/// iPhone 5/5s/5c
/// 机器采用了retina屏幕，坐标是320 x 568，屏幕像素640 x 1136，他们之间关系式1:2关系。即一个坐标对应2个像素。
/// iPhone 6
/// 机器采用了retina屏幕，坐标是375, 667，屏幕像素750 x 1334，他们之间关系式1:2关系。即一个坐标对应2个像素。
/// iPhone 6 plus
/// 机器采用了retina屏幕，坐标是414, 736，屏幕像素1080 x 1920，他们之间关系式1:2.6关系。即一个坐标对应2.6个像素

#define KKiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define KKiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define KKiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define KKiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

/// 均已iphone6 的尺寸为基准计算机型尺寸
#define KKiphoneXW(a) (KKiPhone5?(a*0.853):(KKiPhone6?(a):(KKiPhone6Plus?(a/0.906):(a*0.853))))
#define KKiphoneXH(a) (KKiPhone5?(a*0.852):(KKiPhone6?(a):((KKiPhone6Plus?(a/0.906):(a*0.720)))))

#define KKiphoneXN(a) (KKiPhone5?(a*0.834):(KKiPhone6?(a):(KKiPhone6Plus?(a/0.897):(a*0.690))))
#define KKiphoneXNT(a) (KKiPhone5?(a*0.821):(KKiPhone6?(a):(KKiPhone6Plus?(a/0.889):(a*0.662))))
#define KKiphoneXT(a) (KKiPhone5?(a*0.840):(KKiPhone6?(a):(KKiPhone6Plus?(a/0.896):(a*0.697))))

#define KKiphoneX(a,b,c)  (KKiPhone5?(a):(KKiPhone6?(b):(KKiPhone6Plus?(c):(a))))
#define KKiphoneZ(a,b,c,d) (KKiPhone5?(a):(KKiPhone6?(b):(KKiPhone6Plus?(c):(d))))
#define KKiphoneSize(a,b,c) CGSizeMake((a)*(c),(b)*(c))


#endif /* KKConfig_h */
