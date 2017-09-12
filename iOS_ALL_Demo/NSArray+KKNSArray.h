//
//  NSArray+KKNSArray.h
//  SeekStar
//
//  Created by Ken_lu on 17/1/7.
//  Copyright © 2017年 模特. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GetArraySomeNumType) {
    GetArraySomeNumTypeSum = 1,
    GetArraySomeNumTypeAvg = 2,
    GetArraySomeNumTypeMax = 3,
    GetArraySomeNumTypeMin = 4
};

@interface NSArray (KKNSArray)

/// NSArray 快速求总和 最大值 最小值 和 平均值
- (float)KK_getArraySomeNumWithType:(GetArraySomeNumType)getArraySomeNumType;

@end
