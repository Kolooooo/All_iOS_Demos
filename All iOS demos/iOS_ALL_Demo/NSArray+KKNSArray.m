//
//  NSArray+KKNSArray.m
//  SeekStar
//
//  Created by Ken_lu on 17/1/7.
//  Copyright © 2017年 模特. All rights reserved.
//

#import "NSArray+KKNSArray.h"

@implementation NSArray (KKNSArray)

- (float)KK_getArraySomeNumWithType:(GetArraySomeNumType)getArraySomeNumType{
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
