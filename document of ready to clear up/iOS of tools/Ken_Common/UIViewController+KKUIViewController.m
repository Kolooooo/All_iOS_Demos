//
//  UIViewController+KKUIViewController.m
//  SeekStar
//
//  Created by Ken_lu on 17/1/7.
//  Copyright © 2017年 模特. All rights reserved.
//

#import "UIViewController+KKUIViewController.h"

@implementation UIViewController (KKUIViewController)

-(PushType)KK_currentViewControllerPushType{
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

@end
