

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface __SQLiteManager : NSObject

/// 单例
+ (instancetype)sharedSQLiteManager;

/// 打开数据库，如果没有数据库那么就会自动创建一个
///
/// @param dbName 数据库所在路径
///
/// @return 打开数据库是否成功
- (BOOL)openDBWithName:(NSString *)dbName;

/// 执行sqlite 语句
///
/// @param sql sql 语句
///
/// @return 执行sql 语句是否成功
- (BOOL)execSQLiteWithSql:(NSString *)sql;

/// 查找数据库
///
/// @param sql       sql 语句
/// @param queryTerm 筛查的条件
/// queryTerm 筛查的条件 说明：
/// ① id：外部筛查出来 返回的数据
/// ② sqlite3_stmt *stmt：查询结果

/******* 这段代码事例由外部block 传进来控制
 KKHistoriesModel *historiesModel = [[KKHistoriesModel alloc] init];
 
 sqlite3_column_xxxx函数：它用来读取数据行中不同类型的数据，该函数的返回值就是读取到得数据内容，
 该函数需要2个参数，第一个参数是存放数据的stmt，第二个参数是数据列下标
 
 historiesModel.histories = [NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 1)];
 historiesModel.speakCount = sqlite3_column_int(stmt, 2);
 */
///
/// @return 筛查出来的数据数组，如果返回的数组为nil， 证明查找失败
- (NSArray *)execQueryWithSql:(NSString *)sql queryTerm:(id (^)(sqlite3_stmt *stmt))queryTerm;

@end


