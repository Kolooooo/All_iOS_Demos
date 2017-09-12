//
//  NSDate+KKDate.h
//  SeekStar
//
//  Created by Ken_lu on 17/1/10.
//  Copyright © 2017年 模特. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (KKDate)

/// 日期转换String 格式化。例子：formatString:@"yy-MM-dd HH:mm"
- (NSString *)KK_formatterDateWithformatString:(NSString *)format;

@end
