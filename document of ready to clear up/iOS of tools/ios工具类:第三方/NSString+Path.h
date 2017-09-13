


/**
 *  沙盒路径
 **/

#import <Foundation/Foundation.h>

@interface NSString (Path)
- (NSString *)appendDocument;
- (NSString *)appendCache;
- (NSString *)appendTmp;

@end
