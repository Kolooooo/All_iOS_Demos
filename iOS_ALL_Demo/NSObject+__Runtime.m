

#import "NSObject+__Runtime.h"

@implementation NSObject (__Runtime)

#pragma mark 交换方法例子：

/*
 + (void)load{
 [UIImage __exchangeMethodWithOriginSEL:@selector(imageNamed:) exchangeSEL:@selector(imageWithName:)];
 }
 
 // 既能加载图片又能打印
 + (instancetype)imageWithName:(NSString *)name{
 // 这里调用imageWithName，相当于调用imageName
 UIImage *image = [self imageWithName:name];
 
 if (image == nil) {
 NSLog(@"加载空的图片");
 }
 
 return image;
 }
 */
+ (void)__exchangeInstanceMethodWithOriginSEL:(SEL _Nonnull)originSEL
                          exchangeSEL:(SEL _Nonnull)exchangeSEL{
    
    Method originMethod = class_getInstanceMethod(self, originSEL);
    Method changeMethod = class_getInstanceMethod(self, exchangeSEL);
    
    // 方法交换应该被保证，在程序中只会执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //首先动态添加方法，实现是被交换的方法，返回值表示添加成功还是失败
        BOOL isAddSuccess = class_addMethod(self,
                                            originSEL,
                                            method_getImplementation(changeMethod),
                                            method_getTypeEncoding(changeMethod));
        
        if (isAddSuccess) {
            //如果成功，说明类中不存在这个方法的实现
            //将被交换方法的实现替换到这个并不存在的实现
            class_replaceMethod(self,
                                exchangeSEL,
                                method_getImplementation(originMethod),
                                method_getTypeEncoding(originMethod));
        }
        else{
            //否则，交换两个方法的实现
            method_exchangeImplementations(originMethod, changeMethod);
        }
        
    });
}

+ (void)__exchangeClassMethodWithOriginSEL:(SEL _Nonnull)originSEL exchangeSEL:(SEL _Nonnull)exchangeSEL
{
    // class_getClassMethod：得到类的类方法
    Method otherMehtod = class_getClassMethod(self, exchangeSEL);
    Method originMehtod = class_getClassMethod(self, originSEL);
    // 交换2个方法的实现
    // method_exchangeImplementations：运行时动态交换两个方法
    method_exchangeImplementations(otherMehtod, originMehtod);
}

- (void)__logIvarList{
#ifdef DEBUG
    
    
    unsigned int count;
    Class cls = self.class;
    
    // 获取cls 类的实例变量列表
    Ivar *ivarList = class_copyIvarList(cls, &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        NSLog(@"%s", ivar_getName(ivar));
    }
    
    free(ivarList);
    
    
#else
    return;
#endif
}

- (void)__logPropertyList{
#ifdef DEBUG
    
    
    unsigned int count;
    Class cls = self.class;
    
    // 获取cls 类的属性变量列表
    objc_property_t *propertyList = class_copyPropertyList(cls, &count);
    for (int i = 0; i < count; i++) {
        objc_property_t objc_property = propertyList[i];
        NSLog(@"%s", property_getName(objc_property));
    }
    
    free(propertyList);
    
    
#else
    return;
#endif
}

- (void)__logMethodList{
#ifdef DEBUG
    
    
    unsigned int count;
    Class cls = self.class;
    
    // get the method of the cls
    Method *methodList = class_copyMethodList(cls, &count);
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"%@", NSStringFromSelector(method_getName(method)));
    }
    
    free(methodList);
    
    
#else
    return;
#endif
}

- (Method _Nonnull)__getClassMethod:(SEL _Nonnull)sel{
    Class cls = self.class;
    
    // get the class method of cls class
    Method method = class_getClassMethod(cls, sel);
    
    return method;
}

- (Method _Nonnull)__getInstanceMethod:(SEL _Nonnull)sel{
    Class cls = self.class;
    
    // get the instance method of cls class
    Method method = class_getInstanceMethod(cls, sel);
    
    return method;
}

- (BOOL)__addMethod:(SEL _Nonnull)addSel{
    Class cls = self.class;
    Method cusMethod = class_getInstanceMethod(cls, addSel);
    
    // 添加方法 类 方法名称 方法实现 方法类型
    BOOL isSuccess = class_addMethod(cls,
                                     addSel,
                                     method_getImplementation(cusMethod),
                                     method_getTypeEncoding(cusMethod));
    
    return isSuccess;
}

- (void)set__ObjectID:(NSString *)__ObjectID{
    /// @selector(objectID): 属性关联的key，也可以定义一个char * ;
    objc_setAssociatedObject(self, @selector(__objectID), __ObjectID, OBJC_ASSOCIATION_COPY);
    
    /* 或：
     * static const char *OBJECT_ID = "objectID";
     * objc_setAssociatedObject(self, OBJECT_ID, objectID, OBJC_ASSOCIATION_COPY);
     */
}

- (NSString *)__objectID{
    return objc_getAssociatedObject(self, @selector(__objectID));
    
    /* 或：
     * static const char *OBJECT_ID = "objectID";
     * return objc_getAssociatedObject(self, OBJECT_ID);
     */
}

@end


#pragma mark 发送消息
/*
 // 创建person对象
 Person *p = [[Person alloc] init];
 
 // 调用对象方法
 [p eat];
 
 // 本质：让对象发送消息
 objc_msgSend(p, @selector(eat));
 
 // 调用类方法的方式：两种
 // 第一种通过类名调用
 [Person eat];
 // 第二种通过类对象调用
 [[Person class] eat];
 
 // 用类名调用类方法，底层会自动把类名转换成类对象调用
 // 本质：让类对象发送消息
 objc_msgSend([Person class], @selector(eat));
 */
