

#import <UIKit/UIKit.h>

@interface UIImageView (__Category)

/**
 设置图片动画

 @param animationImages 图片组
 @param animationRepeatCount 动画重复时间
 @param animationDuration 动画时长
 */
- (void)__setAnimationWithImages:(NSArray<UIImage *> *_Nonnull)animationImages
            animationRepeatCount:(NSInteger)animationRepeatCount
               animationDuration:(NSTimeInterval)animationDuration;

@end
