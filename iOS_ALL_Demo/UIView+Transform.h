//
//  UIView+Transform.h
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 24/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Transform)

/**
 设置视图旋转

 @param angle 旋转角度
     #define M_PI        3.14159265358979323846264338327950288    pi
     #define M_PI_2      1.57079632679489661923132169163975144    pi/2
     #define M_PI_4      0.785398163397448309615660845819875721   pi/4
 */
- (void)setTransformRotateWithAngle:(CGFloat)angle;

/**
 设置视图旋转

 @param angle 旋转角度
     #define M_PI        3.14159265358979323846264338327950288    pi
     #define M_PI_2      1.57079632679489661923132169163975144    pi/2
     #define M_PI_4      0.785398163397448309615660845819875721   pi/4

 @param duration 旋转带动画，动画时间
 */
- (void)setTransformRotateWithAngle:(CGFloat)angle duration:(NSTimeInterval)duration;

/**
 设置视图平移
 
 @param tx x轴平移
 @param ty y轴平移
 */
- (void)setTransformTranslateWithTx:(CGFloat)tx ty:(CGFloat)ty;

/**
 设置视图平移
 
 @param tx x轴平移
 @param ty y轴平移
 @param duration 平移带动画，动画时间
 */
- (void)setTransformTranslateWithTx:(CGFloat)tx ty:(CGFloat)ty duration:(NSTimeInterval)duration;

/**
 设置视图缩放

 @param sx x轴缩放
 @param sy y轴缩放
 */
- (void)setTransformScaleWithSx:(CGFloat)sx sy:(CGFloat)sy;

/**
 设置视图缩放
 
 @param sx x轴缩放
 @param sy y轴缩放
 @param duration 缩放带动画，动画时间
 */
- (void)setTransformScaleWithSx:(CGFloat)sx sy:(CGFloat)sy duration:(NSTimeInterval)duration;

/**
 设置视图背景颜色

 @param backgroundColor 背景颜色
 @param duration 设置背景颜色带动画，动画时间
 */
- (void)setBackgroundColor:(UIColor *_Nonnull)backgroundColor duration:(NSTimeInterval)duration;

/**
 设置视图的透明度
 
 @param alpha 透明度
 @param duration 设置视图的透明度带动画，动画时间
 @param isRemoveFromSuperview 动画完成以后是否需要从父视图移除
 */
- (void)setAlpha:(CGFloat)alpha duration:(NSTimeInterval)duration isRemoveFromSuperview:(BOOL)isRemoveFromSuperview;

@end
