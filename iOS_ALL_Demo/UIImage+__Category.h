

#import <UIKit/UIKit.h>

@interface UIImage (__Category)

//按比例压缩图片，不失真
+ (UIImage *)scaleDown:(UIImage *)image withFactor:(CGFloat)factor;
+ (UIImage *)scaleDown:(UIImage *)image withSize:(CGSize)size;

//获取截图
+ (UIImage *)screenShotInView:(UIView *)view;

//增加水印图片
- (UIImage *)addWatermarkImage:(UIImage*)watermarkImage size:(CGSize)size;
- (UIImage *)addWatermarkImage:(UIImage*)watermarkImage size:(CGSize)size offset:(UIOffset)offset;

@end
