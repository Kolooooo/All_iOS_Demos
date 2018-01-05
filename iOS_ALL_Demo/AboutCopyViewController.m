//
//  AboutCopyViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/11/2.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "AboutCopyViewController.h"

@interface AboutCopyViewController ()

@property (nonatomic, strong) NSMutableArray *mutableArray;
//@property (nonatomic, copy) NSMutableArray *mutableArray;

@end

@implementation AboutCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self noMutableNSString];
    [self mutableNSString];
    [self text];
    
    /*
     copy 此特质所表达的所属关系与 strong 类似。然而设置方法并不保留新值，而是将其“拷贝” (copy)。 当属性类型为 NSString 时，经常用此特质来保护其封装性，因为传递给设置方法的新值有可能指向一个 NSMutableString 类的实例。这个类是 NSString 的子类，表示一种可修改其值的字符串，此时若是不拷贝字符串，那么设置完属性之后，字符串的值就可能会在对象不知情的情况下遭人更改。所以，这时就要拷贝一份“不可变” (immutable)的字符串，确保对象中的字符串值不会无意间变动。只要实现属性所用的对象是“可变的” (mutable)，就应该在设置新属性值时拷贝一份。
     
     用 @property 声明 NSString、NSArray、NSDictionary 经常使用 copy 关键字，是因为他们有对应的可变类型：NSMutableString、NSMutableArray、NSMutableDictionary，他们之间可能进行赋值操作，为确保对象中的字符串值不会无意间变动，应该在设置新属性值时拷贝一份。
     
     该问题在下文中也有论述：用@property声明的NSString（或NSArray，NSDictionary）经常使用copy关键字，为什么？如果改用strong关键字，可能造成什么问题？
     */
    
    /*
     * 准则
     * No1：可变对象的copy和mutableCopy方法都是深拷贝（区别完全深拷贝与单层深拷贝）。
     * No2：不可变对象的copy方法是浅拷贝，mutableCopy方法是深拷贝。
     * No3：copy方法返回的对象都是不可变对象。
     */
    
    /* 结论
     * NSString NSDictionary NSArray 都应该用 copy 修饰
     * NSMutableString NSMutableDictionary NSMutableArray 都应该用 strong 修饰
     */
}

- (void)text{
    NSArray *array = [NSArray array];
    self.mutableArray = [array mutableCopy];
    DEBUGLOG(@"%p, %p", array, self.mutableArray);
    
    [self.mutableArray addObject:@"ken"];
    DEBUGLOG(@"%@", self.mutableArray);
    
    NSMutableString *stringM = [NSMutableString string];
}

- (void)noMutableNSString{
    NSString *str1 = @"test001";
    
    NSMutableString *str2 = [str1 copy]; //copy返回的是不可变对象
    //copy返回的是不可变对象，str2不能被修改，因此会发生崩溃
    //[str2 appendString:@"test"];
    
    NSMutableString *str3 = [str1 mutableCopy];
    [str3 appendString:@"++"];
    
    NSLog(@"str1:%p - %@", str1, str1); //tr1:0x105e1ad48 - test001
    NSLog(@"str2:%p - %@", str2, str2); //str2:0x105e1ad48 - test001
    NSLog(@"str3:%p - %@", str3, str3); //str3:0x7ff563023fe0 - test001++
    
    /*
     * 分析：str1、str2地址相同并且与str3地址不同，NSString的copy是浅拷贝，且copy返回的对象是不可变对象；
           mutableCopy是深拷贝。
     */
}

- (void)mutableNSString{
    NSMutableString *mstr1 = [NSMutableString stringWithString:@"test002"];
    
    NSMutableString *mstr2 = [mstr1 copy];
    //copy返回的是不可变对象，mstr2不能被修改，因此会发生崩溃
    //[str2 appendString:@"test"];
    
    NSMutableString *mstr3 = [mstr1 mutableCopy];
    [mstr3 appendString:@"++"];
    
    NSLog(@"mstr1:%p - %@",mstr1,mstr1); //mstr1:0x7fb2f968bb40 - test002
    NSLog(@"mstr2:%p - %@",mstr2,mstr2); //mstr2:0x7fb2f968a9e0 - test002 
    NSLog(@"mstr3:%p - %@",mstr3,mstr3); //mstr3:0x7fb2f968aa00 - test002++
    
    /*
     * 分析：mstr1、mstr2、mstr3 地址都不同，NSMutableString对象copy与mutableCopy都是深拷贝，
           且copy返回的对象是不可变对象。
     */
}

@end
