//
//  NSString+Extension.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 08/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (id _Nonnull)objectFromClassName{
    Class objectClass = NSClassFromString(self);
    return [[objectClass alloc] init];
}

+ (NSArray<NSString *> *_Nonnull)array_SomeTextLocationWith:(NSString *_Nonnull)text searchText:(NSString *_Nonnull)searchText{
    NSString *replaceSign = @"+";
    
    NSString *replacedText = [text stringByReplacingOccurrencesOfString:searchText withString:replaceSign];
    
    NSMutableArray *indexMarray = [NSMutableArray array];
    for (int i = 0; i < replacedText.length; i++) {
        NSString *oneText = [replacedText substringWithRange:NSMakeRange(i, 1)];
        if([oneText isEqualToString:replaceSign]){
            [indexMarray addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    
    return indexMarray.copy;
}

#pragma mark - 格式字符串验证
- (BOOL)isValidateMobile {
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0-9])|(14[0-9]))\\d{8}$";
    NSPredicate *phoneNumber = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    BOOL isPhone = [phoneNumber evaluateWithObject:self];
    if (!isPhone) {
        DEBUGLOG(@"%@Your mobile is wrong!!!", WRONG_TIP);
    }
    
    return isPhone;
}

#pragma mark - 根据字符串，计算文本高度
- (CGSize)textSizeWithFont:(UIFont *_Nonnull)font
             numberOfLines:(NSInteger)numberOfLines
               lineSpacing:(CGFloat)lineSpacing
          constrainedWidth:(CGFloat)constrainedWidth
          isLimitedToLines:(BOOL *_Nullable)isLimitedToLines{

    if (self.length == 0) {
        return CGSizeZero;
    }
    
    // one line height
    CGFloat oneLineHeight = font.lineHeight;
    
    // text size, but that has not lineSpacing.
    CGSize textSize = [self boundingRectWithSize:CGSizeMake(constrainedWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    // rows
    CGFloat rows = textSize.height / oneLineHeight;
    
    
    CGFloat realHeight = oneLineHeight;
    if (numberOfLines == 0) { // 0 不限制行数
        if (rows >= 1) {
            realHeight = (rows * oneLineHeight) + (rows - 1) * lineSpacing;
        }
    }
    else{ // 限制行数
        if (rows > numberOfLines) {
            rows = numberOfLines;
            if (isLimitedToLines) {
                *isLimitedToLines = YES;  //被限制
            }
        }
        realHeight = (rows * oneLineHeight) + (rows - 1) * lineSpacing;
    }
    
    return CGSizeMake(constrainedWidth, realHeight);
}


// ken.todo:email and password, you need to full that
//- (BOOL)isValidateEmail {
//    NSString *phoneRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
//    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
//    return [phoneTest evaluateWithObject:self];
//}
//
//- (BOOL)isValiDatePassword:(NSString *)password {
//    NSString *phoneRegex = @"[A-Z0-9a-z]";
//    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
//    return [phoneTest evaluateWithObject:self];
//}

@end
