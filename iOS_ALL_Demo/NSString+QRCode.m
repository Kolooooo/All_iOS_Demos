//
//  NSString+QRCode.m
//  ShareJobStudent
//
//  Created by Jeason on 2016/10/26.
//  Copyright © 2016年 GeekBean Technology Co., Ltd. All rights reserved.
//

#import "NSString+QRCode.h"

@implementation NSString (QRCode)

+ (NSString *)stringWithQRCodeImage:(UIImage *)image {
    NSString *qrContent;
    if ([SDVersion versionGreaterThanOrEqualTo:@"8"]) {
        NSData *imageData = UIImagePNGRepresentation(image);
        CIImage *ciImage = [CIImage imageWithData:imageData];
        CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy: CIDetectorAccuracyLow}];
        NSArray *feature = [detector featuresInImage:ciImage];
        for (CIQRCodeFeature *result in feature) {
            qrContent = result.messageString;
        }
    }
    return qrContent;
}

@end
