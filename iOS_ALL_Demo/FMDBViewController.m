//
//  FMDBViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/10/21.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "FMDBViewController.h"
#import <FMDB/FMDB.h>
#import "__FMDBManager.h"
#import <MJExtension/MJExtension.h>
#import "fmdbTestModel.h"

@interface FMDBViewController ()

@property (nonatomic, strong) NSString  *databaseName;

@end

@implementation FMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initRequest];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _databaseName = @"Person.db";
    NSString *tableName = @"PersonTabel";
    
    
    __FMDBManager *personDatabase = [__FMDBManager __sharedInstanceWithDatabaseName:_databaseName];
    
    
#pragma mark 创建表
    NSString *createTableSql =
    [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER);", tableName];
    [personDatabase __createTableWithName:tableName sql:createTableSql];
    
#pragma mark 插入数据
    [personDatabase open];
    
    NSString *insertSql =
    [NSString stringWithFormat:@"INSERT INTO %@ (name, age) VALUES (?, ?);", tableName];
    BOOL isInsertSuccess = [personDatabase executeUpdate:insertSql, @"Ken", @(24)];
    BOOL isInsertSuccess1 = [personDatabase executeUpdate:insertSql, @"Kenny", @(23)];
    BOOL isInsertSuccess2 = [personDatabase executeUpdate:insertSql, @"KenAndKenny", @(25)];
    if (!isInsertSuccess || !isInsertSuccess1 || !isInsertSuccess2) {
        [personDatabase close];
        NSLog(@"insert data error -> %@", personDatabase.lastErrorMessage);
        NSAssert(NO, @"insert data error");
        return;
    }
    
#pragma mark 修改数据
    NSString *updateSql = [NSString stringWithFormat:@"UPDATE %@ SET name = ? WHERE _id = ?", tableName];
    BOOL isUpdateSuccess = [personDatabase executeUpdate:updateSql, @"updateName", @(3)];
    if (!isUpdateSuccess) {
        [personDatabase close];
        NSLog(@"update data error -> %@", personDatabase.lastErrorMessage);
        NSAssert(NO, @"update data error");
        return;
    }
    
#pragma mark 删除数据
    NSString *deleteSql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE _id = ?", tableName];
    BOOL isDeleteSuccess = [personDatabase executeUpdate:deleteSql, @(3)];
    if (!isDeleteSuccess) {
        [personDatabase close];
        NSLog(@"delete data error -> %@", personDatabase.lastErrorMessage);
        NSAssert(NO, @"delete data error");
        return;
    }
    
#pragma mark 查询数据
    NSString *querySql = [NSString stringWithFormat:@"SELECT _id, name, age FROM %@;", tableName];
    FMResultSet *set = [personDatabase executeQuery:querySql];
    
    while ([set next]) {
        NSString *name = [set stringForColumn:@"name"];
        NSInteger _id = [set longForColumn:@"_id"];
        NSInteger age = [set longForColumn:@"age"];
        
        NSLog(@"%@, %@, %@", @(_id), name, @(age));
    }
    
    [personDatabase close];
}

- (void)initRequest{
    [__AFNManager __requestWithType:__GET urlString:@"/fmdb" parameters:nil complete:^(BOOL isSuccess, id result, NSError *error) {
        if (isSuccess) {
            NSLog(@"request success");
            NSArray<FmdbTestModel *> *fmdbTestModels = [FmdbTestModel mj_objectArrayWithKeyValuesArray:result[@"data"][@"list"]];
            
            for (FmdbTestModel *model in fmdbTestModels) {
                [[FmdbTestModel sharedInstance] savaWithModel:model];
            }
        }
    }];
}

- (void)info{
    NSString* docsdir = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* dbpath = [docsdir stringByAppendingPathComponent:@"user.sqlite"];
    DEBUGLOG(@"%@", dbpath);
    
    
    /*
     * SQL 语句中除过 SELECT 语句都可以称之为更新操作。
     * 包括 CREATE，UPDATE，INSERT，ALTER，COMMIT，BEGIN，DETACH，DROP，END，EXPLAIN，VACUUM，REPLACE 等。
     * 一般只要不是以 SELECT 开头的 SQL 语句，都是更新语句。
     */
    FMDatabase* db = [FMDatabase databaseWithPath:dbpath]; // 建立数据库
    BOOL isOpenSuccess1 = [db open]; // 打开数据库
    if (!isOpenSuccess1) {
        DEBUGLOG(@"数据库打开错误");
        NSAssert(NO, @"数据库打开错误");
        return;
    }
    
    FMResultSet *rs = [db executeQuery:@"select * from people"]; // 执行sql 查询语句
    
    while ([rs next]) {
        DEBUGLOG(@"%@ %@",
                 [rs stringForColumn:@"firstname"],
                 [rs stringForColumn:@"lastname"]);
    }
    
    [db close]; // 关闭数据库
    
    // ---------
    
    /*
     FMDatabase 这个类是线程不安全的，在多线程中使用 FMDatabase 单例是极其错误的想法。
     不能在多线程的环境中对数据库 FMDatabase 进行读写，会出现奔溃或者异常，
     因为你不能保证你读数据的同时另外一条线程不在写数据。
     使用 FMDatabaseQueue 线程安全
     */
    // 创建 FMdatabaseQueue 示例
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:dbpath];
    
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:1]];
        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:2]];
        [db executeUpdate:@"INSERT INTO myTable VALUES (?)", [NSNumber numberWithInt:3]];
        
        FMResultSet *rs = [db executeQuery:@"select * from foo"];
        while ([rs next]) {
            // ...
        }
    }];
}

@end
