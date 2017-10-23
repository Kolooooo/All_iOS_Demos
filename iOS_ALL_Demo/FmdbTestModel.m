//
//  fmdbTestModel.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/10/22.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "FmdbTestModel.h"
#import "__FMDBManager.h"

@interface FmdbTestModel()

@property (nonatomic, strong) __FMDBManager  *fmdbTestModelDatabase;
@property (nonatomic, copy) NSString *tableName;

@end

@implementation FmdbTestModel

+ (instancetype)sharedInstance {
    static FmdbTestModel *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        [sharedInstance createDatabase];
    });
    return sharedInstance;
}

#pragma mark - create database  and create table
- (void)createDatabase{
    NSString *databaseName = @"FmdbTestModel.db";
    _tableName = @"FmdbTestModel";
    
    _fmdbTestModelDatabase = [__FMDBManager __sharedInstanceWithDatabaseName:databaseName];
    
    NSString *createTableSql =
    [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, privateJobId TEXT, icon TEXT, createdAt TEXT, canClick INTEGER);", _tableName];
    [_fmdbTestModelDatabase __createTableWithName:_tableName sql:createTableSql];
}

#pragma mark - insert or save the database
- (void)savaWithModel:(FmdbTestModel *)model{
    [_fmdbTestModelDatabase open];
    
    NSNumber *maxID = @(0);
    
    //    FMResultSet *res = [_db executeQuery:@"SELECT * FROM person "];
    //    //获取数据库中最大的ID
    //    while ([res next]) {
    //        if ([maxID integerValue] < [[res stringForColumn:@"person_id"] integerValue]) {
    //            maxID = @([[res stringForColumn:@"person_id"] integerValue] ) ;
    //        }
    //
    //    }
    //    maxID = @([maxID integerValue] + 1);
    NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO %@ (privateJobId, icon, createdAt, canClick) VALUES (?, ?, ?, ?);", _tableName];
    
    BOOL isUpdateSuccess = [_fmdbTestModelDatabase executeUpdate:insertSql, model.privateJobId, model.icon, model.createdAt, @(model.canClick)];
    if (!isUpdateSuccess) {
        NSLog(@"delete data error -> %@", personDatabase.lastErrorMessage);
        NSAssert(NO, @"Update is error");
    }
    
    [_fmdbTestModelDatabase close];
}

#pragma mark - edit the database
- (void)editWithModel:(FmdbTestModel *)model{
    [_fmdbTestModelDatabase open];
    
    NSString *updateSql =
    [NSString stringWithFormat:@"UPDATE %@ SET icon = ? SET createdAt = ? SET canClick = ? WHERE privateJobId = ?", _tableName];
    BOOL isUpdateSuccess = [personDatabase executeUpdate:updateSql, model.icon, model.createdAt, @(model.canClick), model.privateJobId];
    if (!isUpdateSuccess) {
        NSLog(@"update data error -> %@", personDatabase.lastErrorMessage);
        NSAssert(NO, @"update data error");
    }
    
    [_fmdbTestModelDatabase close];
}

#pragma mark - delete the database
- (void)deleteWithModel:(FmdbTestModel *)model{
    [_fmdbTestModelDatabase open];
    
    NSString *deleteSql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE _id = ?", _tableName];
    BOOL isDeleteSuccess = [personDatabase executeUpdate:deleteSql, model.privateJobId];
    if (!isDeleteSuccess) {
        NSLog(@"delete data error -> %@", personDatabase.lastErrorMessage);
        NSAssert(NO, @"delete data error");
    }
    
    [_fmdbTestModelDatabase close];
}

- (NSArray<FmdbTestModel *> *)getAllData{
    NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@;", _tableName];
    FMResultSet *set = [personDatabase executeQuery:querySql];
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    while ([set next]) {
        FmdbTestModel *fmdbTestModel = [[FmdbTestModel alloc] init];
        fmdbTestModel.privateJobId = [set stringForColumn:@"privateJobId"];
        fmdbTestModel.icon = [set stringForColumn:@"icon"];
        fmdbTestModel.createdAt = [set stringForColumn:@"createdAt"];
        fmdbTestModel.canClick = [set longForColumn:@"canClick"];
        
        [dataArray addObject:fmdbTestModel];
    }
    
    return dataArray.copy;
    
    [personDatabase close];
}

@end
