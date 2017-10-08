

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (__Category)

/**
 段落间距，段与段之间需要有 "\n" 才有效果
 
 @param text 文本文字
 @param paragraphSpacing 段落间距
 @return 返回的文字样式
 */
+ (instancetype _Nonnull)attributedString_ParagraphSpacingWithText:(NSString *_Nonnull)text
                                                  paragraphSpacing:(CGFloat)paragraphSpacing;

/**
 修改文本文字颜色
 
 @param text 文本
 @param color 修改文本文字的颜色
 @param range 修改文本文字的范围
 @return 修改过文本文字样式
 */
+ (instancetype _Nonnull)attributedString_FontColorWithText:(NSString *_Nonnull)text
                                                      color:(UIColor *_Nonnull)color
                                                      range:(NSRange)range;

/**
 修改文本字间距

 @param text 文本
 @param wordSpacing 字间距
 @param range 修改文本文字的范围
 @return 修改过文本文字样式
 */
+ (instancetype _Nullable)attributedString_WordSpacingWithText:(NSString *_Nonnull)text
                                                   wordSpacing:(CGFloat)wordSpacing
                                                         range:(NSRange)range;

/**
 修改文本行间距

 @param text 文本
 @param lineSpacing 行间距
 @param range 修改文本文字的范围
 @return 修改过文本文字样式
 */
+ (instancetype _Nullable)attributedString_LineSpacingWithText:(NSString *_Nonnull)text
                                                   lineSpacing:(CGFloat)lineSpacing
                                                         range:(NSRange)range;

@end
