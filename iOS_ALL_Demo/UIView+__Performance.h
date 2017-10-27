

#import <UIKit/UIKit.h>

@interface UIView (__Performance)

/**
 添加一个视图图片
 CALayer 的 border、圆角、阴影、遮罩（mask），CASharpLayer 的矢量图形显示，通常会触发离屏渲染（offscreen rendering）
 最彻底的解决办法，就是把需要显示的图形在后台线程绘制为图片，避免使用圆角、阴影、遮罩等属性
 
 @param subView 视图
 */
- (void)__addViewImageWithSubView:(UIView *_Nonnull)subView;
- (void)__addViewImageWithSubView:(UIView *_Nonnull)subView size:(CGSize)size;

/**
 将视图合成成为一张图片，
 CALayer 的 border、圆角、阴影、遮罩（mask），CASharpLayer 的矢量图形显示，通常会触发离屏渲染（offscreen rendering）
 最彻底的解决办法，就是把需要显示的图形在后台线程绘制为图片，避免使用圆角、阴影、遮罩等属性

 @return 合成出来的图片
 */
- (UIImage *_Nonnull)__createViewImage;
- (UIImage *_Nonnull)__createViewImage:(CGSize)size;

@end
