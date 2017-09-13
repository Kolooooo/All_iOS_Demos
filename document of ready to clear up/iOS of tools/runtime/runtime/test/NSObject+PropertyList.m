//
//  NSObject+PropertyList.m
//  11-Runtime的基本使用
//
//  Created by gzxzmac on 16/2/16.
//  Copyright © 2016年 gzxzmac. All rights reserved.
//

#import "NSObject+PropertyList.h"
#import <objc/runtime.h> /// 使用runtime就要导入框架

@implementation UIView (PropertyList)

// 获取属性列表 在字典转模型的时候非常有用

+ (instancetype)objWithDict:(NSDictionary *)dict {
    id instance = [[self alloc]init];
    NSLog(@"%@", [self class]);
    [[self propertys] enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id value = dict[obj];
        if (value) {
            // 设置属性值
            [instance setValue:value forKey:obj];
        }
    }];
    return instance;
}


///  获取属性名
///
///  @return 返回 存放获取属性名的数组
+ (NSArray *)propertys {
    // 获取到所有的属性。 objc_property_t:数组来的
    unsigned int count;
    objc_property_t *list = class_copyPropertyList(self, &count);
    NSMutableArray *data = [NSMutableArray array];
    for (int i = 0; i < count; ++i) {
        // 取出每一个属性
        objc_property_t key = list[i];
        // 转成字符串
        NSString *propertyName = [[NSString alloc]initWithCString:property_getName(key) encoding:NSUTF8StringEncoding];
        [data addObject:propertyName];
    }
    // copy, create,retain都需要注意释放对象内存
    free(list);

    return data.copy;
}

-(void)logKen
{
    NSLog(@"ken");
}

@end
