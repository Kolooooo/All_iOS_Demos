

/**
 这种类型的设计模式属于创建型模式，它提供了一种创建对象的最佳方式。
 在工厂模式中，我们在创建对象时不会对客户端暴露创建逻辑，并且是通过使用一个共同的接口来指向新创建的对象。
 */


#import <Foundation/Foundation.h>
#import "Animal.h"

@interface AnimalFactory : NSObject

+ (Animal *_Nullable)animalWithClass:(AnimalClass)animalClass;

@end
