

#ifndef __Config_h
#define __Config_h


#pragma mark DEBUGLOG
#ifdef DEBUG
#define DEBUGLOG(...) NSLog(@"Class = %@, Line = %d -> %@", [self class], __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define DEBUGLOG(...) {}
#endif


#define __WeakSelf __weak typeof(self) weakSelf = self;
#define __ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)


//#pragma mark 颜色
//#define __RGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
//#define __HexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
///// 随机颜色
//#define __RandomColor [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];


#pragma mark - Frame
#pragma mark Screen frame
#define __ScreenHeight [UIScreen mainScreen].bounds.size.height
#define __ScreenWidth [UIScreen mainScreen].bounds.size.width


#pragma mark 机型 
/// iPhone 4/4s
/// 机器采用了retina屏幕，坐标是320 x 480，屏幕像素640 x 960，他们之间是1:2关系。即一个坐标对应2个像素。
/// iPhone 5/5s/5c
/// 机器采用了retina屏幕，坐标是320 x 568，屏幕像素640 x 1136，他们之间关系式1:2关系。即一个坐标对应2个像素。
/// iPhone 6
/// 机器采用了retina屏幕，坐标是375, 667，屏幕像素750 x 1334，他们之间关系式1:2关系。即一个坐标对应2个像素。
/// iPhone 6 plus
/// 机器采用了retina屏幕，坐标是414, 736，屏幕像素1080 x 1920，他们之间关系式1:2.6关系。即一个坐标对应2.6个像素
#define __iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define __iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define __iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define __iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


#pragma mark 机型尺寸适配
/// 均已iphone6 的尺寸为基准计算机型尺寸
#define __iphoneXW(a) (KKiPhone5?(a*0.853):(KKiPhone6?(a):(KKiPhone6Plus?(a/0.906):(a*0.853))))
#define __iphoneXH(a) (KKiPhone5?(a*0.852):(KKiPhone6?(a):((KKiPhone6Plus?(a/0.906):(a*0.720)))))

#define __iphoneXN(a) (KKiPhone5?(a*0.834):(KKiPhone6?(a):(KKiPhone6Plus?(a/0.897):(a*0.690))))
#define __iphoneXNT(a) (KKiPhone5?(a*0.821):(KKiPhone6?(a):(KKiPhone6Plus?(a/0.889):(a*0.662))))
#define __iphoneXT(a) (KKiPhone5?(a*0.840):(KKiPhone6?(a):(KKiPhone6Plus?(a/0.896):(a*0.697))))

#define __iphoneX(a,b,c)  (KKiPhone5?(a):(KKiPhone6?(b):(KKiPhone6Plus?(c):(a))))
#define __iphoneZ(a,b,c,d) (KKiPhone5?(a):(KKiPhone6?(b):(KKiPhone6Plus?(c):(d))))
#define __iphoneSize(a,b,c) CGSizeMake((a)*(c),(b)*(c))


#endif /* __Config_h */



#pragma mark 宏(define)与常量(const)的正确使用
/*
 * http://blog.csdn.net/sunnyboy9/article/details/50739328
 *
 * 当我们想全局共用一些数据时，可以用宏、变量、常量
 * #define HSCoder @"汉斯哈哈哈" 宏
 * NSString *HSCoder = @"汉斯哈哈哈"; 变量
 * 常量四种写法：
 static const NSString *HSCoder = @"汉斯哈哈哈";
 const NSString *HSCoder = @"汉斯哈哈哈";
 NSString const *HSCoder = @"汉斯哈哈哈";
 NSString * const HSCoder = @"汉斯哈哈哈";
 *
 *
 * 常量区分
 * 全局常量：不管你定义在任何文件夹，外部都能访问
 #import "ViewController.h"
 const NSString *HSCoder = @"汉斯哈哈哈";
 *
 * 局部常量：用static修饰后，不能提供外界访问
 #import "ViewController.h"
 static const NSString *HSCoder = @"汉斯哈哈哈";
 *
 *
 * const修饰位置不同，代表什么？
 1.const NSString *HSCoder = @"汉斯哈哈哈";
 2.NSString const *HSCoder = @"汉斯哈哈哈";
 3.NSString * const HSCoder = @"汉斯哈哈哈";
 
 1.const NSString *HSCoder = @"汉斯哈哈哈";
 "*HSCoder"不能被修改， "HSCoder"能被修改
 
 2.NSString const *HSCoder = @"汉斯哈哈哈";
 "*HSCoder"不能被修改， "HSCoder"能被修改
 
 3.NSString * const HSCoder = @"汉斯哈哈哈";
 "HSCoder"不能被修改，"*HSCoder"能被修改
 
 注意：1和2其实没什么区别
 结论：const右边的总不能被修改
 
 所以一般我们定义一个常量又不想被修改应该这样：
 NSString * const HSCoder = @"汉斯哈哈哈";
 *
 *
 *
 */
