

#import <UIKit/UIKit.h>

@interface __UIButton : UIButton

@property (nonatomic) IBInspectable BOOL masksToBounds;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGSize  shadowOffset;
@property (nonatomic) IBInspectable CGFloat shadowOpacity;
@property (nonatomic) IBInspectable CGFloat shadowRadius;
@property (nonatomic) IBInspectable UIColor *shadowColor;

@property (nonatomic) IBInspectable UIColor *normalBackgroundColor;
@property (nonatomic) IBInspectable UIColor *selectedBackgroundColor;


/// 显示菊花
- (void)showIndicator;
/// 隐藏菊花
- (void)hideIndicator;

@end
