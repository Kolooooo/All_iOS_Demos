//
//  UIImageView+Category.h
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 24/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Category)

- (void)setAnimationWithImages:(NSArray<UIImage *> *_Nonnull)animationImages
          animationRepeatCount:(NSInteger)animationRepeatCount
             animationDuration:(NSTimeInterval)animationDuration;

@end
