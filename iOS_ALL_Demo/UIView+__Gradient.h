

#import <UIKit/UIKit.h>

/**
 渐变方向

 - __GradientDirectionH: 渐变水平方向
 - __GradientDirectionV: 渐变垂直方向
 */
typedef NS_ENUM(NSUInteger, __GradientDirection) {
    __GradientDirectionH = 0,
    __GradientDirectionV = 1
};

@interface UIView (__Gradient)

/// 渐变的层
@property (nonatomic, strong) CAGradientLayer * _Nullable __gradientLayer;

/**
 设置渐变颜色，两色渐变，水平方向

 @param startColor 开始颜色
 @param endColor 结束颜色
 */
- (void)__setGradientColorWithStartColor:(UIColor *_Nullable)startColor
                                endColor:(UIColor *_Nullable)endColor;

/**
 设置渐变颜色，两色渐变，水平方向
 
 @param startColor 开始颜色
 @param endColor 结束颜色
 @param layerFrame 渐变图层的范围
 */
- (void)__setGradientColorWithStartColor:(UIColor *_Nullable)startColor
                                endColor:(UIColor *_Nullable)endColor
                              layerFrame:(CGRect)layerFrame;

/**
 设置渐变颜色，两色渐变
 
 @param startColor 开始颜色
 @param endColor 结束颜色
 @param layerFrame 渐变图层的范围
 @param gradientDirection 渐变图层的方向，水平方向 或 垂直方向
 */
- (void)__setGradientColorWithStartColor:(UIColor *_Nullable)startColor
                                endColor:(UIColor *_Nullable)endColor
                              layerFrame:(CGRect)layerFrame
                       gradientDirection:(__GradientDirection)gradientDirection;

@end
