

#import <UIKit/UIKit.h>

@interface UIColor (__Category)

+ (void)__randomColor;

+ (UIColor *_Nullable)__hexRGBAString:(NSString *_Nonnull)hexString alpha:(CGFloat)alpha;

+ (UIColor *_Nullable)hx_colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;

@end


@interface NSString (hx_StringTansformer)

/**
 Checks for a short hexString like #fff and transform it to a long hexstring like #ffffff
 
 @return hexString NSString a normal hexString with the length of 7 characters like #ffffff or the initial string
 */
- (nonnull NSString *)hx_hexStringTransformFromThreeCharacters;

@end
