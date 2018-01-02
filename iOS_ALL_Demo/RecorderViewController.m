//
//  ViewController.m
//  RLAudioRecord
//
//  Created by Rachel on 16/2/26.
//  Copyright © 2016年 Rachel. All rights reserved.
//

#import "RecorderViewController.h"
#import "__Recorder.h"


@interface RecorderViewController ()

@property (nonatomic, strong) __Recorder  *recorder;
@property (nonatomic, strong) NSURL *recordFileUrl;

@end

@implementation RecorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.获取沙盒地址
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [path stringByAppendingString:@"/RRecord.wav"];
    
    //2.获取文件路径
    self.recordFileUrl = [NSURL fileURLWithPath:filePath];
    self.recorder = [[__Recorder alloc] initWith:self.recordFileUrl];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString *voicePath = @"http:\/\/p06blazdg.bkt.clouddn.com\/20171228174407_4f5b294002d63d498e932aed7eacc88b.amr";
    
    NSString *documentPath = [NSFileManager __documentPath];
    NSString *saveFilePath = [NSString stringWithFormat:@"%@/%@", documentPath, @"20171228174407_4f5b294002d63d498e932aed7eacc88b.amr"];
    [self.recorder __loadVoiceWithPath:voicePath saveFilePath:saveFilePath];
    

    NSString *wavPath = [NSString stringWithFormat:@"%@/%@", NSFileManager.__documentPath, @"test.wav"];
    [VoiceConverter ConvertAmrToWav:saveFilePath wavSavePath:wavPath];
    
    NSURL *fileURL = [NSURL URLWithString:wavPath];
    [self.recorder __playRecordWithURL: fileURL];
    DEBUGLOG(@"%@", saveFilePath);
}

- (IBAction)startRecord:(id)sender {
    [self.recorder __startRecord];
}

- (IBAction)stopRecord:(id)sender {
    [self.recorder __stopRecord];
}

- (IBAction)playRecord:(id)sender {
    [self.recorder __playRecordWithURL:self.recordFileUrl];
}

@end
