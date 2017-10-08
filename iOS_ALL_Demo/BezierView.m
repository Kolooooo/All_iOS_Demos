//
//  BezierView.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 24/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "BezierView.h"

@interface BezierView()

// 执行动画的载体
@property (nonatomic, strong) CAShapeLayer *shapLayer;

@end

@implementation BezierView

// 画面的初始化在此方法内进行
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = [UIApplication sharedApplication].keyWindow.bounds;
        self.backgroundColor = [UIColor redColor];
        
        UIBezierPath *bpath = [UIBezierPath bezierPath];
        
        // 贝塞尔曲线点1
        //        [bpath moveToPoint:CGPointMake(100, 150)];
        //
        //        [bpath addCurveToPoint:CGPointMake(300, 150)   // 贝塞尔曲线点4
        //                 controlPoint1:CGPointMake(200, 80)    // 贝塞尔曲线点2
        //                 controlPoint2:CGPointMake(200, 200)]; // 贝塞尔曲线点3
        //
        //        [bpath addCurveToPoint:CGPointMake(300, 400)
        //                 controlPoint1:CGPointMake(400, 230)
        //                 controlPoint2:CGPointMake(250, 350)];
        //
        //        [bpath addLineToPoint:CGPointMake(100, 400)];
        
        [bpath moveToPoint:CGPointMake(16, 5.4)];
        
        [bpath addCurveToPoint:CGPointMake(47, 42)   // 贝塞尔曲线点4
                 controlPoint1:CGPointMake(39, 9)    // 贝塞尔曲线点2
                 controlPoint2:CGPointMake(43, 26)]; // 贝塞尔曲线点3
        
        [bpath addCurveToPoint:CGPointMake(8, 27)   // 贝塞尔曲线点4
                 controlPoint1:CGPointMake(32, 48)    // 贝塞尔曲线点2
                 controlPoint2:CGPointMake(10, 48)]; // 贝塞尔曲线点3
        
//        [bpath addLineToPoint:CGPointMake(50, 50)];
        
        [bpath closePath];
        
        self.shapLayer.path = bpath.CGPath;
        
        [self.layer addSublayer:_shapLayer];
        
        // --
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor orangeColor];
        button.frame = CGRectMake(0, self.height - 100, 100, 100);
        [button addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        // --
        
        UIView *point = [[UIView alloc] init];
        point.backgroundColor = [UIColor redColor];
        point.frame = CGRectMake(100, 150, 10, 10);
        
        UIView *point1 = [[UIView alloc] init];
        point1.backgroundColor = [UIColor orangeColor];
        point1.frame = CGRectMake(300, 150, 10, 10);
        
        UIView *point2 = [[UIView alloc] init];
        point2.backgroundColor = [UIColor yellowColor];
        point2.frame = CGRectMake(200, 80, 10, 10);
        
        UIView *point3 = [[UIView alloc] init];
        point3.backgroundColor = [UIColor purpleColor];
        point3.frame = CGRectMake(200, 200, 10, 10);
        
        [self addSubview:point];
        [self addSubview:point1];
        [self addSubview:point2];
        [self addSubview:point3];
        
        // --
        
        //        UIView *point11 = [[UIView alloc] init];
        //        point11.backgroundColor = [UIColor purpleColor];
        //        point11.frame = CGRectMake(300, 400, 3, 3);
        //
        //        UIView *point21 = [[UIView alloc] init];
        //        point21.backgroundColor = [UIColor purpleColor];
        //        point21.frame = CGRectMake(400, 230, 3, 3);
        //
        //        UIView *point31 = [[UIView alloc] init];
        //        point31.backgroundColor = [UIColor purpleColor];
        //        point31.frame = CGRectMake(250, 350, 3, 3);
        //
        //        UIView *point4 = [[UIView alloc] init];
        //        point4.backgroundColor = [UIColor purpleColor];
        //        point4.frame = CGRectMake(100, 400, 3, 3);
        //
        //        [self addSubview:point11];
        //        [self addSubview:point21];
        //        [self addSubview:point31];
        //        [self addSubview:point4];
    }
    return self;
}

// 获得一个path
- (UIBezierPath *)rectPath {
    UIBezierPath *rectpath = [UIBezierPath bezierPath];
    
    //    [rectpath moveToPoint:CGPointMake(100.0, 150.0)];
    //    [rectpath addLineToPoint:CGPointMake(300, 150)];
    //    [rectpath addLineToPoint:CGPointMake(300, 400)];
    //    [rectpath addLineToPoint:CGPointMake(100, 400)];
    
    [rectpath moveToPoint:CGPointMake(100, 150)];
    
    [rectpath addCurveToPoint:CGPointMake(200, 150)   // 贝塞尔曲线点4
                controlPoint1:CGPointMake(100, 80)    // 贝塞尔曲线点2
                controlPoint2:CGPointMake(100, 200)]; // 贝塞尔曲线点3
    
    [rectpath addCurveToPoint:CGPointMake(200, 400)
                controlPoint1:CGPointMake(300, 230)
                controlPoint2:CGPointMake(150, 350)];
    
    [rectpath addLineToPoint:CGPointMake(100, 400)];
    
    [rectpath closePath];
    
    // --
    
    UIView *point = [[UIView alloc] init];
    point.backgroundColor = [UIColor blueColor];
    point.frame = CGRectMake(100, 150, 3, 3);
    
    UIView *point1 = [[UIView alloc] init];
    point1.backgroundColor = [UIColor blueColor];
    point1.frame = CGRectMake(300, 150, 3, 3);
    
    UIView *point2 = [[UIView alloc] init];
    point2.backgroundColor = [UIColor blueColor];
    point2.frame = CGRectMake(300, 400, 3, 3);
    
    UIView *point3 = [[UIView alloc] init];
    point3.backgroundColor = [UIColor blueColor];
    point3.frame = CGRectMake(100, 400, 3, 3);
    
    [self addSubview:point];
    [self addSubview:point1];
    [self addSubview:point2];
    [self addSubview:point3];
    
    
    return rectpath;
}

// 执行动画
- (void)animate {
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    expandAnimation.fromValue = (__bridge id)(_shapLayer.path);
    expandAnimation.toValue = (__bridge id)[self rectPath].CGPath;
    expandAnimation.beginTime = 0;
    expandAnimation.duration = 3;
    expandAnimation.fillMode = kCAFillModeForwards;
    expandAnimation.removedOnCompletion = NO;
    [self.shapLayer addAnimation:expandAnimation forKey:nil];
    
}

// 加个按钮让动画可以重复进行
- (void)touchButton:(UIButton *)button {
    [self animate];
}

#pragma mark - initViews
- (CAShapeLayer *)shapLayer {
    if (!_shapLayer) {
        _shapLayer = [[CAShapeLayer alloc] init];
        _shapLayer.frame = self.bounds;
        _shapLayer.fillColor = [UIColor greenColor].CGColor;
    }
    return _shapLayer;
}

@end
