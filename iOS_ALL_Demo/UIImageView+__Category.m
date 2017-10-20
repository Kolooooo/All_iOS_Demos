

#import "UIImageView+__Category.h"

@implementation UIImageView (__Category)

- (void)__setAnimationWithImages:(NSArray<UIImage *> *_Nonnull)animationImages
            animationRepeatCount:(NSInteger)animationRepeatCount
               animationDuration:(NSTimeInterval)animationDuration{
    // 设置图片的序列帧 图片数组
    self.animationImages = animationImages;
    //动画重复次数
    self.animationRepeatCount = animationRepeatCount;
    //动画执行时间,多长时间执行完动画
    self.animationDuration = animationDuration;
    //开始动画
    [self startAnimating];
}

- (void)__setblurStyleWithFrame:(CGRect)frame style:(UIBlurEffectStyle)style returnVisualEffectView:(UIVisualEffectView **)visualEffectView{
    UIVisualEffectView *visualEfView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:style]];
    visualEfView.frame = frame;
    *visualEffectView = visualEfView;
    [self addSubview:visualEfView];
}

@end
