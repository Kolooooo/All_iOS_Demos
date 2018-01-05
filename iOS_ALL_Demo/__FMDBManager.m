

#import "__FMDBManager.h"

@implementation __FMDBManager

#pragma mark - public method
+ (instancetype _Nonnull)__sharedInstanceWithDatabaseName:(NSString *_Nullable)databaseName{
    static __FMDBManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self __createDatabaseWithName:databaseName];
    });
    return sharedInstance;
}

- (BOOL)__createTableWithName:(NSString *_Nullable)tableName sql:(NSString *_Nullable)sql{
    if (!sql || sql.length == 0) {
        NSAssert(NO, @"not have sql");
        return NO;
    }
    
    BOOL isSuccess = [self open];
    if (!isSuccess) {
        NSAssert(NO, @"_fmDatabase open error");
        return NO;
    }
    
    self.__tableName = tableName;
   
    BOOL isCreateSuccess = [self executeUpdate:sql];
    if (isCreateSuccess) {
        NSLog(@"create Tabel Success");
        [self close];
        return YES;
    }else{
        NSLog(@"create Tabel Fail:%@", self.lastErrorMessage); // 打印错误信息
        NSAssert(NO, @"create Tabel Fail");
        [self close];
        return NO;
    }
}

#pragma mark - private method 
+ (instancetype _Nonnull)__createDatabaseWithName:(NSString *_Nullable)databaseName{
    if (!databaseName || databaseName.length == 0) {
        NSAssert(NO, @"not have databaseName");
        return [[self alloc] init];
    }
    
    NSString *dir =
    [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [dir stringByAppendingPathComponent:databaseName];
    NSLog(@"database path = %@", path);
    
    return [self databaseWithPath:path]; // 建立数据库
}

@end
