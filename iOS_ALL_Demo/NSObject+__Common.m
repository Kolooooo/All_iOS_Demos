

#import "NSObject+__Common.h"

@implementation NSObject (__Common)

#pragma mark - 数据持久化
- (void)__removeAllUserDefaults{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

#pragma mark - 杂类模块
+ (NSArray *)__getAllSubclasses{
    Class myClass = [self class];
    NSMutableArray *mySubclasses = [NSMutableArray array];
    unsigned int numOfClasses;
    Class *classes = objc_copyClassList(&numOfClasses);
    for (unsigned int ci = 0; ci < numOfClasses; ci++)
    {
        Class superClass = classes[ci];
        do{
            superClass = class_getSuperclass(superClass);
        } while (superClass && superClass != myClass);
        
        if (superClass)
        {
            [mySubclasses addObject: classes[ci]];
        }
    }
    free(classes);
    return mySubclasses;
}

- (void)__setStatusBarBackgroundColor:(UIColor *)color{
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]){
        statusBar.backgroundColor = color;
    }
}

- (void)__banLockScreen{
    // 第一种
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    // 第二种
    // [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
}

void __enumerateFonts(){
    for(NSString *familyName in [UIFont familyNames]){
        NSLog(@"%@",familyName);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for(NSString *fontName in fontNames){
            NSLog(@"\t|- %@",fontName);
        }
    }
}

#pragma mark - 防御式编程
- (BOOL)__isNull{
    return (self == NULL);
}

- (BOOL)__isNil{
    return (self == nil);
}

- (BOOL)__isNilAndNull{
    return (self == NULL && self == nil);
}

- (BOOL)__isNoOne{
    if ([self __isNilAndNull]) {
        NSAssert(NO, @"这个对象为空");
        return NO;
    }
    
    if ([self isKindOfClass:[NSString class]]) {
        NSString *obj = (NSString *)self;
        return (obj.length == 0);
    }
    
    if ([self isKindOfClass:[NSDictionary class]]) {
        NSDictionary *obj = (NSDictionary *)self;
        return (obj.count == 0);
    }
    
    if ([self isKindOfClass:[NSArray class]]) {
        NSArray *obj = (NSArray *)self;
        return (obj.count == 0);
    }
    
    NSAssert(NO, @"这个类型有可能不是集合");
    return NO;
}

- (id _Nullable)loadJsonDocument:(NSString *)name ofType:(NSString *)type{
    NSString *file =[[NSBundle mainBundle] pathForResource:name ofType:type];
    NSData *data = [NSData dataWithContentsOfFile:file];
    NSError *error;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error != nil) {
        NSAssert(NO, @"json 文件解析失败");
        return nil;
    }
    
    return jsonObject;
}

@end
