






#import "CZHTTPManager.h"

/// 基础URL
#define CZBaseURL [NSURL URLWithString:@"http://localhost/"]

@implementation CZHTTPManager

///  单例管理网络
+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    static CZHTTPManager *instace;
    dispatch_once(&onceToken, ^{
        
        // config可以用来配置超时
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        // config请求超时设置为15s
        config.timeoutIntervalForRequest = 15;
        
        instace.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"plant/html",nil];
        
        instace = [[self alloc]initWithBaseURL:CZBaseURL sessionConfiguration:config];
        
    });
    
    return instace;
}

///  自定义的GET请求方法
///
///  @param path    请求的路径
///  @param params  参数列表
///  @param comlete 完成的回调
- (void)GET:(NSString *)path params:(id)params complete:(void (^)(BOOL, id))comlete {
    
    ///  GET请求方法
    ///
    ///  @param progress       请求进度
    ///  @param task           ？？？？
    ///  @param responseObject 请求回来的对象
    ///
    ///  @return ？？？
    [self GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        comlete(YES, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        comlete(NO,error);
    }];
    
}

///  自定义的POST请求方法
///
///  @param path    请求的路径
///  @param params  参数列表
///  @param comlete 完成的回调
- (void)POST:(NSString *)path params:(id)params complete:(void (^)(BOOL, id))comlete {
    
    ///  POST请求方法
    ///
    ///  @param progress       请求进度
    ///  @param task           ？？？？
    ///  @param responseObject 请求回来的对象
    ///
    ///  @return ？？？
    [self POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        comlete(YES, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        comlete(NO,error);
    }];
    
}
@end
