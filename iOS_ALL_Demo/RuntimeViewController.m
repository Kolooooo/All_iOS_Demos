

#import "RuntimeViewController.h"
#import "UIButton+__Category.h"

@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self showTheMethod];
}

- (void)showTheMethod{
    [self.class __exchangeMethodWithOriginSEL:@selector(origin) exchangeSEL:@selector(exchange)];
    [self origin];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.objectID = @"ken_button";
    DEBUGLOG(@"%@", button.objectID);
    
    
    // @selector() 就是取类方法的编号。
    SEL methodId = @selector(func1);
    // IMP怎么获得和使用
    IMP methodPoint = [self methodForSelector:methodId];
    methodPoint();
}

- (void)func1{
    NSLog(@"func1");
}

- (void)methodId{
    NSLog(@"%s", __func__);
}

- (void)origin{
    DEBUGLOG(@"%s", __func__);
}

- (void)exchange{
    DEBUGLOG(@"%s", __func__);
}

- (void)initUI{
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *runtimeButton = ({
        UIButton *runtimeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        runtimeButton.backgroundColor = [UIColor orangeColor];
        runtimeButton.frame = CGRectMake(100, 100, 100, 100);
        runtimeButton;
    });
    
    
    [self.view addSubview:runtimeButton];
    
    
    [runtimeButton addTarget:self action:@selector(touchRuntimeButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchRuntimeButton:(UIButton *)button{
    NSLog(@"touchRuntimeButton");
}

@end
