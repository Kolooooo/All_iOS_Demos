//
//  Animal.h
//  SheJiMoShi_OC
//
//  Created by Ken_lu on 2018/3/1.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AnimalClass) {
    AnimalClassDog,
    AnimalClassCat
};

@interface Animal : NSObject

- (void)eat;
- (void)sleep;

@end
