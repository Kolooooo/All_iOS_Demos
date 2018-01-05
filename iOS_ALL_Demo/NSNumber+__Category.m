

#import "NSNumber+__Category.h"

@implementation NSNumber (__Category)

+ (CGFloat)__CGFloatFromString:(NSString *)string{
    return (CGFloat)[string floatValue];
}

+ (NSString *)__NSStringFromInt:(int)intValue{
    return [NSString stringWithFormat:@"%d",intValue];
}

+ (NSString *)__NSStringFromNSInteger:(NSInteger)integer{
    return [NSString stringWithFormat:@"%ld", (long)integer];
}

+ (NSString *)__NSStringFromFloat:(float)floatValue{
    return [NSString stringWithFormat:@"%f", floatValue];
}

+ (NSString *)__NSStringFromCGFloat:(CGFloat)floatValue{
    return [NSString stringWithFormat:@"%f", floatValue];
}

+ (CGFloat)__CGFloatFromNSInteger:(NSInteger)integer{
    return (CGFloat)[[NSNumber numberWithInteger:integer] floatValue];
}

+ (CGFloat)__CGFloatFromInt:(int)intValue{
    return (CGFloat)[[NSNumber numberWithInt:intValue] floatValue];
}

+ (NSString *)__NSStringFromNSNumber:(NSNumber *)numberValue{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    return [numberFormatter stringFromNumber:numberValue];
}

@end
