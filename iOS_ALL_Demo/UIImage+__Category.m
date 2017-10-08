

#import "UIImage+__Category.h"

@implementation UIImage (__Category)

+ (UIImage *)scaleDown:(UIImage *)image withFactor:(CGFloat)factor {
    CGSize size = CGSizeMake(image.size.width * factor, image.size.height * factor);
    //第一个参数表示区域大小
    //第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES
    //第三个参数就是屏幕密度
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage *)scaleDown:(UIImage *)image withSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage *)screenShotInView:(UIView *)view {
    UIImage *image = nil;
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    [view drawViewHierarchyInRect:view.frame afterScreenUpdates:YES];
    for(UIView *subview in view.subviews) {
        [subview drawViewHierarchyInRect:subview.frame afterScreenUpdates:YES];
    }
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)addWatermarkImage:(UIImage*)watermarkImage size:(CGSize)size {
    return [self addWatermarkImage:watermarkImage size:size offset:UIOffsetMake(0, 0)];
}

- (UIImage *)addWatermarkImage:(UIImage*)watermarkImage size:(CGSize)size offset:(UIOffset)offset {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGRect rect = CGRectMake((self.size.width - size.width) * 0.5 + offset.horizontal, (self.size.height - size.height) * 0.5 + offset.vertical, size.width, size.height);
    [watermarkImage drawInRect:rect];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

@end
