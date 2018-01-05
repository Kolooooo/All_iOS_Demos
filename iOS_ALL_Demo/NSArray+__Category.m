

#import "NSArray+__Category.h"

@implementation NSArray (__Category)

- (CGFloat)__getArraySomeNumWithType:(GetArraySomeNumType)getArraySomeNumType{
    if (getArraySomeNumType == GetArraySomeNumTypeSum) {
        return [[self valueForKeyPath:@"@sum.floatValue"] floatValue];
    }
    
    if (getArraySomeNumType == GetArraySomeNumTypeAvg) {
        return[[self valueForKeyPath:@"@avg.floatValue"] floatValue];
    }
    
    if (getArraySomeNumType == GetArraySomeNumTypeMax) {
        return[[self valueForKeyPath:@"@max.floatValue"] floatValue];
    }
    
    if (getArraySomeNumType == GetArraySomeNumTypeMin) {
        return[[self valueForKeyPath:@"@min.floatValue"] floatValue];
    }
    
    NSAssert(NO, @"数组没有计算出任何结果");
    return 0.0f;
}

@end
