//
//  NSString+Extension.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 08/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (id _Nonnull)objectFromClassName{
    Class objectClass = NSClassFromString(self);
    return [[objectClass alloc] init];
}

+ (NSArray<NSString *> *_Nonnull)array_SomeTextLocationWith:(NSString *_Nonnull)text searchText:(NSString *_Nonnull)searchText{
    NSString *replaceSign = @"+";
    
    NSString *replacedText = [text stringByReplacingOccurrencesOfString:searchText withString:replaceSign];
    
    NSMutableArray *indexMarray = [NSMutableArray array];
    for (int i = 0; i < replacedText.length; i++) {
        NSString *oneText = [replacedText substringWithRange:NSMakeRange(i, 1)];
        if([oneText isEqualToString:replaceSign]){
            [indexMarray addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    
    return indexMarray.copy;
}

@end
