

#import "UITextView+__Category.h"

@implementation UITextView (__Category)

- (CGFloat)__contantHeight{
    CGSize size = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)];
    return size.height;
}

@end
