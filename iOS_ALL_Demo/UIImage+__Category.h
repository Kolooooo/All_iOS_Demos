

#import <UIKit/UIKit.h>

@interface UIImage (__Category)

/**
 点九图片拉伸

 @param insets 拉伸的区域
 @return 返回图片
 */
- (instancetype _Nonnull)__resizableImage:(UIEdgeInsets)insets;

/**
 点九图片拉伸

 @param point 拉伸的点坐标，坐标+1 正方形就是拉伸区域
 @return 返回图片
 */
- (instancetype _Nonnull)__resizableImageWithPoint:(CGPoint)point;

/**
 设置圆角

 @param cornerRadius 圆角大小
 @param size 图片要绘制的大小
 @return 设置好的图片
 */
- (UIImage *_Nonnull)__setCornerRadius:(CGFloat)cornerRadius setImageSize:(CGSize)size;

/**
 设置图片抗锯齿（图片旋转的时候会出现锯齿）

 @return 处理后的图片
 */
- (UIImage *_Nonnull)__setAntiAlias;

//按比例压缩图片，不失真
- (UIImage *_Nonnull)__scaleDownImageWithScale:(CGFloat)scale;
- (UIImage *_Nonnull)__scaleDownImageWithSize:(CGSize)size;

/**
 保存图片到本地
 
 @param fileName 图片文件名字png 文件
 @return 是否保存成功
 */
- (BOOL)__saveImageToDocmentWithFileName:(NSString *_Nonnull)fileName;

//获取截图
+ (UIImage *_Nonnull)__screenShotInView:(UIView *_Nonnull)view;

//增加水印图片
- (UIImage *_Nonnull)__addWatermarkImage:(UIImage *_Nonnull)watermarkImage size:(CGSize)size;
- (UIImage *_Nonnull)__addWatermarkImage:(UIImage *_Nonnull)watermarkImage size:(CGSize)size offset:(UIOffset)offset;

@end

#pragma mark 将图片保存到相册
/*
 * ① UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
 *
 * ②
 // image:保存的图片
 // self:保存以后的target
 // @selector:保存以后的回调
 // contextInfo:??
 - (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
 NSString *message = @"";
 if (!error) {
 message = @"成功保存到相册";
 }else{
 message = [error description];
 }
 }
 */
