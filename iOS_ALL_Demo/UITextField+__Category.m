

#import "UITextField+__Category.h"

@implementation UITextField (__Category)

- (void)__setPlaceholderColor:(UIColor *_Nonnull)color{
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)__setPlaceholderFont:(UIFont *_Nonnull)placeholderFont{
    [self setValue:placeholderFont forKeyPath:@"_placeholderLabel.font"];
}

- (void)__setLeftContentPadding:(CGFloat)leftPadding{
    self.leftViewMode = UITextFieldViewModeAlways ;
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftPadding, 0)];
}

@end
