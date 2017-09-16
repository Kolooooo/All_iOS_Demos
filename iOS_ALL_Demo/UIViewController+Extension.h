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

@interface UIViewController (Extension)

/// 判断当前ViewController是push还是present的方式显示
///
/// return 当前控制器push还是present的显示方式
-(PushType)pushTypeOfCurrentViewController;

/**
 实例化Storyboard 控制器

 @param storyboardName Storyboard 文件名
 @param identifier Storyboard 标记
 @return 实例化Storyboard 控制器
 */
+ (__kindof UIViewController * _Nonnull)viewControllerWithStoryboardName:(NSString *_Nonnull)storyboardName identifier:(NSString *_Nonnull)identifier;

/**
 打电话

 @param phoneNumber 电话号码
 */
- (void)takeThePhone:(NSString *_Nonnull)phoneNumber;

@end
