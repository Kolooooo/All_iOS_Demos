

#import "UIButton+__Category.h"
#import <objc/runtime.h>

@interface UIButton ()

@property (nonatomic, strong) NSNumber *__isShowing;

@end

@implementation UIButton (__Category)

- (void)__setTitleOnLeftIconOnRight:(CGFloat)spacing{
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat titleLabelWidth = self.titleLabel.bounds.size.width;
    
    CGFloat spacing_0_5 = spacing * 0.5;
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageWidth - spacing_0_5, 0, imageWidth + spacing_0_5)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleLabelWidth + spacing_0_5, 0, -titleLabelWidth - spacing_0_5)];
}

- (void)__setImageTopAndTitleBottom:(CGFloat)spacing{
    self.titleLabel.backgroundColor = [UIColor greenColor];
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
}

+ (void)load{
    /*
     * 思路：
     *   1.拦截系统UIControl 的sendAction:to:forEvent: 方法。
     *   2.利用runtime 替换sendAction:to:forEvent: 方法成自定义的__sendAction:to:forEvent: 方法，其中加入打印代码。
     *   3.重新调用原来按钮事件的实现逻辑。
     */
#ifdef DEBUG
    [self __exchangeInstanceMethodWithOriginSEL:@selector(sendAction:to:forEvent:)
                                    exchangeSEL:@selector(__sendAction:to:forEvent:)];
#else
#endif
}

- (void)__sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    NSLog(@"Class: %@ -> SEL: %@",
          NSStringFromClass([target class]), NSStringFromSelector(action));
    
    // 重新调用原来按钮事件的实现逻辑，现在调用的替换方法就是原方法
    [self __sendAction:action to:target forEvent:event];
}

#pragma mark - private method
- (void)set__string:(NSString *)__string {
    objc_setAssociatedObject(self, @selector(__string), __string, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)__string {
    return objc_getAssociatedObject(self, @selector(__string));
}

- (void)set__object:(id)__object {
    objc_setAssociatedObject(self, @selector(__object), __object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)__object {
    return objc_getAssociatedObject(self, @selector(__object));
}

@end
