

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (__Category)

/**
 修改文本字号
 
 @param fontSize 字号大小
 @return 修改过文本文字样式
 */
- (instancetype _Nonnull)__setFontSize:(CGFloat)fontSize;

/**
 修改文本字号
 
 @param fontSize 字号大小
 @param range 修改文本文字的范围
 @return 修改过文本文字样式
 */
- (instancetype _Nonnull)__setFontSize:(CGFloat)fontSize range:(NSRange)range;

/**
 修改文本文字颜色
 
 @param color 修改文本文字的颜色
 @return 修改过文本文字样式
 */
- (instancetype _Nonnull)__setFontColor:(UIColor *_Nonnull)color;

/**
 修改文本文字颜色
 
 @param color 修改文本文字的颜色
 @param range 修改文本文字的范围
 @return 修改过文本文字样式
 */
- (instancetype _Nonnull)__setFontColor:(UIColor *_Nonnull)color range:(NSRange)range;

/**
 修改文本字间距
 
 @param wordSpacing 字间距
 @return 修改过文本文字样式
 */
- (instancetype _Nonnull)__setWordSpacing:(CGFloat)wordSpacing;

/**
 修改文本字间距
 
 @param wordSpacing 字间距
 @param range 修改文本文字的范围
 @return 修改过文本文字样式
 */
- (instancetype _Nonnull)__setWordSpacing:(CGFloat)wordSpacing range:(NSRange)range;

/**
 修改文本行间距
 
 @param lineSpacing 行间距
 @return 修改过文本文字样式
 */
- (instancetype _Nonnull)__setLineSpacing:(CGFloat)lineSpacing;

/**
 修改文本行间距
 
 @param lineSpacing 行间距
 @param range 修改文本文字的范围
 @return 修改过文本文字样式
 */
- (instancetype _Nonnull)__setLineSpacing:(CGFloat)lineSpacing range:(NSRange)range;

/**
 段落间距，段与段之间需要有 "\n" 才有效果
 
 @param paragraphSpacing 段落间距
 @return 返回的文字样式
 */
- (instancetype _Nonnull)__setParagraphSpacing:(CGFloat)paragraphSpacing;

@end
