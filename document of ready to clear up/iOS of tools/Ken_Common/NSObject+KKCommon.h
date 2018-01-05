//
//  NSObject+common.h
//  no
//
//  Created by Ken_lu on 17/1/2.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#define KK_isNull(object) (object == NULL)
#define KK_isNil(object) (object == nil)
#define KK_isNilAndNull(object) (object == NULL && object == nil)


@interface NSObject (common)

#pragma mark - 数据持久化
/// 删除NSUserDefaults所有记录
-(void)KK_removeAllUserDefaults;

#pragma mark - 杂类模块
/// 获取一个类的所有子类
///
/// return 所有子类的数组
+ (NSArray *)KK_getAllSubclasses;
/// 手动更改iOS状态栏的颜色
- (void)KK_setStatusBarBackgroundColor:(UIColor *)color;
/// 禁止锁屏
-(void)KK_banLockScreen;
/// 打印系统所有已注册的字体名称
void KK_enumerateFonts();

#pragma mark - 防御式编程
/// 是否为null，如果为null，那么就返回YES
-(BOOL)KK_isNull;
/// 是否为nil，如果为nil，那么就返回YES
-(BOOL)KK_isNil;
/// 是否为nil && null，如果为nil && null，那么就返回YES
-(BOOL)KK_isNilAndNull;
/// 是否一个都没有，如果是一个都没有，那么就返回YES
-(BOOL)KK_isNoOne;

#pragma mark - 格式字符串验证
/// 验证是否是正确的手机号码格式
+(BOOL)KK_isValidateMobile:(NSString *)mobile;
/// 验证是否是正确的邮箱号码格式
+(BOOL)KK_isValidateEmail:(NSString *)email;
/// 验证是否是正确的密码格式
+ (BOOL)KK_isValiDatePassword:(NSString *)password;

@end


#pragma mark - 记录系统的一些方法
/*  app 文件路径
 沙盒根目录:
 NSString *home = NSHomeDirectory();
 
 
 Documents:保存应用运行时生成的需要持久化的数据,iTunes同步设备时，会备份该目录。例如,游戏应用可将游戏存档保存在该目录
 NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
 
 
 Library 目录：这个目录下有两个子目录：Caches 和 Preferences
 Library/Caches:保存应用运行时生成的需要持久化的数据,iTunes同步 设备时不会备份该目录。一般存储体积大、不需要备份的非重要数据
 NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
 
 
 Library/Preference:保存应用的所有偏好设置,iOS的Settings(设置) 应用会在该目录中查找应用的设置信息。iTunes同步设备时会备份该目录。您不应该直接创建偏好设置文件，而是应该使用NSUserDefaults类来取得和设置应用程序的偏好.
 
 
 tmp:保存应用运行时所需的临时数据,使用完毕后再将相应的文件从该目录 删除。应用没有运行时,系统也可能会清除该目录下的文件。iTunes同步设备 时不会备份该目录
 NSString *tmpDir = NSTemporaryDirectory();
 
 */

// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------

/* 利用plist 储存数据
 // 将数据封装成字典，将字典持久化到Documents/stu.plist文件中
 NSMutableDictionary *dict = [NSMutableDictionary dictionary]; [
 dict setObject:@"母鸡" forKey:@"name"];
 [dict writeToFile:path atomically:YES];
 
 
 // 读取属性列表,恢复NSDictionary对象，读取Documents/stu.plist的内容,实例化NSDictionary
 NSDictionary *dict = [NSDictionary
 dictionaryWithContentsOfFile:path];
 NSLog(@"name:%@", [dict objectForKey:@"name"]);
 */

// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------

/* 利用偏好设置NSUserDefaults 存储数据
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 [defaults setObject:@"itcast" forKey:@"username"];
 [defaults setBool:YES forKey:@"auto_login"];
 [defaults synchornize];// 马上写入偏好设置
 
 
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults]; 
 NSString *username = [defaults stringForKey:@"username"];
 BOOL autoLogin = [defaults boolForKey:@"auto_login"];
 */

/// NSKeyedArchiver 归档解档篇幅太长，不归纳在这里了

