

#import "__Recorder.h"
#import <AVFoundation/AVFoundation.h>

@interface __Recorder()

/// 录音器
@property (nonatomic, strong) AVAudioRecorder *recorder;
@property (nonatomic, strong) AVAudioSession *session;
/// 播放器
@property (nonatomic, strong) AVAudioPlayer *player;
/// 文件地址
@property (nonatomic, strong) NSURL *recordFileUrl;

@end

@implementation __Recorder


- (instancetype _Nonnull)initWith:(NSURL *)recordFileUrl{
    self = [super init];
    if (self) {
        _recordFileUrl = recordFileUrl;
        
        NSDictionary *recordSetting = [self recordSetting];//设置参数
        self.recorder = [[AVAudioRecorder alloc] initWithURL:recordFileUrl settings:recordSetting error:nil];
        
        self.session = [self session];
    }
    return self;
}

- (void)__startRecord{
    if (self.recorder) {
        self.recorder.meteringEnabled = YES;
        [self.recorder prepareToRecord];
        [self.recorder record];
    }else{
        NSAssert(NO, @"音频格式和文件存储格式不匹配, 无法初始化Recorder");
    }
}

- (void)__stopRecord{
    NSLog(@"停止录音");
    
    if ([self.recorder isRecording]) {
        [self.recorder stop];
    }
}

- (void)__playRecordWithURL:(NSURL *_Nonnull)recordURL{
    NSLog(@"播放录音");
    
    [self.recorder stop];
    if ([self.player isPlaying]){
        return;
    }
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:recordURL error:nil];
    [self.session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [self.player play];
}

/// 录音参数设置
- (NSDictionary *)recordSetting{
    NSDictionary *recordSetting = [[NSDictionary alloc] initWithObjectsAndKeys:
                                   //采样率  8000/11025/22050/44100/96000（影响音频的质量）
                                   [NSNumber numberWithFloat: 8000.0],AVSampleRateKey,
                                   // 音频格式
                                   [NSNumber numberWithInt: kAudioFormatLinearPCM],AVFormatIDKey,
                                   //采样位数  8、16、24、32 默认为16
                                   [NSNumber numberWithInt:16],AVLinearPCMBitDepthKey,
                                   // 音频通道数 1 或 2
                                   [NSNumber numberWithInt: 1], AVNumberOfChannelsKey,
                                   //录音质量
                                   [NSNumber numberWithInt:AVAudioQualityHigh],AVEncoderAudioQualityKey,
                                   nil];
    return recordSetting;
}

- (AVAudioSession *)session{
    if (_session == nil) {
        NSError *sessionError;
        _session =[AVAudioSession sharedInstance];
        [_session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
        if (_session == nil) {
            NSAssert(NO, @"Error creating session: %@",[sessionError description]);
        }else{
            [_session setActive:YES error:nil];
        }
    }
    return _session;
}

#pragma mark - 录音下载 并本地保存
- (BOOL)__loadVoiceWithPath:(NSString *_Nonnull)voicePath saveFilePath:(NSString *_Nonnull)saveFilePath{
    //设置下载链接
    NSURL *soundURL = [NSURL URLWithString:voicePath];
    //根据链接获取数据
    NSData *audioData = [NSData dataWithContentsOfURL: soundURL];
    
    //保存
    if ([audioData writeToFile:saveFilePath atomically:YES]) {
        DEBUGLOG(@"语音下载成功并保存");
        DEBUGLOG(@"%@", saveFilePath);
        return YES;
    }else{
        DEBUGLOG(@"保存错误 -> %@", saveFilePath);
        return NO;
    }
}

@end


