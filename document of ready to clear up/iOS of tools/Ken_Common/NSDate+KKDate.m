//
//  NSDate+KKDate.m
//  SeekStar
//
//  Created by Ken_lu on 17/1/10.
//  Copyright © 2017年 模特. All rights reserved.
//

#import "NSDate+KKDate.h"

@implementation NSDate (KKDate)

-(NSString *)KK_formatterDateWithformatString:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    return [dateFormatter stringFromDate:self];
}

@end
