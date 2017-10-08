//
//  NSString+HTML.h
//  ShareJobStudent
//
//  Created by Sunnyyoung on 16/1/12.
//  Copyright © 2016年 GeekBean Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HTML)

- (NSString *)stringByDecodeHTMLEntities;
- (NSString *)stringByStripHTMLTags;

@end
