

#import "__CoreDataManager.h"

@implementation __CoreDataManager

+ (instancetype)sharedInstance {
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

/// 快速获取Documents的URL
- (NSURL *)applicationDocumentsURL{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
}

- (NSManagedObjectContext *)managedObjectContext{

    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    //实例化 ConcurrencyType:并发类型
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    //指定存储调度器
    _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    
    //实例化
    
    //编译完,Model.xcdatamodeld文件会被编译成Model.momd文件,存在mainBundle里,直接去加载
//    NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
//    
//    //从模型描述文件里初始化出对象
//    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelUrl];
    
    
    //从指定的bundle合并模型描述文件 来创建 Bundles:nil 就是从mainBundle来合并
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator{

    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    //实例化 指定对象管理模型
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    
    //添加存储器 Type:存储类型 configuration: URL:存储的文件路径 options:
    
    //要存储的文件URL
    NSURL *fileURL = [[self applicationDocumentsURL] URLByAppendingPathComponent:@"myData.db"];
    [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:fileURL options:nil error:nil];

    
    return _persistentStoreCoordinator;
}

- (void)saveContext{
    [self.managedObjectContext save:nil];
}


@end
