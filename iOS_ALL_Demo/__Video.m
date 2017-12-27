

#import "__Video.h"
#import <AVFoundation/AVAsset.h>
#import <AVFoundation/AVAssetImageGenerator.h>
#import <AVFoundation/AVTime.h>

@implementation __Video

+ (UIImage *_Nullable)__getVideoThumbnailImageFromVideoURL:(NSURL *_Nullable)videoURL atTime:(NSTimeInterval)time size:(CGSize)size{
    if (videoURL == nil) {
        return nil;
    }
    
    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:videoURL options:opts];
    AVAssetImageGenerator *generator = [AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
    generator.appliesPreferredTrackTransform = YES;
    generator.maximumSize = CGSizeMake(size.width, size.height);
    CFTimeInterval thumbnailImageTime = time;
    NSError *error = nil;
    CGImageRef img = [generator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60) actualTime:NULL error:&error];
    if (error){
        return nil;
    }
    
    UIImage *image = [UIImage imageWithCGImage:img];
    CGImageRelease(img);
    
    return image;
}

+ (NSUInteger)__getVideoDurationFromVideoUrl:(NSURL *_Nullable)videoUrl{
    NSDictionary *opts = [NSDictionary dictionaryWithObject:@(NO) forKey:AVURLAssetPreferPreciseDurationAndTimingKey];      AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:videoUrl options:opts];
    // 初始化视频媒体文件
    NSUInteger second = 0;
    second = urlAsset.duration.value / urlAsset.duration.timescale;
    // 获取视频总时长,单位秒
    return second;
}

+ (NSString *_Nonnull)__getMMSSFromSS:(NSString *_Nonnull)secondTime{
    NSInteger seconds = [secondTime integerValue];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%ld",seconds/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    return format_time;
}

@end
