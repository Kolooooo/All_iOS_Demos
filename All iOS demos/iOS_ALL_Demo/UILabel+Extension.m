//
//  UILabel+Extension.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 02/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

- (CGFloat)autoHeight{
    CGSize size = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)];
    return size.height;
}

- (BOOL)alignLeftTop {
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
    NSDictionary *dic = @{
                          NSKernAttributeName : @(wordSpacing)
                          };
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:self.text attributes:dic];
    [self setAttributedText:attributedString];
}

- (void)lineSpacingWithFloat:(CGFloat)lineSpacing{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
}

@end
