

#import <UIKit/UIKit.h>

@interface UIControl (clickRepeatedly)

///（防止反复点击）设置点击的间隔
@property (nonatomic, assign)NSTimeInterval clickInterval;

@property (nonatomic, assign)BOOL ignoreClick;

@end
