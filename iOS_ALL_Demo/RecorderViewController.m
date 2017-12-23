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

@end

@implementation RecorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.获取沙盒地址
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [path stringByAppendingString:@"/RRecord.arm"];
    
    //2.获取文件路径
    NSURL *recordFileUrl = [NSURL fileURLWithPath:filePath];
    self.recorder = [[__Recorder alloc] initWith:recordFileUrl];
}

- (IBAction)startRecord:(id)sender {
    [self.recorder __startRecord];
}

- (IBAction)stopRecord:(id)sender {
    [self.recorder __stopRecord];
}

- (IBAction)playRecord:(id)sender {
    [self.recorder __playRecord];
}

@end
