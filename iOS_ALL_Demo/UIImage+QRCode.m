

#import "UIImage+QRCode.h"

@implementation UIImage (QRCode)

+ (UIImage *)createQrCodeWithString:(NSString *)string imageSize:(CGSize)imageSize {
    NSData *stringData = [string dataUsingEncoding:NSUTF8StringEncoding];
    // 创建filter
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 设置内容和纠错级别
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"H" forKey:@"inputCorrectionLevel"];
    CIImage *qrCodeCIImage = qrFilter.outputImage;
    
    CGRect extent = CGRectIntegral(qrCodeCIImage.extent);
    CGFloat scale = MIN(imageSize.width/CGRectGetWidth(extent), imageSize.height/CGRectGetHeight(extent));
    // 创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CGColorSpaceRelease(cs);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:qrCodeCIImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    UIImage *qrCodeImage = [UIImage imageWithCGImage:scaledImage];
    CGImageRelease(scaledImage);
    return qrCodeImage;
}

+ (UIImage *)createQrCodeWithString:(NSString *)string
                          imageSize:(CGSize)imageSize
                          logoImage:(UIImage *)logoImage
                           logoSize:(CGSize)logoSize
                   logoCornerRadius:(CGFloat)cornerRadius {
    UIImage *qrCodeImage = [UIImage createQrCodeWithString:string imageSize:imageSize];
    UIImage *backgroundImage = [UIImage pureColorImageWithSize:logoSize color:[UIColor whiteColor] cornerRadius:cornerRadius];
    UIImage *newLogoImage = [backgroundImage __addWatermarkImage:logoImage size:CGSizeMake(logoSize.width - 5, logoSize.height - 5)];
    UIImage *resultImage = [qrCodeImage __addWatermarkImage:newLogoImage size:logoSize];
    return resultImage;
}

+ (UIImage *)addLogoWithCurrentImage:(UIImage *)currentImage
                           logoImage:(UIImage *)logoImage
                            logoSize:(CGSize)logoSize
                    logoCornerRadius:(CGFloat)cornerRadius {
    UIImage *backgroundImage = [UIImage pureColorImageWithSize:logoSize color:[UIColor whiteColor] cornerRadius:cornerRadius];
    UIImage *newLogoImage = [backgroundImage __addWatermarkImage:logoImage size:CGSizeMake(logoSize.width - 5, logoSize.height - 5)];
    UIImage *resultImage = [currentImage __addWatermarkImage:newLogoImage size:logoSize];
    return resultImage;
}

#pragma mark - Pirvate method

+ (UIImage *)pureColorImageWithSize:(CGSize)size color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius {
    CGSize imageSize = size;
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, imageSize.width, imageSize.height) cornerRadius:cornerRadius] addClip];
    [color set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pureColorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return pureColorImage;
}

@end
