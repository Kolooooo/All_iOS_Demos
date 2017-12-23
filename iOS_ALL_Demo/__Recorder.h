//
//  __RecorderTool.h
//  RLAudioRecord
//
//  Created by Ken on 2017/12/23.
//  Copyright © 2017年 Enorth.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface __Recorder : NSObject

- (instancetype)initWith:(NSURL *)recordFileUrl;

- (void)__startRecord;
- (void)__stopRecord;
- (void)__playRecord;

@end
