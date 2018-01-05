

#import "NSDictionary+__Category.h"

@implementation NSMutableDictionary (__Category)

- (void)safeSetObject:(id)object forKey:(id <NSCopying> )key {
    if (object) {
        [self setObject:object forKey:key];
    }
}

@end
