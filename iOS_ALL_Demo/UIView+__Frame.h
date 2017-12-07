

#import <UIKit/UIKit.h>

#define MK_FLOAT            CGFloat

@interface UIView (__Frame)

#pragma mark frame
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

#pragma mark new property 
@property (nonatomic, assign) BOOL    masksToBounds;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;

- (UIView *(^)(MK_FLOAT, MK_FLOAT, MK_FLOAT, MK_FLOAT)) com_frame;
- (UIView *(^)(UIColor *)) com_backgroundColor;

+ (UIView *) news;

@end
