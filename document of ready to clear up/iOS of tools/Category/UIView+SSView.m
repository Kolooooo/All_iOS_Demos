//
//  UIView+SSView.m
//  SeekStar
//
//  Created by Ken_lu on 16/12/19.
//  Copyright © 2016年 模特. All rights reserved.
//

#import "UIView+SSView.h"

@implementation UIView (SSView)

+(instancetype)createXibViewWithXibName:(NSString *)XibName{
    return [[[NSBundle mainBundle]loadNibNamed:XibName owner:nil options:nil] lastObject];
}


@end
