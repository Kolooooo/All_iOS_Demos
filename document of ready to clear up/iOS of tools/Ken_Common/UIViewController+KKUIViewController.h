//
//  UIViewController+KKUIViewController.h
//  SeekStar
//
//  Created by Ken_lu on 17/1/7.
//  Copyright © 2017年 模特. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, PushType) {
    PushTypeNone = 0,
    PushTypePush = 1,
    PushTypePresent = 2
};


@interface UIViewController (KKUIViewController)

/// 判断当前ViewController是push还是present的方式显示
///
/// return 当前控制器push还是present的显示方式
-(PushType)KK_currentViewControllerPushType;

@end
