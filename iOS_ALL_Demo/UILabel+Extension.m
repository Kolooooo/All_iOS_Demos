//
//  UILabel+Extension.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 02/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "UILabel+Extension.h"
#import <objc/runtime.h>
#import "KUILabel.h"

@implementation UILabel (Extension)

- (CGFloat)contantHeight{
    CGSize size = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)];
    return size.height;
}

- (CGFloat)lineHeight{
    CGFloat lineHeight = self.font.lineHeight;
    return lineHeight;
}

- (BOOL)alignLeftTop{
    CGFloat selfX = self.frame.origin.x;
    CGFloat selfY = self.frame.origin.y;
    CGFloat selfWidth = self.frame.size.width;
    CGFloat selfHeight = self.frame.size.height;
    
    self.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize size = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)];
    
    if (size.height > selfHeight) {
        size.height = selfHeight;
        self.frame = CGRectMake(selfX, selfY, selfWidth, size.height);
        
        return YES;
    }else{
        size.height = size.height;
        self.frame = CGRectMake(selfX, selfY, selfWidth, size.height);
        
        return NO;
    }
}

- (void)wordSpacingWithFloat:(CGFloat)wordSpacing{
    
    NSRange range = NSMakeRange(0, self.text.length);
    NSAttributedString *attributedString = [NSAttributedString attributedString_WordSpacingWithText:self.text wordSpacing:wordSpacing range:range];
    
    self.attributedText = attributedString;
}

- (void)lineSpacingWithFloat:(CGFloat)lineSpacing{
    
    NSRange range = NSMakeRange(0, self.text.length);
    NSAttributedString *attributedString = [NSAttributedString attributedString_LineSpacingWithText:self.text lineSpacing:lineSpacing range:range];
    
    self.attributedText = attributedString;
}

// -------

/**
 行间距
 */
- (void)setQsLineSpacing:(CGFloat)qsLineSpacing{
    
    objc_setAssociatedObject(self, @selector(qsLineSpacing), [NSNumber numberWithFloat:qsLineSpacing], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)qsLineSpacing{
    
    return [objc_getAssociatedObject(self, @selector(qsLineSpacing)) floatValue];
}

/**
 最大显示宽度
 */
- (void)setQsConstrainedWidth:(CGFloat)qsConstrainedWidth{
    
    objc_setAssociatedObject(self, @selector(qsConstrainedWidth), [NSNumber numberWithFloat:qsConstrainedWidth], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)qsConstrainedWidth{
    
    return [objc_getAssociatedObject(self, @selector(qsConstrainedWidth)) floatValue];
}

/**
 文本适应于指定的行数
 @return 文本是否被numberOfLines限制
 */
- (BOOL)qs_adjustTextToFitLines:(NSInteger)numberOfLines{
    
    if (!self.text || self.text.length == 0) {
        return NO;
    }
    
    self.numberOfLines = numberOfLines;
    BOOL isLimitedToLines = NO;
    
    CGSize textSize = [self.text textSizeWithFont:self.font numberOfLines:self.numberOfLines lineSpacing:self.qsLineSpacing constrainedWidth:self.qsConstrainedWidth isLimitedToLines:&isLimitedToLines];
    
    //单行的情况
    if (fabs(textSize.height - self.font.lineHeight) < 0.00001f) {
        self.qsLineSpacing = 0.0f;
    }
    
    //设置文字的属性
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:self.qsLineSpacing];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;//结尾部分的内容以……方式省略
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    [attributedString addAttribute:NSForegroundColorAttributeName value:self.textColor range:NSMakeRange(0, [self.text length])];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [self.text length])];
    
    
    [self setAttributedText:attributedString];
    self.bounds = CGRectMake(0, 0, textSize.width, textSize.height);
    return isLimitedToLines;
}


//- (BOOL)qs_adjustTextToFitLines:(NSInteger)numberOfLines lineSpacing:(CGFloat)lineSpacing width:(CGFloat)constraineWidth textframe:(CGRect *)textframe{
//    
//    if (!self.text || self.text.length == 0) {
//        return NO;
//    }
//    
//    self.numberOfLines = numberOfLines;
//    BOOL isLimitedToLines = NO;
//    
//    CGSize textSize = [self.text textSizeWithFont:self.font numberOfLines:numberOfLines lineSpacing:lineSpacing constrainedWidth:constraineWidth isLimitedToLines:&isLimitedToLines];
//    
//    // 单行的情况
//    if (fabs(textSize.height - self.font.lineHeight) < 0.00001f) {
//        lineSpacing = 0.0f;
//    }
//    
//    // 设置文字的属性
//    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
//    
//    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    [paragraphStyle setLineSpacing:lineSpacing];
//    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;//结尾部分的内容以……方式省略
//    
//    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.text.length)];
//    [attributedString addAttribute:NSForegroundColorAttributeName value:self.textColor range:NSMakeRange(0, self.text.length)];
//    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, self.text.length)];
//    [self setAttributedText:attributedString];
//    
//    
//    self.frame = CGRectMake(0, 0, textSize.width, textSize.height);
//    if (textframe) {
//        *textframe = self.frame;
//    }
//    
//    return isLimitedToLines;
//}

@end