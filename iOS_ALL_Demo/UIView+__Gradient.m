

#import "UIView+__Gradient.h"

@implementation UIView (__Gradient)

#pragma mark - Public method
- (void)__setGradientColorWithStartColor:(UIColor *_Nullable)startColor
                                endColor:(UIColor *_Nullable)endColor
{
    [self setStartColor:startColor endColor:endColor layerFrame:self.bounds gradientDirection:__GradientDirectionH];
}

- (void)__setGradientColorWithStartColor:(UIColor *_Nullable)startColor
                                endColor:(UIColor *_Nullable)endColor
                              layerFrame:(CGRect)layerFrame
{
    [self setStartColor:startColor endColor:endColor layerFrame:layerFrame gradientDirection:__GradientDirectionH];
}

- (void)__setGradientColorWithStartColor:(UIColor *_Nullable)startColor
                                endColor:(UIColor *_Nullable)endColor
                              layerFrame:(CGRect)layerFrame
                       gradientDirection:(__GradientDirection)gradientDirection
{
    [self setStartColor:startColor endColor:endColor layerFrame:layerFrame gradientDirection:gradientDirection];
}

#pragma mark - private method
- (void)setStartColor:(UIColor *_Nullable)startColor
             endColor:(UIColor *_Nullable)endColor
           layerFrame:(CGRect)layerFrame
    gradientDirection:(__GradientDirection)gradientDirection
{
    if (!startColor) {
        NSAssert(NO, @"Not have start color");
        return;
    }
    
    if (!endColor) {
        NSAssert(NO, @"Not have end color");
        return;
    }
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self set__gradientLayer:gradientLayer];
    
    // colors 渐变的颜色
    gradientLayer.colors = @[
                             (__bridge id)startColor.CGColor,
                             (__bridge id)endColor.CGColor
                             ];
    
    // locations 渐变颜色的分割点
    gradientLayer.locations = @[
                                @0.0,
                                @1.0
                                ];
    
    // startPoint & endPoint 颜色渐变的方向, 范围在(0,0)与(1.0,1.0)之间
    gradientLayer.startPoint = CGPointMake(0, 0);
    
    if (gradientDirection == __GradientDirectionH) {
        gradientLayer.endPoint = CGPointMake(1.0, 0);
    }
    else if (gradientDirection == __GradientDirectionV){
        gradientLayer.endPoint = CGPointMake(0.0, 1.0);
    }
    
    gradientLayer.frame = layerFrame;
    
    [self.layer addSublayer:gradientLayer];
}

- (void)set__gradientLayer:(CAGradientLayer *)__gradientLayer{
    objc_setAssociatedObject(self, @selector(__gradientLayer), __gradientLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAGradientLayer *)__gradientLayer{
    return objc_getAssociatedObject(self, @selector(__gradientLayer));
}

@end
