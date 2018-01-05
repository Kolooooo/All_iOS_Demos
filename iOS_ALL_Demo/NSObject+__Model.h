

#import <Foundation/Foundation.h>

@interface NSObject (__Model)

/**
 通过一个字典创建一个模型

 @param dict 字典
 @return 对象
 */
+ (instancetype)__objWithDict:(NSDictionary *)dict;

@end
