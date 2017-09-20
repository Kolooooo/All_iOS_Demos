//
//  UIImage+KKImage.h
//  SeekStar
//
//  Created by Ken_lu on 17/1/7.
//  Copyright © 2017年 模特. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

/**
 等比例缩放图片
 
 @param scale 比例
 @return 缩放以后的图片
 */
- (UIImage *_Nonnull)imageScale:(float)scale;

/**
 缩放到指定大小
 
 @param size 缩放图片的尺寸
 @return 缩放后的图片
 */
- (UIImage *_Nonnull)imageScaledToSize:(CGSize)size;

/**
 保存图片到本地

 @param fileName 图片文件名字png 文件
 @return 是否保存成功
 */
- (BOOL)saveImageToDocmentWithFileName:(NSString *_Nonnull)fileName;

/**
 根据颜色，生成图片

 @param color 颜色
 @return 返回 根据颜色，生成的图片
 */
+ (UIImage *_Nonnull)imageWithColor:(UIColor *_Nonnull)color;

@end

#pragma mark - 记录系统的一些方法
// 将图片保存到手机相册
// image:保存的图片
// self:保存以后的target
// @selector:保存以后的回调
// contextInfo:??
// imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:
// UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
/*
 实现imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:方法
 - (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
 NSString *message = @"";
 if (!error) {
 message = @"成功保存到相册";
 }else{
 message = [error description];
 }
 }
 */
// ---------------------------------------------------------------------------------------
// ---------------------------------------------------------------------------------------
