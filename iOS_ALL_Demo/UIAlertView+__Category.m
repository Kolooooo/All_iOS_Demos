

#import "UIAlertView+__Category.h"

@implementation UIAlertView (__Category)

- (void)set__string:(NSString *)__string {
    objc_setAssociatedObject(self, @selector(__string), __string, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)__string {
    return objc_getAssociatedObject(self, @selector(__string));
}

- (void)set__object:(id)__object {
    objc_setAssociatedObject(self, @selector(__object), __object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)__object {
    return objc_getAssociatedObject(self, @selector(__object));
}

@end
