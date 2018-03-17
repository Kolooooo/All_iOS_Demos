//
//  FactoryPattern.m
//  SheJiMoShi_OC
//
//  Created by Ken_lu on 2018/3/1.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import "AnimalFactory.h"
#import "Dog.h"
#import "Cat.h"

@implementation AnimalFactory

+ (Animal *_Nullable)animalWithClass:(AnimalClass)animalClass {
    
    if (animalClass == AnimalClassDog) {
        return [[Dog alloc] init];
    }
    else if (animalClass == AnimalClassCat) {
        return [[Cat alloc] init];
    }
    
    return nil;
}

@end
