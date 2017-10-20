

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GetArraySomeNumType) {
    GetArraySomeNumTypeSum = 1,
    GetArraySomeNumTypeAvg = 2,
    GetArraySomeNumTypeMax = 3,
    GetArraySomeNumTypeMin = 4
};

@interface NSArray (Category)

/**
 打印数组
 */
- (void)logs;

/// NSArray 快速求总和 最大值 最小值 和 平均值
- (float)getArraySomeNumWithType:(GetArraySomeNumType)getArraySomeNumType;

@end
