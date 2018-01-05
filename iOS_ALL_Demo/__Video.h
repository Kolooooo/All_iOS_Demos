

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface __Video : NSObject

/**
 根据URL地址 获取视频某帧的图片

 @param videoURL 视频URL地址
 @param time 视频什么时间
 @param size 返回图片的大小
 @return 返回的截图图片
 */
+ (UIImage *_Nullable)__getVideoThumbnailImageFromVideoURL:(NSURL *_Nullable)videoURL atTime:(NSTimeInterval)time size:(CGSize)size;

/**
 根据URL地址 获取视频的时长

 @param videoUrl 视频URL地址
 @return 多少秒
 */
+ (NSUInteger)__getVideoDurationFromVideoUrl:(NSURL *_Nullable)videoUrl;

/**
 将秒转变成分秒 - 00:00

 @param secondTime 秒数
 @return 秒转变成分秒 - 00:00
 */
+ (NSString *_Nonnull)__getMMSSFromSS:(NSString *_Nonnull)secondTime;

@end
