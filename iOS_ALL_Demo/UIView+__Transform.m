

#import "UIView+__Transform.h"

@implementation UIView (__Transform)

- (void)__setTransformRotateWithAngle:(CGFloat)angle{
    //在当前的head.transform的基础上再旋转
    self.transform = CGAffineTransformRotate(self.transform, angle);
}

- (void)__setTransformRotateWithAngle:(CGFloat)angle duration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        [self __setTransformRotateWithAngle:angle];
    }];
}

- (void)__setTransformTranslateWithTx:(CGFloat)tx ty:(CGFloat)ty{
    //在当前的head.transform的基础上平移
    self.transform = CGAffineTransformTranslate(self.transform, tx, ty);
}

- (void)__setTransformTranslateWithTx:(CGFloat)tx ty:(CGFloat)ty duration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        [self __setTransformTranslateWithTx:tx ty:ty];
    }];
}

- (void)__setTransformScaleWithSx:(CGFloat)sx sy:(CGFloat)sy{
    //在当前的head.transform的基础上缩放
    self.transform = CGAffineTransformScale(self.transform, sx, sy);
}

- (void)__setTransformScaleWithSx:(CGFloat)sx sy:(CGFloat)sy duration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        [self __setTransformScaleWithSx:sx sy:sy];
    }];
}

- (void)__setBackgroundColor:(UIColor *_Nonnull)backgroundColor duration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        self.backgroundColor = backgroundColor;
    }];
}

- (void)__setAlpha:(CGFloat)alpha duration:(NSTimeInterval)duration isRemoveFromSuperview:(BOOL)isRemoveFromSuperview{
    [UIView animateWithDuration:duration animations:^{
        self.alpha = alpha;
    }completion:^(BOOL finished) {
        if (isRemoveFromSuperview) {
            [self removeFromSuperview];
        }
    }];
}

@end


