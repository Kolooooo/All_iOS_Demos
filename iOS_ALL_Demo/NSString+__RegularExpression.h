






#import <Foundation/Foundation.h>

@interface NSString (RegularExpression)

/**
 *  匹配第一个符合正则语法的结果, 返回匹配的结果(字符串)
 *
 *  @param pattern 正则语法
 *
 *  @return 返回第一个匹配的字符串, 如果没有则返回nil
 */
- (NSString *)firstMatchStringWithPattern:(NSString *)pattern;

/**
 *  匹配第一个符合正则语法的结果, 返回匹配的结果(原字符串中的范围)
 *
 *  @param pattern 正则语法
 *
 *  @return 返回第一个返回匹配的字符串的范围, 如果没有则返回nil
 */
- (NSRange)firstMatchRangeWithPattern:(NSString *)pattern;

/**
 *  匹配所有符合正则语法的结果, 返回匹配的结果(字符串)
 */
- (NSArray <NSString *> *)matchesStringWithPattern:(NSString *)pattern;

/**
 *  匹配所有符合正则语法的结果, 返回匹配的结果(原字符串中的范围)
 */
- (NSArray <NSValue *> *)matchesRangeWithPattern:(NSString *)pattern;

@end
