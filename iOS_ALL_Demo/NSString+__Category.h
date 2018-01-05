

#import <Foundation/Foundation.h>

@interface NSString (__Category)

/**
 根据类名 字符串 创建对象并返回

 @return 创建出来的对象
 */
- (id _Nonnull)__objectFromClassName;

/**
 一些文本在全文中的位置坐标

 @param text 全文
 @param searchText 需要查找的文本
 @return 若干个文本位置坐标 NSString -> NSInteger
 */
+ (NSArray<NSString *> *_Nonnull)__array_SomeTextLocationWith:(NSString *_Nonnull)text searchText:(NSString *_Nonnull)searchText;

/**
 根据字体、行数、行间距和constrainedWidth计算文本占据的size
 
 @param font 字体
 @param numberOfLines 显示文本行数，值为0不限制行数
 @param lineSpacing 行间距
 @param constrainedWidth 文本受限的宽度
 @param isLimitedToLines 记录文本是否被numberOfLines限制
 @return 返回文本占据的size
 */
- (CGSize)__textSizeWithFont:(UIFont *_Nonnull)font
             numberOfLines:(NSInteger)numberOfLines
               lineSpacing:(CGFloat)lineSpacing
          constrainedWidth:(CGFloat)constrainedWidth
          isLimitedToLines:(BOOL *_Nullable)isLimitedToLines;

#pragma mark - 格式字符串验证
/// 验证是否是正确的手机号码格式
- (BOOL)__isValidateMobile;

@end
