

#import "NSArray+Category.h"

@implementation NSArray (Category)

- (void)logs{
    id obj;
    for (obj in self) {
        NSLog(@"obj: \n%@", obj);
    }
}

- (float)getArraySomeNumWithType:(GetArraySomeNumType)getArraySomeNumType{
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
