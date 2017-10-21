

#import "SQLiteManagerViewController.h"
#import "__SQLiteManager.h"
#import "KKHistoriesModel.h"
#import <sqlite3.h>

@interface SQLiteManagerViewController ()
<UITextViewDelegate>

#pragma mark - UI 属性
/// 输入框
@property (nonatomic, strong) UITextView  *writeTF;
/// 读音按钮
@property (nonatomic, strong) UIButton  *soundBtn;

@end

@implementation SQLiteManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareUI];
}

#pragma mark - 内部方法
- (void)touchSoundBtn{
    NSString *dbName = @"Histories.db";
    NSString *tbName = @"T_Histories";
    
    BOOL isCreateDB = [self createDBWithDBName:dbName];
    if (!isCreateDB) {
        return;
    }
    
    BOOL isCreateTable = [self createTableWithTbName:tbName];
    if (!isCreateTable) {
        return;
    }
    
    [self insetDataToSqlWithTbName:tbName];
    [self updateToSqlWithTbName:tbName];
    [self deleteToSqlWithTbName:tbName];
    [self queryToSqlWithTbName:tbName];
    [self insetManyDataToSqlWithTbName:tbName];
}

#pragma mark - 打开与创建数据库
- (BOOL)createDBWithDBName:(NSString *)dbName{
    BOOL isOpenDB = [[__SQLiteManager sharedSQLiteManager] openDBWithName:dbName];
    return isOpenDB;
}

#pragma mark - 创建表
-(BOOL)createTableWithTbName:(NSString *)tbName{
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, histories TEXT, speakCount INTEGER);", tbName];
    BOOL isCreated = [[__SQLiteManager sharedSQLiteManager] execSQLiteWithSql:sql];
    return isCreated;
}

#pragma mark - 数据操作
#pragma mark 插入数据
-(BOOL)insetDataToSqlWithTbName:(NSString *)tbName{
    NSString *insetSql = [NSString stringWithFormat:@"INSERT INTO %@ (histories, speakCount) VALUES ('%@', 1);", tbName, _writeTF.text];
    BOOL isSuccess = [[__SQLiteManager sharedSQLiteManager] execSQLiteWithSql:insetSql];
    return isSuccess;
}

#pragma mark 修改数据
-(BOOL)updateToSqlWithTbName:(NSString *)tbName{
    NSString *updateSql = [NSString stringWithFormat:@"UPDATE %@ SET histories = '%@' WHERE id = 1", tbName, _writeTF.text];
    BOOL isSuccess = [[__SQLiteManager sharedSQLiteManager] execSQLiteWithSql:updateSql];
    return isSuccess;
}

#pragma mark 删除数据
-(BOOL)deleteToSqlWithTbName:(NSString *)tbName{
    NSString *deleteSql = [NSString stringWithFormat:@"DELETE FROM %@ WHERE id = 1", tbName];
    BOOL isSuccess = [[__SQLiteManager sharedSQLiteManager] execSQLiteWithSql:deleteSql];
    return isSuccess;
}

#pragma mark 查询数据
-(void)queryToSqlWithTbName:(NSString *)tbName{
    NSString *querySql = [NSString stringWithFormat:@"SELECT id, histories, speakCount FROM %@;", tbName];
    NSArray *dbDatas =
    [[__SQLiteManager sharedSQLiteManager] execQueryWithSql:querySql queryTerm:^id(sqlite3_stmt *stmt){
        KKHistoriesModel *historiesModel = [[KKHistoriesModel alloc] init];
        historiesModel.histories = [NSString stringWithFormat:@"%s", sqlite3_column_text(stmt, 1)];
        historiesModel.speakCount = sqlite3_column_int(stmt, 2);
        return historiesModel;
    }];
    
    NSLog(@"dbDatas = %@", dbDatas);
}

#pragma mark 插入大批量数据
-(void)insetManyDataToSqlWithTbName:(NSString *)tbName{
    NSLog(@"开始插入数据");
    double start = CFAbsoluteTimeGetCurrent();
    // 显示开启事务
    [[__SQLiteManager sharedSQLiteManager] execSQLiteWithSql:@"BEGIN TRANSACTION"];
    for (int i = 0; i < 10000; i++) {
        NSString *manyInsetSql = [NSString stringWithFormat:@"INSERT INTO %@ (histories, speakCount) VALUES ('%d', 1);", tbName, i];
        // 当没有显示的开启事务,数据库会为每一条sql开启一个事务
        [[__SQLiteManager sharedSQLiteManager] execSQLiteWithSql:manyInsetSql];
        if (i == 1000) {
            NSLog(@"事务失败");
            // 事务回滚
            [[__SQLiteManager sharedSQLiteManager] execSQLiteWithSql:@"ROLLBACK"];
            break;
        }
    }
    // 提交事务
    [[__SQLiteManager sharedSQLiteManager] execSQLiteWithSql:@"COMMIT TRANSACTION"];
    double end = CFAbsoluteTimeGetCurrent();
    NSLog(@"消耗时间: %lf", end - start);
}

#pragma mark - 协议方法
#pragma mark UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView{
    NSLog(@"textView.text = %@", textView.text);
}

/// return 处理
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    // 判断输入的字是否是回车，即按下return
    if ([text isEqualToString:@"\n"]){
        // 在这里做你响应return键的代码，这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
        [self.writeTF resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma mark - 视图布局
-(void)prepareUI{
#pragma mark 视图样式
    _writeTF = [[UITextView alloc] init];
    CGFloat writeTFWidth = [UIScreen mainScreen].bounds.size.width - 40;
    _writeTF.frame = CGRectMake(20, 100, writeTFWidth, 100);
    _writeTF.layer.borderColor = [UIColor colorWithRed:1.0 green:0.8948 blue:0.0 alpha:1.0].CGColor;
    _writeTF.layer.borderWidth = 1;
    _writeTF.layer.cornerRadius = 5.0f;
    _writeTF.tintColor = [UIColor purpleColor];
    _writeTF.delegate = self;
    _writeTF.font = [UIFont systemFontOfSize:20.0f];
    
    
    _soundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _soundBtn.width = 100;
    _soundBtn.height = 50;
    _soundBtn.centerX = self.view.centerX;
    _soundBtn.centerY = self.view.centerY + 60;
    _soundBtn.backgroundColor = [UIColor colorWithRed:1.0 green:0.8948 blue:0.0 alpha:1.0];
    _soundBtn.layer.shadowColor = [UIColor colorWithRed:0.7361 green:0.6089 blue:0.0533 alpha:1.0].CGColor;
    _soundBtn.layer.shadowOffset = CGSizeMake(2, 2);
    _soundBtn.layer.shadowOpacity = 1;
    _soundBtn.layer.shadowRadius = 0;
    [_soundBtn setTitle:@"读音" forState:UIControlStateNormal];
    
    
#pragma mark 视图结构
    [self.view addSubview:_writeTF];
    [self.view addSubview:_soundBtn];
    
    
#pragma mark 视图行为
    [_soundBtn addTarget:self action:@selector(touchSoundBtn) forControlEvents:UIControlEventTouchUpInside];
}

@end
