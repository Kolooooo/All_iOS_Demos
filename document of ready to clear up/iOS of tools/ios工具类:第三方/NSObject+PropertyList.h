//
//  NSObject+PropertyList.h
//  11-Runtime的基本使用
//
//  Created by gzxzmac on 16/2/16.
//  Copyright © 2016年 gzxzmac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PropertyList)
// 通过一个字典创建一个模型
+ (instancetype)objWithDict:(NSDictionary *)dict;
@end
