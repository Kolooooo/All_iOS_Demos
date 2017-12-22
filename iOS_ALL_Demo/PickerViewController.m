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
@property (nonatomic, strong) SelectedPlace  *selectedPlace;

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
    
    self.selectedPlace = [[SelectedPlace alloc] init];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.pickerView show];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.places.count;
    }
    
    if (component == 1) {
        NSInteger placeComponent = [pickerView selectedRowInComponent:0];
        PlaceModel *place = self.places[placeComponent];
        return place.son.count;
    }
    
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        if (self.places.count > row) {
            PlaceModel *place = self.places[row];
            return place.name;
        }
    }
    
    if (component == 1) {
        NSInteger placeComponent = [pickerView selectedRowInComponent:0];
        if (self.places.count > placeComponent) {
            PlaceModel *place = self.places[placeComponent];
            if (place.son.count > row) {
                CityModel *city = place.son[row];
                return city.name;
            }
        }
    }
    
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        if (self.places.count > row) {
            
#pragma mark 滚动0列 刷新1列数据
            [pickerView reloadComponent:1];
            [pickerView selectRow:0 inComponent:1 animated:NO];
            
            PlaceModel *place = self.places[row];
            self.selectedPlace.selectedProvince = place.name;
        }
    }
    
    if (component == 1) {
        NSInteger placeComponent = [pickerView selectedRowInComponent:0];
        if (self.places.count > placeComponent) {
            PlaceModel *place = self.places[placeComponent];
            if (place.son.count > row) {
                CityModel *city = place.son[row];
                self.selectedPlace.selectedCity = city.name;
            }
        }
    }
}

//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
//
#pragma mark 隐藏/改变颜色 选中的两条线，但是这个会把原来的滚动cell 给遮住
//    for(UIView *speartorView in pickerView.subviews){
//        // 取出分割线view
//        if (speartorView.frame.size.height < 1){
//            speartorView.backgroundColor = [UIColor clearColor];
//        }
//    }
//
//    return nil;
//}

#pragma mark __PickerViewDelegate
- (void)__touchDoneButton:(__PickerView *)pickerView{
    DEBUGLOG(@"%@, %@", self.selectedPlace.selectedProvince, self.selectedPlace.selectedCity);
}

@end
