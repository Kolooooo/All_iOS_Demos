

#import "__PickerView.h"

/// pickerView 父视图高度
static const CGFloat bigViewHeight = 350.0f;
static const CGFloat toolBarViewHeight = 40.0f;
static const NSTimeInterval animateDuration = 0.25f;
static const CGFloat doneButtonWidth = 50.0f;
static const CGFloat cancelButtonWidth = 50.0f;
static const CGFloat lineHeight = 0.5f;

@interface __PickerView()

@property (nonatomic, strong) UIView  *bigView;
@property (nonatomic, strong) UIButton  *coverButton;

/// 中间选中的两条线
@property (nonatomic, strong) UIView  *topLine;
@property (nonatomic, strong) UIView  *bottomLine;

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

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initUI];
        [self initData];
    }
    return self;
}

- (void)initUI{
    self.alpha = 0;
    
    [self addSubview:self.coverButton];
    [self addSubview:self.bigView];
    [self.bigView addSubview:self.pickerView];
    [self.pickerView addSubview:self.topLine];
    [self.pickerView addSubview:self.bottomLine];
    [self.bigView addSubview:self.toolBarView];
    [self.toolBarView addSubview:self.doneButton];
    [self.toolBarView addSubview:self.cancelButton];
    
    
    [self.coverButton addTarget:self action:@selector(touchCoverButton) forControlEvents:UIControlEventTouchUpInside];
    [self.doneButton addTarget:self action:@selector(touchCommitButton) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelButton addTarget:self action:@selector(touchCancelButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.coverButton.frame = CGRectMake(0, 0, self.width, self.height);
    self.bigView.frame = CGRectMake(0, self.height, self.width, bigViewHeight);
    self.toolBarView.frame = CGRectMake(0, 0, self.bigView.width, toolBarViewHeight);
    self.pickerView.frame = CGRectMake(0, self.toolBarView.height, self.bigView.width, self.bigView.height-self.toolBarView.height);
    self.topLine.frame = CGRectMake(0.0, 0.0, self.pickerView.width, lineHeight);
    self.topLine.centerY = self.pickerView.height * 0.5 - 22.5;
    self.bottomLine.frame = CGRectMake(0.0, 0.0, self.pickerView.width, lineHeight);
    self.bottomLine.centerY = self.pickerView.height * 0.5 + 22.5;
    self.doneButton.frame = CGRectMake(self.toolBarView.width-doneButtonWidth, 0.0, doneButtonWidth, self.toolBarView.height);
    self.cancelButton.frame = CGRectMake(0.0, 0.0, cancelButtonWidth, self.toolBarView.height);
}

#pragma mark - public method
- (void)show{
    if (self.isShow) {
        return;
    }
    
    if ([self.delegale respondsToSelector:@selector(__willShow:)]) {
        [self.delegale __willShow:self];
    }
    
    [UIView animateWithDuration:animateDuration animations:^{
        self.isShow = YES;
        self.alpha = 1.0;
        self.bigView.y = self.height-bigViewHeight;
    }];
}

- (void)hidden{
    if (!self.isShow) {
        return;
    }
    
    if ([self.delegale respondsToSelector:@selector(__willHidden:)]) {
        [self.delegale __willHidden:self];
    }
    
    [UIView animateWithDuration:animateDuration animations:^{
        self.isShow = NO;
        self.alpha = 0.0;
        self.bigView.y = self.height;
    }];
}

- (void)showOrHidden{
    self.isShow == YES
    ? [self hidden]
    : [self show];
}

- (void)reloadAllComponents{
    [self.pickerView reloadAllComponents];
}

- (void)setSelectedLineColor:(UIColor *)color{
    self.topLine.backgroundColor = color;
    self.bottomLine.backgroundColor = color;
}

#pragma mark - private method
- (void)touchCoverButton{
    [self hidden];
}

- (void)touchCommitButton{
    if ([self.delegale respondsToSelector:@selector(__touchDoneButton:)]) {
        [self.delegale __touchDoneButton:self];
    }
    
    [self hidden];
}

- (void)touchCancelButton{
    [self hidden];
}

- (void)initData{
    self.isShow = NO;
}

#pragma mark - setter
- (void)setDelegale:(id<__PickerViewDelegate>)delegale{
    _delegale = delegale;
    self.pickerView.delegate = delegale;
}

- (void)setDataSource:(id<__PickerViewDataSource>)dataSource{
    _dataSource = dataSource;
    self.pickerView.dataSource = dataSource;
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
        [_doneButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _doneButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    }
    return _doneButton;
}

- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    }
    return _cancelButton;
}

- (UIView *)topLine{
    if (_topLine == nil) {
        _topLine = [[UIView alloc] init];
        _topLine.backgroundColor = [UIColor orangeColor];
    }
    return _topLine;
}

- (UIView *)bottomLine{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor orangeColor];
    }
    return _bottomLine;
}

@end

