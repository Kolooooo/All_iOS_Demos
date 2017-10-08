

#import "__UILabel.h"

@implementation __UILabel

// 修改绘制文字的区域，edgeInsets增加bounds
-(CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    // 调用父类该方法
    // 注意传入的UIEdgeInsetsInsetRect(bounds, self.edgeInsets),bounds是真正的绘图区域
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, self.edgeInsets) limitedToNumberOfLines:numberOfLines];
    
    //根据edgeInsets，修改绘制文字的bounds
    rect.origin.x -= self.edgeInsets.left;
    rect.origin.y -= self.edgeInsets.top;
    rect.size.width += self.edgeInsets.left + self.edgeInsets.right;
    rect.size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return rect;
}

//绘制文字
- (void)drawTextInRect:(CGRect)rect{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

#pragma mark - setter and getter
- (CGFloat)insetTop {
    return self.edgeInsets.top;
}

- (void)setInsetTop:(CGFloat)insetTop {
    self.edgeInsets = UIEdgeInsetsMake(insetTop, self.insetLeft, self.insetBottom, self.insetRight);
}

- (CGFloat)insetLeft {
    return self.edgeInsets.left;
}

- (void)setInsetLeft:(CGFloat)insetLeft {
    self.edgeInsets = UIEdgeInsetsMake(self.insetTop, insetLeft, self.insetBottom, self.insetRight);
}

- (CGFloat)insetBottom {
    return self.edgeInsets.top;
}

- (void)setInsetBottom:(CGFloat)insetBottom {
    self.edgeInsets = UIEdgeInsetsMake(self.insetTop, self.insetLeft, insetBottom, self.insetRight);
}

- (CGFloat)insetRight {
    return self.edgeInsets.top;
}

- (void)setInsetRight:(CGFloat)insetRight {
    self.edgeInsets = UIEdgeInsetsMake(self.insetTop, self.insetLeft, self.insetBottom, insetRight);
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.masksToBounds = cornerRadius > 0;
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

@end
