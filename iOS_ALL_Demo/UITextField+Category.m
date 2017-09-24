//
//  UITextField+Category.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 23/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "UITextField+Category.h"

@implementation UITextField (Category)

- (void)setPlaceholderColor:(UIColor *_Nonnull)color{
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)setPlaceholderFont:(UIFont *_Nonnull)placeholderFont{
    [self setValue:placeholderFont forKeyPath:@"_placeholderLabel.font"];
}

@end
