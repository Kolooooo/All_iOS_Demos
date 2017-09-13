//
//  UIImage+KKImage.h
//  SeekStar
//
//  Created by Ken_lu on 17/1/7.
//  Copyright © 2017年 模特. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KKImage)

/**
 等比例缩放图片
 
 @param scale 比例
 @return 缩放以后的图片
 */
- (UIImage*)KK_imageScale:(float)scale;

/**
 缩放到指定大小
 
 @param size 缩放图片的尺寸
 @return 缩放后的图片
 */
- (UIImage *)KK_imageScaledToSize:(CGSize)size;

/**
 保存图片到本地

 @param fileName 图片文件名字png 文件
 @return 是否保存成功
 */
- (BOOL)KK_saveImageToDocmentWithFileName:(NSString*)fileName;

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
