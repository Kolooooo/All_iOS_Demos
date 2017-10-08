//
//  UIButton+KKButton.m
//  SeekStar
//
//  Created by Ken_lu on 17/1/5.
//  Copyright © 2017年 模特. All rights reserved.
//

#import "UIButton+Category.h"
#import <objc/runtime.h>


@implementation UIButton (Category)

- (void)setTitleOnLeftIconOnRight{
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat titleLabelWidth = self.titleLabel.bounds.size.width;
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleLabelWidth, 0, -titleLabelWidth)];
}

+ (void)load{
    /*
     * 思路：
     *   1.拦截系统UIControl 的sendAction:to:forEvent: 方法。
     *   2.利用runtime 替换sendAction:to:forEvent: 方法成自定义的__sendAction:to:forEvent: 方法，其中加入打印代码。
     *   3.重新调用原来按钮事件的实现逻辑。
     */
    [self __exchangeMethodWithOriginSEL:@selector(sendAction:to:forEvent:)
                            exchangeSEL:@selector(__sendAction:to:forEvent:)];
}

- (void)__sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    NSLog(@"Class: %@ -> SEL: %@",
          NSStringFromClass([target class]), NSStringFromSelector(action));
    
    // 重新调用原来按钮事件的实现逻辑，现在调用的替换方法就是原方法
    [self __sendAction:action to:target forEvent:event];
}

@end
