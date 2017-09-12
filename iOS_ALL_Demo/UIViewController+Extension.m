//
//  UIViewController+KKUIViewController.m
//  SeekStar
//
//  Created by Ken_lu on 17/1/7.
//  Copyright © 2017年 模特. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

-(PushType)pushTypeOfCurrentViewController{
    NSArray *viewcontrollers = self.navigationController.viewControllers;
    if (viewcontrollers.count > 1){
        if ([viewcontrollers objectAtIndex:viewcontrollers.count - 1] == self){
            //push方式
            return PushTypePush;
        }
    }else{
        //present方式
        return PushTypePresent;
    }
    return PushTypeNone;
}

+ (__kindof UIViewController * _Nonnull)viewControllerWithStoryboardName:(NSString *_Nonnull)storyboardName identifier:(NSString *_Nonnull)identifier{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:identifier];
}

@end
