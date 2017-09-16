//
//  NSString+Extension.h
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 08/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/**
 根据类名 字符串 创建对象并返回

 @return 创建出来的对象
 */
- (id _Nonnull)objectFromClassName;

/**
 一些文本在全文中的位置坐标

 @param text 全文
 @param searchText 需要查找的文本
 @return 若干个文本位置坐标 NSString -> NSInteger
 */
+ (NSArray<NSString *> *_Nonnull)array_SomeTextLocationWith:(NSString *_Nonnull)text searchText:(NSString *_Nonnull)searchText;

#pragma mark - 格式字符串验证
/// 验证是否是正确的手机号码格式
- (BOOL)isValidateMobile;
/// 验证是否是正确的邮箱号码格式
//+(BOOL)KK_isValidateEmail:(NSString *)email;
/// 验证是否是正确的密码格式
//+ (BOOL)KK_isValiDatePassword:(NSString *)password;

@end
