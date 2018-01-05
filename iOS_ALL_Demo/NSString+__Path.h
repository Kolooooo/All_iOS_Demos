

#import <Foundation/Foundation.h>

@interface NSString (__Path)

///document路径
+ (NSString *_Nonnull)documentPath;

///沙盒路径
+ (NSString *_Nonnull)cachePath;

///temp路径
+ (NSString *_Nonnull)tempPath;

@end
