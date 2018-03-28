

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, __IsShowing) {
    __YES,
    __NO
};

@interface UIButton (__Category)

@property (nonatomic, copy) NSString *__string;
@property (nonatomic, strong) id __object;

/**
 按钮文字在左边，iocn 在右边的布局

 @param spacing icon 与 文字的间隔
 */
- (void)__setTitleOnLeftIconOnRight:(CGFloat)spacing;

/**
 icon 在上，文字在下

 @param spacing icon 与 文字的间隔
 */
- (void)__setImageTopAndTitleBottom:(CGFloat)spacing;

@end
