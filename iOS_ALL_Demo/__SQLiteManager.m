

#import "__SQLiteManager.h"
// #import "KKHistoriesModel.h"

/*
 * General -> Linked Framworks and Libraries -> Add (libsqlite3.0.tbd)
 *
 * 数据库操作:
 *   1.打开数据库
 *   2.创建表
 *   3.操作数据
 */

@interface __SQLiteManager()

@end

@implementation __SQLiteManager{
    /// 数据库句柄
    sqlite3 *db;
}

#pragma mark - Public method
+ (instancetype)sharedSQLiteManager{
    static dispatch_once_t onceToken;
    static __SQLiteManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [__SQLiteManager allocWithZone:nil];
    });
    return instance;
}

#pragma mark 打开或者创建数据库
- (BOOL)openDBWithName:(NSString *)dbName{
    /// 得到数据库文件地址，这是一个拼接的地址字符串，是沙盒路径下面dbName 文件，
    /// 这个文件名可以随便取名字，后缀最好是db啊或者sqlite这种，用来表示这是一个数据库文件
    NSString *dbPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:[NSString stringWithFormat:@"/%@", dbName]];
    NSLog(@"dbPath = %@", dbPath);
    
    /*
     sqlite3_open是我们接触到的第一条sqlite3语句，它的作用时打开数据库连接，
     如果有数据库文件就打开它，没有就重新创建数据库，这个方法有一个枚举的返回值表示是否正常打开了数据库，
     我用int的变量status去接收了这个值，后面会进行判断。
     sqlite3_open有两个参数
     ① 第一个参数是数据库文件的路径
     ② 第二个参数是一个数据库的引用，即一个sqlite3*类型的引用;
     
     filename.UTF8String:filename本身是oc的字符串类型
     但是sqlite3_open要求传递的是C类型的字符串
     所以，使用UTF8String将oc的字符串类型转换为C类型的字符串
     */
    int status = sqlite3_open(dbPath.UTF8String, &db);
    
    // 枚举值SQLITE_OK，代表成功的状态
    if (status == SQLITE_OK) {
        NSLog(@"打开数据库成功");
        return YES;
    }else{
        NSLog(@"打开数据库失败");
        NSAssert(NO, @"打开数据库失败");
        return NO;
    }
}

#pragma mark 执行SQLite 语句
- (BOOL)execSQLiteWithSql:(NSString *)sql{
    /// sqlite 语句创建表格
    const char *sql1 = sql.UTF8String;
    
    //保存错误信息的变量
    char *errMsg = nil;
    
    /*
     sqlite3_exec是我们接触到的第二个sqlite3语句，这个语句用于执行除了查询语句以外的其他语句.
     它有一个枚举类型的返回值，和sqlite3_open返回的枚举值一致，这里我并没有使用变量保存，因为我有其他形式来获得创建表是否成功。
     sqlite3_exec需要传递5个参数
     ① 第一个参数是数据库引用即sqlite3* db 句柄
     ② 第二个参数是要执行的sql语句,
     ③ 第三个参数是执行完sql语句后要执行的函数
     ④ 第四个参数是执行完sql语句后要执行的函数的参数
     ⑤ 第五个参数是执行完sql语句后的报错信息。
     */
    sqlite3_exec(db, sql1, NULL, NULL, &errMsg);
    
    //如果存在报错信息，代表语句执行失败，比判断枚举值要更简单一些
    if(errMsg){
        //打印错误信息
        NSLog(@"创建表失败 -> %s", errMsg);
        NSAssert(NO, @"创建表失败");
        return NO;
    }else{
        NSLog(@"创建表成功");
        return YES;
    }
}

#pragma mark 查询数据
- (NSArray *)execQueryWithSql:(NSString *)sql queryTerm:(id (^)(sqlite3_stmt *stmt))queryTerm{
    //查询sql语句
    const char *sql1 = sql.UTF8String;
    
    //stmt用来取出查询结果
    sqlite3_stmt *stmt = NULL;
    
    /*
     sqlite3_prepare_v2函数是准备要执行sql查询的一个函数，
     可以当做这个函数就是用来做sql查询之前的准备工作的，
     它也是返回一个枚举作为准备工作的结果，SQLITE_OK则代表准备工作ok
     sqlite3_prepare_v2需要传入5个参数
     ① 第一个参数是数据库引用即（sqlite3* _shop）
     ② 第二个参数是要执行的sql语句
     ③ 第三个参数是sql语句的长度
     ④ 第四个参数是查询结果stmt的引用，查询完成后，查询结果将会存入该引用
     ⑤ 第五个参数是指向无法使用的部分的指针，一般不会用到，给NULL就可以了
     */
    int status = sqlite3_prepare_v2(db, sql1, -1, &stmt, NULL);
    
    
    NSMutableArray *returnArrray = [NSMutableArray array];
    //准备成功，SQL语句正确
    if(status == SQLITE_OK){
        /*
         sqlite3_step(stmt)函数将会执行查询并且将查询到的当前记录存入到stmt（sqlite3_stmt * 类型）中
         第一次执行sqlite3_step(stmt)将会将表中的第一条数据存入到stmt中，
         第二次执行sqlite3_step(stmt)将会把表中的第二条记录存入到stmt中
         也就是说，while(sqlite3_step(stmt)==SQLITE_ROW)将会一条一条的去读取表中的记录，
         而SQLITE_ROW枚举判断的是有读取到数据行的情况
         */
        // 成功指向一条记录
        while(sqlite3_step(stmt) == SQLITE_ROW){
            
            /******* 这段代码事例由外部block 传进来控制
             KKHistoriesModel *historiesModel = [[KKHistoriesModel alloc] init];
             
             sqlite3_column_xxxx函数：它用来读取数据行中不同类型的数据，该函数的返回值就是读取到得数据内容，
             该函数需要2个参数，第一个参数是存放数据的stmt，第二个参数是数据列下标
             
             historiesModel.histories = [NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 1)];
             historiesModel.speakCount = sqlite3_column_int(stmt, 2);
             */
            
            id obj = queryTerm(stmt);
            [returnArrray addObject:obj];
        }
        return returnArrray.copy;
    }
    return nil;
}

@end
