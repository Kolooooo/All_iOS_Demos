//
//  UILabel+Extension.h
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 02/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/**
 自适应的高度

 @return 自适应高度数据
 */
- (CGFloat)autoHeight;

/**
 UILabel 文字左上角对齐

 @return 文字是否折叠，YES：折叠，NO：没有折叠
 */
- (BOOL)alignLeftTop;

/**
 设置字体间距

 @param wordSpacing 间距大小
 */
- (void)wordSpacingWithFloat:(CGFloat)wordSpacing;

/**
 设置字体行间距
 
 @param lineSpacing 行间距大小
 */
- (void)lineSpacingWithFloat:(CGFloat)lineSpacing;

@end
