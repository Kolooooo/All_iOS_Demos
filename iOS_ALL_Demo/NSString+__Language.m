

#import "NSString+__Language.h"

@implementation NSString (__Language)

- (BOOL)__isAllChinese{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

- (BOOL)__isIncludeChinese{
    for(int i=0; i< [self length];i++)
    {
        int a =[self characterAtIndex:i];
        if( a >0x4e00&& a <0x9fff){
            return YES;
        }
    }
    return NO;
}

- (BOOL)__isIncludeString:(NSString *_Nonnull)includeString{
    if ([self rangeOfString: includeString].location == NSNotFound) {
        return NO;
    } else {
        return YES;
    }
}

@end

