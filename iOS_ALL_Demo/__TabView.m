//
//  __TabView.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2017/12/26.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "__TabView.h"


@interface __TabView()
<UIScrollViewDelegate>

@property (nonatomic, strong) UIView  *tabBarView;
@property (nonatomic, strong) UIView  *currentLine;
@property (nonatomic, strong) UIScrollView  *scrollView;





@property (nonatomic, assign) CGFloat  scrollBeginX;

@property (nonatomic, strong) NSMutableArray<UIButton *> *tabTitleButtonsM;

@end


@implementation __TabView

- (instancetype)init{
    self = [super init];
    if (self) {
        // !!!: init data
        self.tabBarViewHeight = 40.0;
        self.currentLineHeight = 3.0;
        self.currentLineWidth = 10.0;
        
        [self _initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // !!!: init data
        self.tabBarViewHeight = 40.0;
        self.currentLineHeight = 3.0;
        self.currentLineWidth = 10.0;
        
        [self _initUI];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.tabBarView.frame = CGRectMake(0.0, 0.0, self.width, self.tabBarViewHeight);
    
    self.scrollView.frame = CGRectMake(0.0, self.tabBarView.height, self.width, self.height - self.tabBarView.height);
    self.scrollView.contentSize = CGSizeMake(self.scrollView.width * self.pageCount, 0.0);
    
    // !!!: set title buttons frame
    CGFloat tabTitleButtonWidth = self.width / self.tabTitleButtonsM.count;
    CGFloat tabTitleButtonHeight = self.tabBarView.height;
    for (int i = 0; i < self.tabTitleButtonsM.count; i++) {
        UIButton *tabTitleButton = self.tabTitleButtonsM[i];
        CGFloat tabTitleButtonX = tabTitleButtonWidth * i;
        tabTitleButton.frame = CGRectMake(tabTitleButtonX, 0.0, tabTitleButtonWidth, tabTitleButtonHeight);
    }
    
    // !!!: set currentLine frame
    self.currentLine.centerX = self.width / ((self.tabTitleButtonsM.count == 0 ? 1 : self.tabTitleButtonsM.count) * 2.0);
    DEBUGLOG(@"%@", @(self.currentLine.centerX));
    self.currentLine.y = self.tabBarView.height - self.currentLineHeight;
    self.currentLine.width = self.currentLineWidth;
    self.currentLine.height = self.currentLineHeight;
}

#pragma mark - private method
// !!!: touch the title buttons
- (void)_touchTabTitleButton:(UIButton *)button{
    DEBUGLOG(@"%@", @(button.tag));
    for (UIButton *titleButton  in self.tabTitleButtonsM) {
        titleButton.selected = NO;
    }
    button.selected = YES;
    
    [self _setCurrentLineCenterXWithTag:button.tag];
    [self _setScrollViewXWithTag:button.tag];
}

- (void)_setCurrentLineCenterXWithTag:(NSInteger)tag{
    // 一个centerX 的长度
    CGFloat oneLineCenterX = self.width / ((self.tabTitleButtonsM.count == 0 ? 1 : self.tabTitleButtonsM.count) * 2.0);
    
    NSInteger count =  (tag + 1) + tag;
    [UIView animateWithDuration:0.25 animations:^{
        self.currentLine.centerX = count * oneLineCenterX;
    }];
}

- (void)_setScrollViewXWithTag:(NSInteger)tag{
    [self.scrollView setContentOffset:CGPointMake(tag * self.width, 0.0) animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // !!!: ken.todo
    DEBUGLOG(@"%f", scrollView.contentOffset.x);
}

#pragma mark - UI
- (void)_initUI{
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.tabBarView];
    [self.tabBarView addSubview:self.currentLine];
    [self addSubview:self.scrollView];
}

#pragma mark - setter
- (void)setPageCount:(NSInteger)pageCount{
    _pageCount = pageCount;
    
    // !!!: init title buttons
    for (int i = 0; i < pageCount; i++) {
        UIButton *tabTitleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [tabTitleButton setTitle:@"" forState:UIControlStateNormal];
        [tabTitleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [tabTitleButton setTitleColor:[UIColor purpleColor] forState:UIControlStateSelected];
        tabTitleButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        tabTitleButton.tag = i;
        [tabTitleButton addTarget:self action:@selector(_touchTabTitleButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBarView addSubview:tabTitleButton];
        
        [self.tabTitleButtonsM addObject:tabTitleButton];
    }
}

- (void)setTitles:(NSArray<NSString *> *)titles{
    _titles = titles;
    
    if (titles.count != self.tabTitleButtonsM.count) {
        NSAssert(NO, @"buttons count is not equal titles count");
        return;
    }
    
    for (int i = 0; i < titles.count; i++) {
        UIButton *button = self.tabTitleButtonsM[i];
        NSString *title = titles[i];
        [button setTitle:title forState:UIControlStateNormal];
    }
}

- (void)setCurrentLineColor:(UIColor *)currentLineColor{
    _currentLineColor = currentLineColor;
    
    self.currentLine.backgroundColor = currentLineColor;
}

- (void)setTitleNoSelectedColor:(UIColor *)titleNoSelectedColor{
    _titleNoSelectedColor = titleNoSelectedColor;
    
    for (UIButton *button in self.tabTitleButtonsM) {
        [button setTitleColor:titleNoSelectedColor forState:UIControlStateNormal];
    }
}

- (void)setTitleSelectedColor:(UIColor *)titleSelectedColor{
    _titleSelectedColor = titleSelectedColor;
    
    for (UIButton *button in self.tabTitleButtonsM) {
        [button setTitleColor:titleSelectedColor forState:UIControlStateSelected];
    }
}

#pragma mark - lazy load
- (UIView *)tabBarView{
    if (_tabBarView == nil) {
        _tabBarView = [[UIView alloc] init];
    }
    return _tabBarView;
}

- (UIView *)currentLine{
    if (_currentLine == nil) {
        _currentLine = [[UIView alloc] init];
        _currentLine.backgroundColor = [UIColor purpleColor];
    }
    return _currentLine;
}

- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.scrollEnabled = YES;
        [_scrollView setPagingEnabled:YES];
    }
    return _scrollView;
}

- (NSMutableArray<UIButton *> *)tabTitleButtonsM{
    if (_tabTitleButtonsM == nil) {
        _tabTitleButtonsM = [NSMutableArray array];
    }
    return _tabTitleButtonsM;
}

@end
