//
//  NSAttributedString+Extension.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 15/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "NSAttributedString+Extension.h"

@implementation NSAttributedString (Extension)

+ (instancetype _Nonnull)attributedString_ParagraphSpacingWithText:(NSString *_Nonnull)text paragraphSpacing:(CGFloat)paragraphSpacing{
    NSAttributedString *attributedText = [[NSAttributedString alloc] init];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.paragraphSpacing = paragraphSpacing;
    NSDictionary *attrDict = @{
                               NSParagraphStyleAttributeName: paraStyle
                               };
    attributedText = [[NSAttributedString alloc] initWithString:text attributes: attrDict];
    
    return attributedText;
}

+ (instancetype _Nonnull)attributedString_FontColorWithText:(NSString *_Nonnull)text color:(UIColor *_Nonnull)color range:(NSRange)range{
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc]initWithString:text];
    
    [attributedText addAttribute:NSForegroundColorAttributeName
                          value:color
                          range:range];
    
    return attributedText;
}

+ (instancetype _Nullable)attributedString_WordSpacingWithText:(NSString *_Nonnull)text wordSpacing:(CGFloat)wordSpacing range:(NSRange)range{
    
    if (text.length == 0) {
        return nil;
    }
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc]initWithString:text];
    
    [attributedText addAttribute:NSKernAttributeName
                           value:@(wordSpacing)
                           range:range];
    
    
    return attributedText;
}

+ (instancetype _Nullable)attributedString_LineSpacingWithText:(NSString *_Nonnull)text lineSpacing:(CGFloat)lineSpacing range:(NSRange)range{
    
    if (text.length == 0) {
        return nil;
    }
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    [attributedText addAttribute:NSParagraphStyleAttributeName
                           value:paragraphStyle
                           range:range];
    
    return attributedText;
}

@end
