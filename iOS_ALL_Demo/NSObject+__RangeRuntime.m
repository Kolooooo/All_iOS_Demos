

#import "NSObject+__RangeRuntime.h"
#import <objc/runtime.h>

/// NSObject 的功能分类
@implementation NSObject (__RangeRuntime)
/// 交换类方法
///
/// @param class          类名
/// @param originSelector 原来的方法
/// @param otherSelector  更换的方法
+ (void)swizzleClassMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    // class_getClassMethod：得到类的类方法
    Method otherMehtod = class_getClassMethod(class, otherSelector);
    Method originMehtod = class_getClassMethod(class, originSelector);
    // 交换2个方法的实现
    // method_exchangeImplementations：运行时动态交换两个方法
    method_exchangeImplementations(otherMehtod, originMehtod);
}

/// 交换实例方法
///
/// @param class          类名
/// @param originSelector 原来的方法
/// @param otherSelector  更换的方法
+ (void)swizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)otherSelector
{
    // class_getInstanceMethod：得到类的实例方法
    Method otherMehtod = class_getInstanceMethod(class, otherSelector);
    Method originMehtod = class_getInstanceMethod(class, originSelector);
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}

@end

@implementation NSArray (__RangeRuntime)
/// 使用load 方法再加载文件的时候就会自动加载这个方法
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        /*
         2016-09-20 22:39:41.801 nsarray[1337:56054]
         *** Terminating app due to uncaught exception 'NSRangeException', reason: '*** -[__NSArrayI objectAtIndex:]: index 2 beyond bounds [0 .. 1]'
         *** First throw call stack:
         (
         0   CoreFoundation                      0x000000010778ce65 __exceptionPreprocess + 165
         1   libobjc.A.dylib                     0x0000000107203deb objc_exception_throw + 48
         2   CoreFoundation                      0x000000010767b534 -[__NSArrayI objectAtIndex:] + 164
         3   nsarray                             0x0000000106d028ae -[ViewController viewDidLoad] + 174
         4   UIKit                               0x0000000107cd0f98 -[UIViewController loadViewIfRequired] + 1198
         5   UIKit                               0x0000000107cd12e7 -[UIViewController view] + 27
         6   UIKit                               0x0000000107ba7ab0 -[UIWindow addRootViewControllerViewIfPossible] + 61
         7   UIKit                               0x0000000107ba8199 -[UIWindow _setHidden:forced:] + 282
         8   UIKit                               0x0000000107bb9c2e -[UIWindow makeKeyAndVisible] + 42
         9   UIKit                               0x0000000107b32663 -[UIApplication _callInitializationDelegatesForMainScene:transitionContext:] + 4131
         10  UIKit                               0x0000000107b38cc6 -[UIApplication _runWithMainScene:transitionContext:completion:] + 1760
         11  UIKit                               0x0000000107b35e7b -[UIApplication workspaceDidEndTransaction:] + 188
         12  FrontBoardServices                  0x000000010a53a754 -[FBSSerialQueue _performNext] + 192
         13  FrontBoardServices                  0x000000010a53aac2 -[FBSSerialQueue _performNextFromRunLoopSource] + 45
         14  CoreFoundation                      0x00000001076b8a31 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 17
         15  CoreFoundation                      0x00000001076ae95c __CFRunLoopDoSources0 + 556
         16  CoreFoundation                      0x00000001076ade13 __CFRunLoopRun + 867
         17  CoreFoundation                      0x00000001076ad828 CFRunLoopRunSpecific + 488
         18  UIKit                               0x0000000107b357cd -[UIApplication _run] + 402
         19  UIKit                               0x0000000107b3a610 UIApplicationMain + 171
         20  nsarray                             0x0000000106d02bdf main + 111
         21  libdyld.dylib                       0x0000000109ee092d start + 1
         22  ???                                 0x0000000000000001 0x0 + 1
         )
         libc++abi.dylib: terminating with uncaught exception of type NSException
         */
        /// 上方错误提示是数组越界，错误类型：NSRangeException；出错的方法：[__NSArrayI objectAtIndex:]
        /// 数组越界出错的方法就是[__NSArrayI objectAtIndex:]，如果我们用runtime 在运行的时候交换成自定义方法来规避闪退问题
        [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayI") originSelector:@selector(objectAtIndex:) otherSelector:@selector(yb_objectAtIndex:)];
    });
}

- (id)yb_objectAtIndex:(NSInteger)index
{
    if (index < self.count) {
        return [self yb_objectAtIndex:index];
    } else {
        NSAssert(NO, @"数组越界了。。。。。。。");
        return nil;
    }
}

@end

@implementation NSMutableArray (runtime)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(insertObject:atIndex:) otherSelector:@selector(yb_insertObject:atIndex:)];
        [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(objectAtIndex:) otherSelector:@selector(yb_objectAtIndex:)];
    });
}

- (void)yb_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject != nil && index<=self.count) {
        [self yb_insertObject:anObject atIndex:index];
    }
}

- (id)yb_objectAtIndex:(NSInteger)index
{
    if (index < self.count) {
        return [self yb_objectAtIndex:index];
    } else {
        NSAssert(NO, @"数组越界了。。。。。。。");
        return nil;
    }
}

@end

@implementation NSDictionary (__RangeRuntime)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:NSClassFromString(@"__NSPlaceholderDictionary") originSelector:@selector(initWithObjects:forKeys:count:) otherSelector:@selector(yb_initWithObjects:forKeys:count:)];
    });
}

- (instancetype)yb_initWithObjects:(const id  _Nonnull __unsafe_unretained *)objects forKeys:(const id<NSCopying>  _Nonnull __unsafe_unretained *)keys count:(NSUInteger)cnt
{
    for (int i=0; i<cnt; i++) {
        if (objects[i] == nil) {
            return nil;
        }
    }
    return [self yb_initWithObjects:objects forKeys:keys count:cnt];
}

@end

@implementation NSMutableDictionary (__RangeRuntime)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleInstanceMethod:NSClassFromString(@"__NSDictionaryM") originSelector:@selector(setObject:forKey:) otherSelector:@selector(yb_setObject:forKey:)];
    });
}

- (void)yb_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject!=nil) {
        [self yb_setObject:anObject forKey:aKey];
    } else {
        NSAssert(NO, @"设置了字典的value为nil");
    }
}

@end


