//
//  UITextView+__Category.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/11/24.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "UITextView+__Category.h"

@implementation UITextView (__Category)

- (CGFloat)__contantHeight{
    CGSize size = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)];
    return size.height;
}

@end
