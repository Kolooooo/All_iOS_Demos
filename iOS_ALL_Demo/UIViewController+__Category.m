

#import "UIViewController+__Category.h"

@implementation UIViewController (__Category)

- (PushType)__pushTypeOfCurrentViewController{
    NSArray *viewcontrollers = self.navigationController.viewControllers;
    if (viewcontrollers.count > 1){
        if ([viewcontrollers objectAtIndex:viewcontrollers.count - 1] == self){
            //push方式
            return PushTypePush;
        }
    }else{
        //present方式
        return PushTypePresent;
    }
    return PushTypeNone;
}

+ (__kindof UIViewController * _Nonnull)__viewControllerWithStoryboardName:(NSString *_Nonnull)storyboardName identifier:(NSString *_Nonnull)identifier{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:identifier];
}

- (void)__takeThePhone:(NSString *_Nonnull)phoneNumber{
    if ([phoneNumber __isValidateMobile] == NO) {
        return;
    }
    
    NSMutableString * str = [[NSMutableString alloc] initWithFormat:@"tel:%@",phoneNumber];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}

@end
