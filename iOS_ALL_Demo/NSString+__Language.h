

#import <Foundation/Foundation.h>

@interface NSString (__Language)

/// 判断是否是纯汉字
- (BOOL)__isAllChinese;

/// 判断是否含有汉字
- (BOOL)__isIncludeChinese;

/**
 判断字符串是否包含某字符串

 @param includeString 某字符串
 @return YES:包含 NO:不包含
 */
- (BOOL)__isIncludeString:(NSString *_Nonnull)includeString;

@end


