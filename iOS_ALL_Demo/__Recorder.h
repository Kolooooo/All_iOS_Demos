

#import <Foundation/Foundation.h>

@interface __Recorder : NSObject

- (instancetype _Nonnull)initWith:(NSURL *)recordFileUrl NS_DESIGNATED_INITIALIZER;

- (void)__startRecord;
- (void)__stopRecord;
- (void)__playRecordWithURL:(NSURL *_Nonnull)recordURL;

/**
 网络加载或本地加载语音文件

 @param voicePath 语音文件路径
 @param saveFilePath 保存的路径
 @return 是否保存成功
 */
//设置保存路径和生成文件名
- (BOOL)__loadVoiceWithPath:(NSString *_Nonnull)voicePath saveFilePath:(NSString *_Nonnull)saveFilePath;
    
@end

