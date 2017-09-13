

/**
 *  Frame的工具类
 */

#import "UIView+Frame.h"

@implementation UIView (Frame)

///x坐标
- (void)setX:(CGFloat)x{
    CGRect temp = self.frame;
    temp.origin.x = x;
    self.frame = temp;
}
- (CGFloat)x{
    return self.frame.origin.x;
}

///y坐标
- (void)setY:(CGFloat)y{
    CGRect temp = self.frame;
    temp.origin.y = y;
    self.frame = temp;
}
- (CGFloat)y{
    return self.frame.origin.y;
}

///width尺寸
- (void)setWidth:(CGFloat)width{
    CGRect temp = self.frame;
    temp.size.width = width;
    self.frame = temp;
}
- (CGFloat)width{
    return self.frame.size.width;
}

///height尺寸
- (void)setHeight:(CGFloat)height{
    CGRect temp = self.frame;
    temp.size.height = height;
    self.frame = temp;
}
- (CGFloat)height{
    return self.frame.size.height;
}


@end
