

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface __UITextField : UITextField

@property (nonatomic) IBInspectable BOOL masksToBounds;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat topInset;
@property (nonatomic) IBInspectable CGFloat leftInset;
@property (nonatomic) IBInspectable CGFloat bottomInset;
@property (nonatomic) IBInspectable CGFloat rightInset;
@property (nonatomic) IBInspectable UIColor *placeholderColor;
@property (nonatomic) UIFont  *placehoderFont;

@end
