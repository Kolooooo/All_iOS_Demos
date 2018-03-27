

#import <Foundation/Foundation.h>

@interface __Tool : NSObject

/**
 重复执行函数(多用于错误以后，重新执行，增强鲁棒性)
 
 @param target 目标对象
 @param sel 函数sel
 @param repeatCount 重复次数
 @param repeatFinish 次数重复执行完毕
 */
+ (void)__repeatPerformed:(id)target sel:(SEL)sel repeatCount:(NSInteger)repeatCount repeatFinish:(void(^)(void))repeatFinish;

@end
