//
//  QTPlaceEntity.m
//  QunhuanTribe
//
//  Created by Ken_lu on 2017/12/19.
//  Copyright © 2017年 GarveyCalvin. All rights reserved.
//

#import "PlaceModel.h"
@class CityModel;

@implementation PlaceModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID": @"id"
             };
}

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"son" : @"CityModel"
             };
}

- (void)setName:(NSString *)name{
    _name = name;
    
    if ([name  isEqual: @"澳门"] || [name  isEqual: @"香港"]) {
        CityModel *city = [[CityModel alloc] init];
        city.name = @"特别行政区";
        self.son = @[city];
        return;
    }
    
    if ([name  isEqual: @"北京市"] || [name  isEqual: @"重庆市"] || [name  isEqual: @"上海市"] || [name  isEqual: @"天津市"]) {
        CityModel *city = [[CityModel alloc] init];
        city.name = @"直辖市";
        self.son = @[city];
        return;
    }
}

@end

@implementation CityModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID": @"id"
             };
}

@end

@implementation SelectedPlace

@end
