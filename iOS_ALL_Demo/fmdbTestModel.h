//
//  fmdbTestModel.h
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/10/22.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FmdbTestModel : NSObject

@property (nonatomic, copy) NSString *privateJobId;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, assign) BOOL canClick;

+ (instancetype)sharedInstance;

- (void)savaWithModel:(FmdbTestModel *)model;
- (void)editWithModel:(FmdbTestModel *)model;
- (void)deleteWithModel:(FmdbTestModel *)model;
- (NSArray<FmdbTestModel *> *)getAllData;

@end
