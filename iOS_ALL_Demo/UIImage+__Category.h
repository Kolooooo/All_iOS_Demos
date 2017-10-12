

#import <UIKit/UIKit.h>

@interface UIImage (__Category)

//按比例压缩图片，不失真
+ (UIImage *_Nonnull)__scaleDownImage:(UIImage *_Nonnull)image scale:(CGFloat)scale;
+ (UIImage *_Nonnull)__scaleDownImage:(UIImage *_Nonnull)image size:(CGSize)size;

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