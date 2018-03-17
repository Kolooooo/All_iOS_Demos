//
//  Dog.m
//  SheJiMoShi_OC
//
//  Created by Ken_lu on 2018/3/1.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (void)eat {
    DEBUGLOG(@"%@ %s", NSStringFromClass(self.class) ,__func__);
}

- (void)sleep {    
    DEBUGLOG(@"%@ %s", NSStringFromClass(self.class) ,__func__);
}

@end
