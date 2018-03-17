

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

- (void)__keyboardShowToUp:(UIView *)showView {
    UIView *weakShowView = showView;
    
    NSTimeInterval animationDuration = 0.25f;
    CGRect frame = weakShowView.frame;
    frame.origin.y -= 216;
    frame.size.height +=216;
    weakShowView.frame = frame;
    
    [UIView beginAnimations:@"keyboardShowOrHidden" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    weakShowView.frame = frame;
    
    [UIView commitAnimations];
}

- (void)__keyboardHiddenToDown:(UIView *)hiddenView {
    UIView *weakHiddenView = hiddenView;
    
    NSTimeInterval animationDuration = 0.25f;
    
    CGRect frame = weakHiddenView.frame;
    frame.origin.y += 216;
    frame.size.height -= 216;
    weakHiddenView.frame = frame;
    
    // self.view移回原位置
    [UIView beginAnimations:@"keyboardShowOrHidden" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    weakHiddenView.frame = frame;
    
    [UIView commitAnimations];
    [self resignFirstResponder];
}

@end

