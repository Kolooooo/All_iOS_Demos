//
//  UIButton+KKButton.m
//  SeekStar
//
//  Created by Ken_lu on 17/1/5.
//  Copyright © 2017年 模特. All rights reserved.
//

#import "UIButton+KKButton.h"

@implementation UIButton (KKButton)

-(void)KK_titleInLeftAndIconInRight{
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.imageView.image.size.width, 0, self.imageView.image.size.width)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleLabel.bounds.size.width, 0, -self.titleLabel.bounds.size.width)];
}

@end
