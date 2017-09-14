//
//  NSAttributedString+Extension.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 15/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "NSAttributedString+Extension.h"

@implementation NSAttributedString (Extension)

+ (instancetype)attributedString_ParagraphSpacingWithText:(NSString *_Nonnull)text paragraphSpacing:(CGFloat)paragraphSpacing{
    NSAttributedString *attributedText = [[NSAttributedString alloc] init];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.paragraphSpacing = paragraphSpacing;
    NSDictionary *attrDict = @{
                               NSParagraphStyleAttributeName: paraStyle
                               };
    attributedText = [[NSAttributedString alloc] initWithString:text attributes: attrDict];
    
    return attributedText;
}

+ (instancetype)attributedString_FontColorWithText:(NSString *_Nonnull)text color:(UIColor *_Nonnull)color range:(NSRange)range{
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc]initWithString:text];
    
    [attributedText addAttribute:NSForegroundColorAttributeName
                          value:color
                          range:range];
    
    return attributedText;
}

@end
