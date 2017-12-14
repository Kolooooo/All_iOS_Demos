

#import "NSAttributedString+__Category.h"

@implementation NSAttributedString (__Category)

- (instancetype _Nonnull)__setFont:(UIFont *)font{
    if (!self.string || self.string.length == 0) {
        return [[NSMutableAttributedString alloc] init];
    }
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    
    NSRange range = NSMakeRange(0, self.string.length);
    [attributedText addAttribute:NSFontAttributeName
                           value:font
                           range:range];
    
    return attributedText.copy;
}

- (instancetype _Nonnull)__setFont:(UIFont *)font range:(NSRange)range{
    if (!self.string || self.string.length == 0) {
        return [[NSMutableAttributedString alloc] init];
    }
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    
    [attributedText addAttribute:NSFontAttributeName
                           value:font
                           range:range];
    
    return attributedText.copy;
}

- (instancetype _Nonnull)__setFontColor:(UIColor *_Nonnull)color{
    if (!self.string || self.string.length == 0) {
        return [[NSMutableAttributedString alloc] init];
    }
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    
    NSRange range = NSMakeRange(0, self.string.length);
    [attributedText addAttribute:NSForegroundColorAttributeName
                           value:color
                           range:range];
    
    return attributedText.copy;
}

- (instancetype _Nonnull)__setFontColor:(UIColor *_Nonnull)color range:(NSRange)range{
    if (!self.string || self.string.length == 0) {
        return [[NSMutableAttributedString alloc] init];
    }
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    
    [attributedText addAttribute:NSForegroundColorAttributeName
                           value:color
                           range:range];
    
    return attributedText.copy;
}

- (instancetype _Nonnull)__setWordSpacing:(CGFloat)wordSpacing{
    if (!self.string || self.string.length == 0) {
        return [[NSMutableAttributedString alloc] init];
    }
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    
    NSRange range = NSMakeRange(0, self.string.length);
    [attributedText addAttribute:NSKernAttributeName
                           value:@(wordSpacing)
                           range:range];
    
    return attributedText.copy;
}

- (instancetype _Nonnull)__setWordSpacing:(CGFloat)wordSpacing range:(NSRange)range{
    if (!self.string || self.string.length == 0) {
        return [[NSMutableAttributedString alloc] init];
    }
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    
    [attributedText addAttribute:NSKernAttributeName
                           value:@(wordSpacing)
                           range:range];
    
    
    return attributedText.copy;
}

- (instancetype _Nonnull)__setLineSpacing:(CGFloat)lineSpacing{
    if (!self.string || self.string.length == 0) {
        return [[NSMutableAttributedString alloc] init];
    }
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    NSRange range = NSMakeRange(0, self.string.length);
    [attributedText addAttribute:NSParagraphStyleAttributeName
                           value:paragraphStyle
                           range:range];
    
    return attributedText.copy;
}

- (instancetype _Nonnull)__setLineSpacing:(CGFloat)lineSpacing range:(NSRange)range{
    if (!self.string || self.string.length == 0) {
        return [[NSMutableAttributedString alloc] init];
    }
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    [attributedText addAttribute:NSParagraphStyleAttributeName
                           value:paragraphStyle
                           range:range];
    
    return attributedText.copy;
}

- (instancetype _Nonnull)__setParagraphSpacing:(CGFloat)paragraphSpacing{
    if (!self.string || self.string.length == 0) {
        return [[NSMutableAttributedString alloc] init];
    }
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.paragraphSpacing = paragraphSpacing;
    NSDictionary *attrDict = @{
                               NSParagraphStyleAttributeName: paraStyle
                               };
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:self.string attributes:attrDict];
    
    return attributedText.copy;
}

@end
