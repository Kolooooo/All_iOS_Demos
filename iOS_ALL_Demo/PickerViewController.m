//
//  PickerViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/12/20.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "PickerViewController.h"
#import "PlaceModel.h"

@interface PickerViewController ()
<__PickerViewDelegate,
__PickerViewDataSource>

@property (nonatomic, strong) __PickerView  *pickerView;
@property (nonatomic, strong) NSMutableArray *places;

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self initData];
}

- (void)initUI{
    self.pickerView = [[__PickerView alloc] init];
    self.pickerView.frame = CGRectMake(0, 0, __ScreenWidth, __ScreenHeight);
    self.pickerView.delegale = self;
    self.pickerView.dataSource = self;
    [self.view addSubview:self.pickerView];
}

- (void)initData{
    NSDictionary *jsonObject = [self loadJsonDocument:@"place" ofType:@"json"];
    self.places = [PlaceModel mj_objectArrayWithKeyValuesArray:jsonObject[@"datas"][@"list"]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.pickerView show];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.places.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return @"ken";
}

//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
//
//#pragma mark 隐藏/改变颜色 选中的两条线
//    for(UIView *speartorView in pickerView.subviews){
//        // 取出分割线view
//        if (speartorView.frame.size.height < 1){
//            speartorView.backgroundColor = [UIColor clearColor];
//        }
//    }
//
//    return nil;
//}

@end
