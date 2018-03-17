//
//  FactoryPatternController.m
//  SheJiMoShi_OC
//
//  Created by Ken_lu on 2018/3/1.
//  Copyright © 2018年 Ken lu. All rights reserved.
//

#import "FactoryPatternController.h"
#import "AnimalFactory.h"

@interface FactoryPatternController ()

@end

@implementation FactoryPatternController

- (void)viewDidLoad {
    [super viewDidLoad];

    Animal *dog = [AnimalFactory animalWithClass:AnimalClassDog];
    [dog eat]; // log: Dog -[Dog eat]
    [dog sleep]; // log: Dog -[Dog sleep]
    
    Animal *cat = [AnimalFactory animalWithClass:AnimalClassCat];
    [cat eat]; // log: Cat -[Cat eat]
    [cat sleep]; // log: Cat -[Cat sleep]
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static BOOL isOpen = YES;
    
    NSLog(@"%@", @(isOpen)); // 点击第一次log: YES, 点击第二次log: NO
    
    if (isOpen) {
        isOpen = NO;
    }
}

@end
