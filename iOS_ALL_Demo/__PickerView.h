

#import <UIKit/UIKit.h>
@class __PickerView;

@protocol __PickerViewDelegate <UIPickerViewDelegate>
@required

@optional
- (void)__touchDoneButton:(__PickerView *)pickerView;
- (void)__willShow:(__PickerView *)pickerView;
- (void)__willHidden:(__PickerView *)pickerView;
@end

@protocol __PickerViewDataSource <UIPickerViewDataSource>
@required

@optional

@end

@interface __PickerView : UIView

@property (nonatomic, weak) id <__PickerViewDelegate> delegale;
@property (nonatomic, weak) id <__PickerViewDataSource> dataSource;

@property (nonatomic, strong) UIView  *toolBarView;
@property (nonatomic, strong) UIButton  *doneButton;
@property (nonatomic, strong) UIButton  *cancelButton;
@property (nonatomic, strong) UIPickerView  *pickerView;

- (void)show;
- (void)hidden;
/// 显示或者隐藏
- (void)showOrHidden;
/// 刷新pickerView
- (void)reloadAllComponents;
- (void)setSelectedLineColor:(UIColor *)color;

@end

