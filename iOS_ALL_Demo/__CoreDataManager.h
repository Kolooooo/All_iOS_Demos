

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface __CoreDataManager : NSObject

/// 管理对象上下文
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
/// 管理对象模型
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
/// 持久化存储调度器
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

/// 单例
+ (instancetype)sharedInstance;
/// 保存上下文
- (void)saveContext;

@end
