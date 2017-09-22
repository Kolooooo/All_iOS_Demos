//
//  UIButton+KKButton.m
//  SeekStar
//
//  Created by Ken_lu on 17/1/5.
//  Copyright © 2017年 模特. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)

- (void)titleOnLeftAndIconOnRight{
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat titleLabelWidth = self.titleLabel.bounds.size.width;
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleLabelWidth, 0, -titleLabelWidth)];
}

@end
