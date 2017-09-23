
#pragma mark 字体加粗/倾斜
/*
 * label.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
 * Helvetica-Bold还可以换成
 * "Arial-BoldMT",
 * ArialMT,
 * "Arial-ItalicMT",
 * "Arial-BoldItalicMT等等
 * 字体族科后面加-Bold就是加粗 加-Oblique就是倾斜 
 */

#pragma mark 文本自动收缩
/*
 * minimumScaleFactor 设置最小收缩比例，如果Label宽度小于文字长度时，文字进行收缩，收缩超过比例后，停止收缩。
 * minimumFontSize 设置最小收缩字号，如果label宽度小于文字长度时，文字字号减小，低于设定字号以后，不再减小。
 * label.adjustsLetterSpacingToFitWidth = YES; 改变字母之间的间距来适应Label大小
 * label.adjustsFontSizeToFitWidth = YES; 设置字体大小适应label宽度
 */


#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/**
 自适应的高度

 @return 自适应高度数据
 */
- (CGFloat)contantHeight;

/**
 每行文字的高度

 @return 每行文字的高度
 */
- (CGFloat)lineHeight;

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

/**
 根据图片，设置花纹，渐变字体

 @param patternImage 花纹图片、渐变图...
 */
- (void)settitleColorPatternImage:(UIImage *_Nonnull)patternImage;

@end
