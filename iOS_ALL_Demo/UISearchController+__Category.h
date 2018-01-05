

@interface UISearchController (__Category)

/**
 根据图片，设置背景颜色

 @param image 设置背景颜色的图片
 */
- (void)setBackgroundColorWithImage:(UIImage *_Nonnull)image;

/**
 设置输入框的提示文字

 @param placeholder 输入框的提示文字
 */
- (void)setPlaceholder:(NSString *_Nonnull)placeholder;

/**
 设置取消按钮文本

 @param cancelButtonText 取消按钮的文本
 */
- (void)setCancelButtonText:(NSString *_Nonnull)cancelButtonText;

/**
 设置放大镜图片

 @param magnifierImage 放大镜的icon
 */
- (void)setMagnifierWithImage:(UIImage *_Nonnull)magnifierImage;

/**
 设置输入框的背景颜色

 @param searchFieldBlackgroundColor 背景颜色
 */
- (void)setSearchFieldBlackgroundColor:(UIColor *_Nonnull)searchFieldBlackgroundColor;

/**
 设置黑线的颜色

 @param color 黑线的颜色
 */
- (void)setBlackLineWithColor:(UIColor *_Nonnull)color;

@end
