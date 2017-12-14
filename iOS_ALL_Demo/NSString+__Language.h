

#import <Foundation/Foundation.h>

@interface NSString (__Language)

/// 判断是否是纯汉字
- (BOOL)__isChinese;

/// 判断是否含有汉字
- (BOOL)__includeChinese;

@end
