

#import <UIKit/UIKit.h>

@interface UIImage (QRCode)

//生成二维码
+ (UIImage *)createQrCodeWithString:(NSString *)string imageSize:(CGSize)imageSize;

//生成带logo的二维码
+ (UIImage *)createQrCodeWithString:(NSString *)string
                          imageSize:(CGSize)imageSize
                          logoImage:(UIImage *)logoImage
                           logoSize:(CGSize)logoSize
                   logoCornerRadius:(CGFloat)cornerRadius;

//增加logo
+ (UIImage *)addLogoWithCurrentImage:(UIImage *)currentImage
                           logoImage:(UIImage *)logoImage
                             logoSize:(CGSize)logoSize
                    logoCornerRadius:(CGFloat)cornerRadius ;

@end
