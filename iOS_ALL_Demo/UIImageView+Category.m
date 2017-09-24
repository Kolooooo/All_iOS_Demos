//
//  UIImageView+Category.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 24/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "UIImageView+Category.h"

@implementation UIImageView (Category)

- (void)setAnimationWithImages:(NSArray<UIImage *> *_Nonnull)animationImages
          animationRepeatCount:(NSInteger)animationRepeatCount
             animationDuration:(NSTimeInterval)animationDuration{
    // 设置图片的序列帧 图片数组
    self.animationImages = animationImages;
    //动画重复次数
    self.animationRepeatCount = animationRepeatCount;
    //动画执行时间,多长时间执行完动画
    self.animationDuration = animationDuration;
    //开始动画
    [self startAnimating];
}

@end
