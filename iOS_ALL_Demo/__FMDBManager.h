

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

@interface __FMDBManager : FMDatabase

@property (nonatomic, copy) NSString *_Nullable __tableName;

+ (instancetype _Nonnull)__sharedInstanceWithDatabaseName:(NSString *_Nullable)databaseName;

- (BOOL)__createTableWithName:(NSString *_Nullable)tableName
                          sql:(NSString *_Nullable)sql;

@end
