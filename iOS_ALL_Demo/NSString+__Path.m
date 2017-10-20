

#import "NSString+__Path.h"

@implementation NSString (__Path)

+ (NSString *_Nonnull)documentPath {
    NSString *root = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    
    return [root stringByAppendingPathComponent:[[[NSString alloc] init] lastPathComponent]];
}

+ (NSString *_Nonnull)cachePath {
    NSString *root = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    
    return [root stringByAppendingPathComponent:[[[NSString alloc] init] lastPathComponent]];
}

+ (NSString *_Nonnull)tempPath {
    NSString *root = NSTemporaryDirectory();
    
    return [root stringByAppendingPathComponent:[[[NSString alloc] init] lastPathComponent]];
}

@end
