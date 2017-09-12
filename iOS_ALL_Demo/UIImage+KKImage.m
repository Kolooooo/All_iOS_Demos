//
//  UIImage+KKImage.m
//  SeekStar
//
//  Created by Ken_lu on 17/1/7.
//  Copyright © 2017年 模特. All rights reserved.
//

#import "UIImage+KKImage.h"

@implementation UIImage (KKImage)

- (UIImage*)KK_imageScale:(float)scale{
    CGSize size = self.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    CGFloat scaledWidth = width * scale;
    CGFloat scaledHeight = height * scale;
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0,0,scaledWidth,scaledHeight)];
    UIImage* newImage= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)KK_imageScaledToSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (BOOL)KK_saveImageToDocmentWithFileName:(NSString*)fileName{
    NSString *fileName1 = @"";
    if (![fileName containsString:@".png"]) {
        fileName1 = [NSString stringWithFormat:@"%@.png", fileName];
    }else{
        fileName1 = fileName;
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:fileName1];
    BOOL result = [UIImagePNGRepresentation(self) writeToFile: filePath atomically:YES];
    
    if (result){
        return YES;
    }else{
        NSAssert(NO, @"图片保存失败");
        return NO;
    }
}

@end
