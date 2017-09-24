//
//  BezierView.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 24/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "BezierView.h"

@implementation BezierView

- (void)drawRect:(CGRect)rect{
    [[UIColor redColor] set];
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    path.lineWidth     = 3.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path moveToPoint:CGPointMake(0+10, self.height * 0.5)];
    
    // 给定终点和两个控制点绘制贝塞尔曲线
    [path addCurveToPoint:CGPointMake(self.width-10, self.height * 0.5) controlPoint1:CGPointMake(110, 85) controlPoint2:CGPointMake(85, self.width-10 - 220)];
    
    [path stroke];
}

@end
