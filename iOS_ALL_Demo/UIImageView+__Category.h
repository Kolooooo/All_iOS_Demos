

#import <UIKit/UIKit.h>

@interface UIImageView (__Category)

/**
 设置圆角（高效）

 @param cornerRadius 设置圆角大小
 */
- (void)__setCornerRadius:(CGFloat)cornerRadius;

/**
 设置图片动画

 @param animationImages 图片组
 @param animationRepeatCount 动画重复时间
 @param animationDuration 动画时长
 */
- (void)__setAnimationWithImages:(NSArray<UIImage *> *_Nonnull)animationImages
            animationRepeatCount:(NSInteger)animationRepeatCount
               animationDuration:(NSTimeInterval)animationDuration;

/**
 设置毛玻璃效果

 @param frame frame
 @param style 毛玻璃类型
 @param visualEffectView 返回的毛玻璃视图对象，正对它的contentView 还可以在毛玻璃上添加视图
 */
- (void)__setblurStyleWithFrame:(CGRect)frame style:(UIBlurEffectStyle)style returnVisualEffectView:(UIVisualEffectView *_Nullable*_Nullable)visualEffectView;

@end
