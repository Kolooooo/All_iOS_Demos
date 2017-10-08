

#import "__UITextView.h"

@interface __UITextView()

@property (nonatomic, strong) UILabel *placeHolderLabel;
@property (nonatomic, copy) NSString *placeHolderLabelText;

@end


@implementation __UITextView

@synthesize placeholder = _placeholder;
@synthesize placeholderColor = _placeholderColor;

#pragma mark - LifeCycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIEdgeInsets insets = self.textContainerInset;
    [_placeHolderLabel setFrame:CGRectMake(insets.left + 5, insets.top, CGRectGetWidth(self.bounds) - (insets.left + insets.right + 10), CGRectGetHeight(_placeHolderLabel.frame))];
    [_placeHolderLabel sizeToFit];
    
    if (self.text.length == 0 && self.placeholder.length > 0) {
        [self.placeHolderLabel setAlpha:1];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Event Response

- (void)textChanged:(NSNotification *)notification {
    if (self.placeholder.length == 0) {
        return;
    }
    if (self.text.length == 0) {
        [self.placeHolderLabel setAlpha:1];
    } else {
        [self.placeHolderLabel setAlpha:0];
    }
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}

#pragma mark - Property method

- (void)setMasksToBounds:(BOOL)masksToBounds {
    self.layer.masksToBounds = masksToBounds;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (NSString *)placeholder {
    return _placeholder;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder.copy;
    self.placeHolderLabelText = placeholder;
}

- (UIColor *)placeholderColor {
    if (_placeholderColor == nil) {
        _placeholderColor = [UIColor lightGrayColor];
    }
    return _placeholderColor;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    self.placeHolderLabel.textColor = placeholderColor;
    [self.placeHolderLabel sizeToFit];
}

- (UILabel *)placeHolderLabel {
    if (_placeHolderLabel == nil && self.placeholder.length > 0) {
        _placeHolderLabel = [[UILabel alloc] init];
        _placeHolderLabel.textColor = self.placeholderColor;
        _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _placeHolderLabel.font = self.font;
        _placeHolderLabel.backgroundColor = [UIColor clearColor];
        _placeHolderLabel.alpha = 0;
        _placeHolderLabel.numberOfLines = 0;
        _placeHolderLabel.text = self.placeHolderLabelText;
        [self addSubview:_placeHolderLabel];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    return _placeHolderLabel;
}

@end
