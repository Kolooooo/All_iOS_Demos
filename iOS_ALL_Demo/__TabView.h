

#import <UIKit/UIKit.h>

@interface __TabView : UIView

/// 多少个页面
@property (nonatomic, assign) NSInteger  pageCount;
@property (nonatomic, strong) NSArray<NSString *> *titles;


/// 默认40.0
@property (nonatomic, assign) CGFloat  tabBarViewHeight;
/// 默认3.0
@property (nonatomic, assign) CGFloat  currentLineHeight;
/// 默认10.0
@property (nonatomic, assign) CGFloat  currentLineWidth;


@property (nonatomic, strong) UIColor  *currentLineColor;
@property (nonatomic, strong) UIColor  *titleNoSelectedColor;
@property (nonatomic, assign) UIColor  *titleSelectedColor;

@end

