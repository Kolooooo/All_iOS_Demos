





#import "NSString+RegularExpression.h"

@implementation NSString (RegularExpression)

- (NSRange)firstMatchRangeWithPattern:(NSString *)pattern
{
    NSError *error;
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    if (error) {
        NSLog(@"正则创建失败");
        return NSMakeRange(0, 0);
    }
    
    NSTextCheckingResult *result = [regular firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    
    if (result == nil) {
        NSLog(@"没有匹配结果");
        return NSMakeRange(0, 0);
    }
    
    return result.range;
}

- (NSString *)firstMatchStringWithPattern:(NSString *)pattern
{
    NSError *error;
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    if (error) {
        NSLog(@"正则创建失败");
        return nil;
    }
    
    NSTextCheckingResult *result = [regular firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    
    if (result == nil) {
        NSLog(@"没有匹配结果");
        return nil;
    }
    
    return [self substringWithRange:result.range];
}

- (NSArray <NSString *> *)matchesStringWithPattern:(NSString *)pattern
{
    NSError *error;
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    
    NSArray <NSTextCheckingResult *> *resultArray = [regular matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    
    if (resultArray.count == 0) {
        NSLog(@"没有匹配结果");
        return nil;
    }
    
    NSMutableArray *tempArrM = [NSMutableArray array];
    // 从每个Result当中获取子字符串
    for (NSTextCheckingResult *result in resultArray) {
        NSString *subString = [self substringWithRange:result.range];
        [tempArrM addObject:subString];
    }
    
    return [tempArrM copy];
}

- (NSArray<NSValue *> *)matchesRangeWithPattern:(NSString *)pattern
{
    NSError *error;
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    
    NSArray <NSTextCheckingResult *> *resultArray = [regular matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    
    if (resultArray.count == 0) {
        NSLog(@"没有匹配结果");
        return nil;
    }

    NSMutableArray *tempArrM = [NSMutableArray array];
    // 从每个Result当中获取 包装了Range的NSValue
    for (NSTextCheckingResult *result in resultArray) {
        NSValue *value = [NSValue valueWithRange:result.range];
        [tempArrM addObject:value];
    }
    
    return [tempArrM copy];
}

@end
