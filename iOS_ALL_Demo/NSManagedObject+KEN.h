

/*========================= NSManagedObject 常规操作的封装 =========================*/

#import <CoreData/CoreData.h>

@interface NSManagedObject (KEN)

///  快速获得实体名
///
///  @return 实体名
+ (NSString *)entityName;


///  快速创建可被管理的对象, 使用默认的context
///
///  @return 可被管理的对象
+ (instancetype)insertNewObject;


///  快速创建可被管理的对象
///
///  @param context 指定被哪个context管理
///
///  @return 可被管理的对象
+ (instancetype)insertNewObjectWithContext:(NSManagedObjectContext *)context;


///  快速保存(使用的默认的context)
- (void)save;

@end
