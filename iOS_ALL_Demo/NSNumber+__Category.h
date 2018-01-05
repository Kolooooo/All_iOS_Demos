

#import <Foundation/Foundation.h>

@interface NSNumber (__Category)

+ (CGFloat)__CGFloatFromString:(NSString *)string;
+ (CGFloat)__CGFloatFromNSInteger:(NSInteger)integer;
+ (CGFloat)__CGFloatFromInt:(int)intValue;

+ (NSString *)__NSStringFromInt:(int)intValue;
+ (NSString *)__NSStringFromNSInteger:(NSInteger)integer;
+ (NSString *)__NSStringFromFloat:(float)floatValue;
+ (NSString *)__NSStringFromCGFloat:(CGFloat)floatValue;
+ (NSString *)__NSStringFromNSNumber:(NSNumber *)numberValue;

@end
