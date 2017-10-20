

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (__Runtime)
/// 对象ID: 给个分类添加属性
@property (nonatomic, copy) NSString * _Nullable objectID;

/**
 交换方法

 @param originSEL 原方法
 @param exchangeSEL 需要交换的方法
 */
+ (void)__exchangeMethodWithOriginSEL:(SEL _Nonnull)originSEL exchangeSEL:(SEL _Nonnull)exchangeSEL;

/**
 打印类的实例变量列表
 */
- (void)__logIvarList;

/**
 打印类的属性列表
 */
- (void)__logPropertyList;

/**
 打印方法列表
 */
- (void)__logMethodList;

/**
 获取类方法

 @param sel 方法标识名
 @return 返回类方法
 */
- (Method _Nonnull)__getClassMethod:(SEL _Nonnull)sel;

/**
 获取实例方法

 @param sel 方法标识名
 @return 返回类方法
 */
- (Method _Nonnull)__getInstanceMethod:(SEL _Nonnull)sel;

/**
 给一个类添加方法

 @param addSel 方法标识名
 @return 是否添加成功
 */
- (BOOL)__addMethod:(SEL _Nonnull)addSel;

@end
