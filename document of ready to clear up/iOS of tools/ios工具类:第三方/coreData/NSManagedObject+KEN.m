








#import "NSManagedObject+KEN.h"

@implementation NSManagedObject (KEN)

+ (NSString *)entityName
{
    return NSStringFromClass([self class]);
}


+ (instancetype)insertNewObject
{
    // 使用默认context
    return [self insertNewObjectWithContext:[CZCoreDataManager sharedInstance].managedObjectContext];
}


+ (instancetype)insertNewObjectWithContext:(NSManagedObjectContext *)context
{
    // 使用自定义的context
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:context];
}


- (void)save
{
    [[CZCoreDataManager sharedInstance] saveContext];
}

@end
