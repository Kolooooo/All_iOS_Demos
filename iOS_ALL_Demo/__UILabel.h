

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface __UILabel : UILabel

// 上下左右内边距
@property (assign, nonatomic) UIEdgeInsets edgeInsets;
@property (nonatomic) IBInspectable CGFloat insetTop;
@property (nonatomic) IBInspectable CGFloat insetLeft;
@property (nonatomic) IBInspectable CGFloat insetBottom;
@property (nonatomic) IBInspectable CGFloat insetRight;


@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable UIColor *borderColor;

@end
