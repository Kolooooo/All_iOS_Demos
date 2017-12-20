//
//  __PickerView.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2017/12/20.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "__PickerView.h"

/// pickerView 父视图高度
static const CGFloat bigViewHeight = 400.0f;
static const CGFloat toolBarViewHeight = 40.0f;


@interface __PickerView()

@property (nonatomic, strong) UIView  *bigView;
@property (nonatomic, strong) UIView  *toolBarView;
@property (nonatomic, strong) UIPickerView  *pickerView;
@property (nonatomic, strong) UIButton  *coverButton;
@property (nonatomic, strong) UIButton  *doneButton;
@property (nonatomic, strong) UIButton  *cacelButton;

@end

@implementation __PickerView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    self.coverButton.frame = CGRectMake(0, 0, self.width, self.height);
    self.bigView.frame = CGRectMake(0, self.height, self.width, bigViewHeight);
    self.toolBarView.frame = CGRectMake(0, 0, self.bigView.width, toolBarViewHeight);
    self.pickerView.frame = CGRectMake(0, self.toolBarView.height, self.bigView.width, self.bigView.height-self.toolBarView.height);
    
    
    [self addSubview:self.coverButton];
    [self addSubview:self.bigView];
    [self.bigView addSubview:self.toolBarView];
    [self.bigView addSubview:self.pickerView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (void)show{
    
}

- (void)hidden{
    
}

- (void)setPickerViewDelegale:(id<UIPickerViewDelegate>)pickerViewDelegale{
    _pickerViewDelegale = pickerViewDelegale;
    
    self.pickerView.delegate = pickerViewDelegale;
}

#pragma mark - lazy load
- (UIButton *)coverButton{
    if (_coverButton == nil) {
        _coverButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _coverButton.backgroundColor = [UIColor blackColor];
        _coverButton.alpha = 0.3;
    }
    return _coverButton;
}

- (UIView *)bigView{
    if (_bigView == nil) {
        _bigView = [[UIView alloc] init];
        _bigView.backgroundColor = [UIColor whiteColor];
    }
    return _bigView;
}

- (UIView *)toolBarView{
    if (_toolBarView == nil) {
        _toolBarView = [[UIView alloc] init];
        _toolBarView.backgroundColor = [UIColor whiteColor];
    }
    return _toolBarView;
}

- (UIPickerView *)pickerView{
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc] init];
    }
    return _pickerView;
}

@end
