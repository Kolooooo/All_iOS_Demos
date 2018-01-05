


/**
 *  沙盒路径
 **/

#import "NSString+Path.h"

@implementation NSString (Path)
///document路径
- (NSString *)appendDocument {
    NSString *root = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    
    return [root stringByAppendingPathComponent:[self lastPathComponent]];
}

///沙盒路径
- (NSString *)appendCache {
    NSString *root = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    
    return [root stringByAppendingPathComponent:[self lastPathComponent]];
}

///temp路径
- (NSString *)appendTmp {
    NSString *root = NSTemporaryDirectory();
    
    return [root stringByAppendingPathComponent:[self lastPathComponent]];
}
@end
