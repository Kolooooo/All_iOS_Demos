

#import <UIKit/UIKit.h>

@interface UIImage (__Color)

+ (UIImage *_Nonnull)__imageWithColor:(UIColor *_Nonnull)color;
- (UIColor *_Nonnull)__colorAtPixel:(CGPoint)point;
//返回该图片是否有透明度通道
- (BOOL)__hasAlphaChannel;

@end
