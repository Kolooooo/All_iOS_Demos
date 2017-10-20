

#import "__StarButton.h"

@implementation __StarButton

- (instancetype)initWithSize:(CGSize)size{
    if (self = [super initWithFrame:CGRectMake(0, 0, size.width, size.height)]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (CGFloat)fractionPartOfPoint:(CGPoint)point{
    CGFloat fractionPart =  (point.x - self.frame.origin.x) / self.frame.size.width;
    return round(fractionPart * 10) / 10;
}


#pragma mark - helper
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize{
    UIGraphicsBeginImageContext(reSize);
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}


+ (UIImage *)croppedImage:(UIImage *)image fraction:(CGFloat)fractonPart{
    CGFloat width = image.size.width * fractonPart * image.scale;
    CGRect newFrame = CGRectMake(0, 0, width , image.size.height * image.scale);
    CGImageRef resultImage = CGImageCreateWithImageInRect(image.CGImage, newFrame);
    UIImage *result = [UIImage imageWithCGImage:resultImage scale:image.scale orientation:image.imageOrientation];
    CGImageRelease(resultImage);
    return result;
}

#pragma mark - setter&getter
- (void)setNormalImage:(UIImage *)normalImage{
    _normalImage = [__StarButton reSizeImage:normalImage toSize:self.frame.size];
    [self setImage:_normalImage forState:UIControlStateNormal];
}

- (void)setHighlightedImage:(UIImage *)highlightedImage{
    _highlightedImage = [__StarButton reSizeImage:highlightedImage toSize:self.frame.size];
    [self setImage:_highlightedImage forState:UIControlStateSelected];
}

- (void)setFractionPart:(CGFloat)fractionPart{
    if (fractionPart == 0) {
        return;
    }
    UIImage *image = [__StarButton croppedImage:self.highlightedImage fraction:fractionPart];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    [self setImage:image forState:UIControlStateHighlighted];
    [self setBackgroundImage:self.normalImage forState:UIControlStateHighlighted];
    self.selected = NO;
    self.highlighted = YES;
}

@end
