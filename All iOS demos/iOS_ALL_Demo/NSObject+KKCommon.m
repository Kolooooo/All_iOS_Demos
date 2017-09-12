//
//  NSObject+common.m
//  no
//
//  Created by Ken_lu on 17/1/2.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "NSObject+KKCommon.h"

@implementation NSObject (KKCommon)

#pragma mark - 数据持久化
-(void)KK_removeAllUserDefaults{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

#pragma mark - 杂类模块
+ (NSArray *)KK_getAllSubclasses{
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

- (void)KK_setStatusBarBackgroundColor:(UIColor *)color{
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]){
        statusBar.backgroundColor = color;
    }
    
}

-(void)KK_banLockScreen{
    // 第一种
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    // 第二种
    // [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
}

void KK_enumerateFonts(){
    for(NSString *familyName in [UIFont familyNames]){
        NSLog(@"%@",familyName);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for(NSString *fontName in fontNames){
            NSLog(@"\t|- %@",fontName);
        }
    }
}

#pragma mark - 防御式编程
-(BOOL)KK_isNull{
    return (self == NULL);
}

-(BOOL)KK_isNil{
    return (self == nil);
}

-(BOOL)KK_isNilAndNull{
    return (self == NULL && self == nil);
}

-(BOOL)KK_isNoOne{
    if ([self KK_isNilAndNull]) {
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

#pragma mark - 格式字符串验证
+(BOOL)KK_isValidateMobile:(NSString *) mobile {
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0-9])|(14[0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneTest evaluateWithObject:mobile];
}

+(BOOL)KK_isValidateEmail:(NSString *)email {
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneTest evaluateWithObject:email];
}

+ (BOOL)KK_isValiDatePassword:(NSString *)password {
    NSString *phoneRegex = @"[A-Z0-9a-z]";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneTest evaluateWithObject:password];
}

@end
