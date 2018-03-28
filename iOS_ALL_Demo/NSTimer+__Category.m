//
//  NSTimer+__Category.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2018/3/29.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import "NSTimer+__Category.h"

@interface NSTimer ()

@property (nonatomic, strong) NSNumber *__integerNumber;

@end

@implementation NSTimer (__Category)
- (NSInteger)__integer {
    return [[self __integerNumber] integerValue];
}

- (void)set__integer:(NSInteger)__integer {
    [self set__integerNumber:@(__integer)];
}

- (void)set__integerString:(NSNumber *)__integerNumber {
    objc_setAssociatedObject(self, @selector(__integerNumber), __integerNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)__integerNumber {
    return objc_getAssociatedObject(self, @selector(__integerNumber));
}

- (void)set__object:(id)__object {
    objc_setAssociatedObject(self, @selector(__object), __object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)__object {
    return objc_getAssociatedObject(self, @selector(__object));
}

@end
