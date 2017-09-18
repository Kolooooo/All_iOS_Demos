//
//  NSObject+Extension.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 08/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)

- (void)logPrivateProperty{
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([UITextField class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        NSLog(@"%s", ivar_getName(ivar));
    }
    free(ivarList);
}

@end
