

#import "NSManagedObject+KEN.h"
#import "__CoreDataManager.h"

@implementation NSManagedObject (KEN)

+ (NSString *)entityName{
    return NSStringFromClass([self class]);
}


+ (instancetype)insertNewObject{
    // 使用默认context
    return [self insertNewObjectWithContext:[__CoreDataManager sharedInstance].managedObjectContext];
}


+ (instancetype)insertNewObjectWithContext:(NSManagedObjectContext *)context{
    // 使用自定义的context
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:context];
}

- (void)save{
    [[__CoreDataManager sharedInstance] saveContext];
}

@end
