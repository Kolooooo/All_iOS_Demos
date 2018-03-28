

#import "__Reflex.h"

@implementation __Reflex

+ (void)__reflexPerformSelectorWithClassString:(NSString * _Nonnull)classString selString:(NSString * _Nonnull)selString {
    if (!classString) { NSAssert(NO, @"classString is nil"); return; }
    if ([classString isEqualToString:@""]) { NSAssert(NO, @"classString is \"\""); return; }
    if (!selString) { NSAssert(NO, @"selString is nil"); return; }
    if ([selString isEqualToString:@""]) { NSAssert(NO, @"selString is \"\""); return; }

    
    id obj = [[NSClassFromString(classString) alloc] init];
    if (!obj) { NSAssert(NO, @"init obj is nil"); return; }
    
    if ([obj respondsToSelector:NSSelectorFromString(selString)]) {
        [__Reflex __performSelectorWithTarget:obj sel:NSSelectorFromString(selString)];
    } else {
        NSAssert(NO, @"[obj respondsToSelector:NSSelectorFromString(selString)] is NO");
    }
}

+ (void)__performSelectorWithTarget:(id _Nonnull)target sel:(SEL _Nonnull)sel {
    __weak id weakTarget = target;
    if (!weakTarget) { NSAssert(NO, @"target is nil"); return; }
    
    if ([weakTarget respondsToSelector:sel]) {
        IMP imp = [target methodForSelector:sel];
        void (*func)(id, SEL) = (void *)imp;
        func (target, sel);
    } else {
        NSAssert(NO, @"[target respondsToSelector:sel] is NO");
    }
}

@end
