//
//  UIView+Transform.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 24/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "UIView+Transform.h"

@implementation UIView (Transform)

- (void)setTransformRotateWithAngle:(CGFloat)angle{
    //在当前的head.transform的基础上再旋转
    self.transform = CGAffineTransformRotate(self.transform, angle);
}

- (void)setTransformRotateWithAngle:(CGFloat)angle duration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        [self setTransformRotateWithAngle:angle];
    }];
}

- (void)setTransformTranslateWithTx:(CGFloat)tx ty:(CGFloat)ty{
    //在当前的head.transform的基础上平移
    self.transform = CGAffineTransformTranslate(self.transform, tx, ty);
}

- (void)setTransformTranslateWithTx:(CGFloat)tx ty:(CGFloat)ty duration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        [self setTransformTranslateWithTx:tx ty:ty];
    }];
}

- (void)setTransformScaleWithSx:(CGFloat)sx sy:(CGFloat)sy{
    //在当前的head.transform的基础上缩放
    self.transform = CGAffineTransformScale(self.transform, sx, sy);
}

- (void)setTransformScaleWithSx:(CGFloat)sx sy:(CGFloat)sy duration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        [self setTransformScaleWithSx:sx sy:sy];
    }];
}

- (void)setBackgroundColor:(UIColor *_Nonnull)backgroundColor duration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        self.backgroundColor = backgroundColor;
    }];
}

- (void)setAlpha:(CGFloat)alpha duration:(NSTimeInterval)duration isRemoveFromSuperview:(BOOL)isRemoveFromSuperview{
    [UIView animateWithDuration:duration animations:^{
        self.alpha = alpha;
    }completion:^(BOOL finished) {
        if (isRemoveFromSuperview) {
            [self removeFromSuperview];
        }
    }];
}

@end


