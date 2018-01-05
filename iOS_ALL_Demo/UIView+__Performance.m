

#import "UIView+__Performance.h"

@implementation UIView (__Performance)

- (void)__addViewImageWithSubView:(UIView *)subView{
    UIImage *viewImage = [subView __createViewImage];
    self.layer.contents = (id)viewImage.CGImage;
}

- (void)__addViewImageWithSubView:(UIView *)subView size:(CGSize)size{
    UIImage *viewImage = [subView __createViewImage:size];
    self.layer.contents = (id)viewImage.CGImage;
}

- (UIImage *_Nonnull)__createViewImage{
    return [self createViewImage:self.bounds.size];
}

- (UIImage *_Nonnull)__createViewImage:(CGSize)size{
    return [self createViewImage:size];
}

- (UIImage *_Nonnull)createViewImage:(CGSize)imageSize {
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [UIScreen mainScreen].scale);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/*
- (void)__addCorner:(CGFloat)radius{
    [self __addCorner:radius borderWidth:1 backgroundColor:[UIColor clearColor] borderColor:[UIColor blackColor]];
}

- (void)__addCorner:(CGFloat)radius
        borderWidth:(CGFloat)borderWidth
    backgroundColor:(UIColor *)backgroundColor
        borderColor:(UIColor *)borderColor{
    
    UIImageView *imageView = [[UIImageView alloc] init];
     imageView.image = [self __drawRectWithRoundedCorner:radius
                                              borderWidth:borderWidth
                                          backgroundColor:backgroundColor
                                              borderColor:borderColor];
    
    [self insertSubview:imageView atIndex:0];
}

- (UIImage *)__drawRectWithRoundedCorner:(CGFloat)radius
                             borderWidth:(CGFloat)borderWidth
                         backgroundColor:(UIColor *)backgroundColor
                             borderColor:(UIColor *)borderColor
{
    CGSize sizeToFit = CGSizeMake([self pixel:(double)self.bounds.size.width], (double)self.bounds.size.height);
    CGFloat halfBorderWidth = (CGFloat)(borderWidth / 2.0);
    
    UIGraphicsBeginImageContextWithOptions(sizeToFit, false, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    
    CGFloat width = sizeToFit.width;
    CGFloat height = sizeToFit.height;

    CGContextMoveToPoint(context, width - halfBorderWidth, radius + halfBorderWidth);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, width - halfBorderWidth, height - halfBorderWidth, width - radius - halfBorderWidth, height - halfBorderWidth, radius);  // 右下角角度
    CGContextAddArcToPoint(context, halfBorderWidth, height - halfBorderWidth, halfBorderWidth, height - radius - halfBorderWidth, radius); // 左下角角度
    CGContextAddArcToPoint(context, halfBorderWidth, halfBorderWidth, width - halfBorderWidth, halfBorderWidth, radius); // 左上角
    CGContextAddArcToPoint(context, width - halfBorderWidth, halfBorderWidth, width - halfBorderWidth, radius + halfBorderWidth, radius); // 右上角
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return output;
}

- (double)pixel:(double)num{
    double unit;
    switch ((int)[UIScreen mainScreen].scale) {
        case 1:{
            unit = 1.0 / 1.0;
            break;
        }
        case 2:{
            unit = 1.0 / 2.0;
            break;
        }
        case 3:{
            unit = 1.0 / 3.0;
            break;
        }
            
        default:
            unit = 0.0;
            break;
    }
    
    return [self roundbyunit:num unit:&unit];
}

- (double)roundbyunit:(double)num unit:(double *)unit{
    double remain = modf(num, unit);
    
    if (remain > *unit / 2.0) {
        return [self ceilbyunit:num unit:unit];
    }
    else{
        return [self floorbyunit:num unit:unit];
    }
}

- (double)ceilbyunit:(double)num unit:(double *)unit{
    return num - modf(num, unit) + *unit;
}

- (double)floorbyunit:(double)num unit:(double *)unit{
    return num - modf(num, unit);
}
*/
@end
