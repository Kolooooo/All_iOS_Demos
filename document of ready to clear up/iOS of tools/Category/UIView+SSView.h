//
//  UIView+SSView.h
//  SeekStar
//
//  Created by Ken_lu on 16/12/19.
//  Copyright © 2016年 模特. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SSView)


/**
 实例化xib

 @param XibName XibName
 @return 返回xib 视图
 */
+(instancetype)createXibViewWithXibName:(NSString *)XibName;

@end
