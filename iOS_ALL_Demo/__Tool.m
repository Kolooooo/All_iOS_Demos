

#import "__Tool.h"

@implementation __Tool

+ (void)__repeatPerformed:(id)target sel:(SEL)sel repeatCount:(NSInteger)repeatCount repeatFinish:(void(^)())repeatFinish {
    __weak id weakTarget = target;
    static NSInteger count = 0;
    
    if (count < repeatCount) {
        DEBUGLOG(@"repeatCount = %@", @(repeatCount));
        DEBUGLOG(@"count = %@", @(count));
        
        count++;
        if (!weakTarget) { return; }
        if ([weakTarget respondsToSelector:sel]) {
            IMP imp = [target methodForSelector:sel];
            void (*func)(id, SEL) = (void *)imp;
            func (target, sel);
            
            // [target performSelector:sel withObject:withObject];
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
