//
//  UIView+Frame.h
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 24/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

#pragma mark frame
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

#pragma mark new property 
@property (nonatomic, assign) BOOL    masksToBounds;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;

@end
