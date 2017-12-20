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
static const NSTimeInterval animateDuration = 0.25f;


@interface __PickerView()

@property (nonatomic, strong) UIView  *bigView;
@property (nonatomic, strong) UIView  *toolBarView;
@property (nonatomic, strong) UIPickerView  *pickerView;
@property (nonatomic, strong) UIButton  *coverButton;
@property (nonatomic, strong) UIButton  *doneButton;
@property (nonatomic, strong) UIButton  *cancelButton;

@property (nonatomic, assign) BOOL isShow;

@end

@implementation __PickerView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
        [self initData];
    }
    return self;
}

- (void)initUI{
    self.alpha = 0;
    
    self.coverButton.frame = CGRectMake(0, 0, self.width, self.height);
    self.bigView.frame = CGRectMake(0, self.height, self.width, bigViewHeight);
    self.toolBarView.frame = CGRectMake(0, 0, self.bigView.width, toolBarViewHeight);
    self.pickerView.frame = CGRectMake(0, self.toolBarView.height, self.bigView.width, self.bigView.height-self.toolBarView.height);
    
    
    [self addSubview:self.coverButton];
    [self addSubview:self.bigView];
    [self.bigView addSubview:self.toolBarView];
    [self.bigView addSubview:self.pickerView];
    
    
    [self.coverButton addTarget:self action:@selector(touchCoverButton) forControlEvents:UIControlEventTouchUpInside];
    [self.doneButton addTarget:self action:@selector(touchCommitButton) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelButton addTarget:self action:@selector(touchCancelButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (void)show{
    if (self.isShow) {
        return;
    }
    
    [UIView animateWithDuration:animateDuration animations:^{
        self.isShow = YES;
        self.alpha = 1.0;
        self.bigView.y = self.height-self.bigView.height;
    }];
}

- (void)hidden{
    if (!self.isShow) {
        return;
    }
    
    [UIView animateWithDuration:animateDuration animations:^{
        self.isShow = NO;
        self.alpha = 0.0;
        self.bigView.y = self.height;
    }];
}

- (void)touchCoverButton{
    [self hidden];
}

- (void)touchCommitButton{
    [self hidden];
}

- (void)touchCancelButton{
    [self hidden];
}

- (void)initData{
    self.isShow = NO;
}

- (void)setDelegale:(id<UIPickerViewDelegate>)delegale{
    _delegale = delegale;
    self.pickerView.delegate = delegale;
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

- (UIButton *)doneButton{
    if (_doneButton == nil) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_doneButton setTitle:@"确定" forState:UIControlStateNormal];
    }
    return _doneButton;
}

- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    }
    return _cancelButton;
}

@end
