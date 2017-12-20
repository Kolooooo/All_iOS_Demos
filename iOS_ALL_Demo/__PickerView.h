//
//  __PickerView.h
//  iOS_ALL_Demo
//
//  Created by Ken on 2017/12/20.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface __PickerView : UIView

@property (nonatomic, weak) id <UIPickerViewDelegate> delegale;

- (void)show;
- (void)hidden;

@end
