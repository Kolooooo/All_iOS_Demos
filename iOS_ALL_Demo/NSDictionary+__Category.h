

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (__Category)

- (void)safeSetObject:(id)object forKey:(id <NSCopying> )key;

@end
