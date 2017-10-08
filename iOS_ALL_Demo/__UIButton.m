

#import "__UIButton.h"

@interface __UIButton ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@end

@implementation __UIButton

- (void)layoutSubviews {
    [super layoutSubviews];
    self.indicatorView.center = CGPointMake(CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame)/2.0);
}

#pragma mark - Public method

- (void)showIndicator {
    self.enabled = NO;
    self.title = self.titleLabel.text;
    self.image = self.imageView.image;
    [self setTitle:@"" forState:UIControlStateNormal];
    [self setImage:nil forState:UIControlStateNormal];
    [self addSubview:self.indicatorView];
    [self.indicatorView startAnimating];
}

- (void)hideIndicator {
    self.enabled = YES;
    [self setTitle:self.title forState:UIControlStateNormal];
    [self setImage:self.image forState:UIControlStateNormal];
    [self.indicatorView removeFromSuperview];
    [self.indicatorView stopAnimating];
}

#pragma mark - Property method

- (BOOL)masksToBounds {
    return self.layer.masksToBounds;
}

- (void)setMasksToBounds:(BOOL)masksToBounds {
    self.layer.masksToBounds = masksToBounds;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
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
    if (borderColor) {
        self.layer.borderColor = borderColor.CGColor;
    }
}

- (CGFloat)shadowOpacity {
    return self.layer.shadowOpacity;
}

- (void)setShadowOpacity:(CGFloat)shadowOpacity {
    self.layer.shadowOpacity = shadowOpacity;
}

- (CGFloat)shadowRadius {
    return self.layer.shadowRadius;
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
    self.layer.shadowRadius = shadowRadius;
}

- (CGSize)shadowOffset {
    return self.layer.shadowOffset;
}

- (void)setShadowOffset:(CGSize)shadowOffset {
    self.layer.shadowOffset = shadowOffset;
}

- (UIColor *)shadowColor {
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}

- (void)setShadowColor:(UIColor *)shadowColor {
    self.layer.shadowColor = shadowColor.CGColor;
}

- (UIColor *)normalBackgroundColor {
    return [[self backgroundImageForState:UIControlStateNormal] colorAtPixel:CGPointMake(0, 0)];
}

- (void)setNormalBackgroundColor:(UIColor *)normalBackgroundColor {
    if (normalBackgroundColor) {
        [self setBackgroundImage:[UIImage imageWithColor:normalBackgroundColor] forState:UIControlStateNormal];
    } else {
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }
}

- (UIColor *)selectedBackgroundColor {
    return [[self backgroundImageForState:UIControlStateSelected] colorAtPixel:CGPointMake(0, 0)];
}

- (void)setSelectedBackgroundColor:(UIColor *)selectedBackgroundColor {
    if (selectedBackgroundColor) {
        [self setBackgroundImage:[UIImage imageWithColor:selectedBackgroundColor] forState:UIControlStateSelected];
    } else {
        [self setBackgroundImage:nil forState:UIControlStateSelected];
    }
}

- (UIActivityIndicatorView *)indicatorView {
    if (_indicatorView == nil) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    return _indicatorView;
}

@end
