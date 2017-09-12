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

@end
