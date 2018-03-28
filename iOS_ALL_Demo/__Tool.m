

#import "__Tool.h"

@implementation __Tool

+ (void)__repeatPerformed:(id)target sel:(SEL)sel repeatCount:(NSInteger)repeatCount repeatFinish:(void(^)(void))repeatFinish {
    static NSInteger count = 0;
    
    if (count < repeatCount) {
        DEBUGLOG(@"repeatCount = %@", @(repeatCount));
        DEBUGLOG(@"count = %@", @(count));
        
        count++;
        __weak id weakTarget = target;
        if (!weakTarget) {
            NSAssert(NO, @"target is nil");
            return;
        }
        
        if ([weakTarget respondsToSelector:sel]) {
            IMP imp = [target methodForSelector:sel];
            void (*func)(id, SEL) = (void *)imp;
            func (target, sel);
        } else {
            NSAssert(NO, @"[target respondsToSelector:sel] is NO");
        }
    } else {
        count = 0;
        DEBUGLOG(@"%@次重复执行结束", @(repeatCount));
        if (repeatFinish) {
            repeatFinish();
        }
    }
}

@end
