//
//  NSString+Extension.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 08/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (id _Nonnull)objectFromClassName{
    Class objectClass = NSClassFromString(self);
    return [[objectClass alloc] init];
}

@end
