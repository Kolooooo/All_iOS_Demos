//
//  UIImage+Compress.m
//  ShareJobStudent
//
//  Created by Sunnyyoung on 15/11/9.
//  Copyright © 2015年 GeekBean Technology Co., Ltd. All rights reserved.
//

#import "UIImage+Compress.h"

static const CGFloat kImageCompressRatioDefault = 0.9;   //图片默认压缩比率
static const CGFloat kImageCompressRatioMax = 0.1;       //图片最大压缩比率

@implementation UIImage (Compress)

+ (UIImage *)compressImage:(UIImage *)image {
    return [[self class] compressImage:image compressRatio:kImageCompressRatioDefault];
}

+ (UIImage *)compressImage:(UIImage *)image compressRatio:(CGFloat)ratio {
    return [[self class] compressImage:image compressRatio:ratio maxCompressRatio:kImageCompressRatioMax];
}

+ (UIImage *)compressImage:(UIImage *)image compressRatio:(CGFloat)ratio maxCompressRatio:(CGFloat)maxRatio {
    //We define the max and min resolutions to shrink to
    int MIN_UPLOAD_RESOLUTION = 1136 * 640;
    int MAX_UPLOAD_SIZE = 50;

    float factor;
    float currentResolution = image.size.height * image.size.width;

    //We first shrink the image a little bit in order to compress it a little bit more
    if (currentResolution > MIN_UPLOAD_RESOLUTION) {
        factor = sqrt(currentResolution / MIN_UPLOAD_RESOLUTION) * 2;
        image = [self scaleDown:image withSize:CGSizeMake(image.size.width / factor, image.size.height / factor)];
    }

    //Compression settings
    CGFloat compression = ratio;
    CGFloat maxCompression = maxRatio;

    //We loop into the image data to compress accordingly to the compression ratio
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > MAX_UPLOAD_SIZE && compression > maxCompression) {
        compression -= 0.10;
        imageData = UIImageJPEGRepresentation(image, compression);
    }

    //Retuns the compressed image
    return [[UIImage alloc] initWithData:imageData];
}

+ (UIImage *)scaleDown:(UIImage *)image withSize:(CGSize)newSize {
    //We prepare a bitmap with the new size
    UIGraphicsBeginImageContextWithOptions(newSize, YES, 0.0);
    //Draws a rect for the image
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    //We set the scaled image from the context
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
