

#import <Foundation/Foundation.h>

/// 映射类
@interface __Reflex : NSObject

/**
 映射执行方法(分离解耦合)
 eg: [__Reflex __reflexPerformSelectorWithClassString:@"ClassString" selString:@"Func"];

 @param classString 映射的调用方法的对象
 @param selString 映射的调用的方法sel
 */
+ (void)__reflexPerformSelectorWithClassString:(NSString * _Nonnull)classString selString:(NSString * _Nonnull)selString;

/**
 自定义__performSelector(系统方法有警告提示，所以使用这个)

 @param target 调用方法的对象
 @param sel 调用的方法sel
 */
+ (void)__performSelectorWithTarget:(id _Nonnull)target sel:(SEL _Nonnull)sel;

@end
