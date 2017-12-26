

#import "UIImage+__Category.h"

typedef NS_ENUM(NSUInteger, ScaleDownImageType) {
    ScaleDownImageTypeSize,
    ScaleDownImageTypeScale
};

@implementation UIImage (__Category)

- (instancetype _Nonnull)__resizableImage:(UIEdgeInsets)insets{
    // 指定为拉伸模式，伸缩后重新赋值
    UIImage *image = [self resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    return image;
}

- (UIImage *_Nonnull)__setCornerRadius:(CGFloat)cornerRadius setImageSize:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    
    [self drawInRect:rect];
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *_Nonnull)__setAntiAlias{
    CGFloat border = 1.0f;
    CGRect rect = CGRectMake(border, border, self.size.width-2*border, self.size.height-2*border);
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(rect.size.width,rect.size.height));
    [self drawInRect:CGRectMake(-1, -1, self.size.width, self.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.size);
    [img drawInRect:rect];
    UIImage* antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
}

- (UIImage *)__scaleDownImageWithScale:(CGFloat)scale{
    CGSize size = CGSizeMake(self.size.width * scale, self.size.height * scale);
    UIImage *scaledImage = [self scaleDownImageWithSize:size];
    return scaledImage;
}

- (UIImage *)__scaleDownImageWithSize:(CGSize)size{
    UIImage *scaledImage = [self scaleDownImageWithSize:size];
    return scaledImage;
}

- (UIImage *)scaleDownImageWithSize:(CGSize)size{
    //第一个参数表示区域大小
    //第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES
    //第三个参数就是屏幕密度
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

- (BOOL)__saveImageToDocmentWithFileName:(NSString*)fileName{
    NSString *fileName1 = @"";
    if (![fileName containsString:@".png"]) {
        fileName1 = [NSString stringWithFormat:@"%@.png", fileName];
    }else{
        fileName1 = fileName;
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:fileName1];
    BOOL result = [UIImagePNGRepresentation(self) writeToFile: filePath atomically:YES];
    
    if (result){
        return YES;
    }else{
        NSAssert(NO, @"图片保存失败");
        return NO;
    }
}

+ (UIImage *)__screenShotInView:(UIView *)view {
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

- (UIImage *)__addWatermarkImage:(UIImage*)watermarkImage size:(CGSize)size {
    return [self __addWatermarkImage:watermarkImage size:size offset:UIOffsetMake(0, 0)];
}

- (UIImage *)__addWatermarkImage:(UIImage*)watermarkImage size:(CGSize)size offset:(UIOffset)offset {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGRect rect = CGRectMake((self.size.width - size.width) * 0.5 + offset.horizontal, (self.size.height - size.height) * 0.5 + offset.vertical, size.width, size.height);
    [watermarkImage drawInRect:rect];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

@end
