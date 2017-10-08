

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ScrollDirection) {
    ScrollDirectionUp,
    ScrollDirectionDown,
    ScrollDirectionLeft,
    ScrollDirectionRight,
    ScrollDirectionNone
};

@interface UIScrollView (__Category)

@property (nonatomic) CGFloat contentWidth;
@property (nonatomic) CGFloat contentHeight;
@property (nonatomic) CGFloat contentOffsetX;
@property (nonatomic) CGFloat contentOffsetY;

- (void)setContentOffsetX:(CGFloat)x animated:(BOOL)animated;
- (void)setContentOffsetY:(CGFloat)y animated:(BOOL)animated;

- (CGPoint)topContentOffset;
- (CGPoint)bottomContentOffset;
- (CGPoint)leftContentOffset;
- (CGPoint)rightContentOffset;

- (ScrollDirection)ScrollDirection;

- (BOOL)isScrolledToTop;
- (BOOL)isScrolledToBottom;
- (BOOL)isScrolledToLeft;
- (BOOL)isScrolledToRight;
- (void)scrollToTopAnimated:(BOOL)animated;
- (void)scrollToBottomAnimated:(BOOL)animated;
- (void)scrollToLeftAnimated:(BOOL)animated;
- (void)scrollToRightAnimated:(BOOL)animated;
- (void)stopScrolling;

- (NSUInteger)verticalPageIndex;
- (NSUInteger)horizontalPageIndex;

- (void)scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
- (void)scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;

@end
