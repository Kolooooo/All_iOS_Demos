//
//  QTPlaceEntity.h
//  QunhuanTribe
//
//  Created by Ken_lu on 2017/12/19.
//  Copyright © 2017年 GarveyCalvin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CityModel;

@interface PlaceModel : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray<CityModel *> *son;

@end

@interface CityModel : NSObject

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;

@end


