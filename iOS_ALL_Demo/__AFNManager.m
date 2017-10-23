

#import "__AFNManager.h"

@implementation __AFNManager

+ (void)__requestWithType:(__AFNManagerRequestType)requestType
                urlString:(NSString *)urlString
               parameters:(id)parameters
                 complete:(void (^)(BOOL isSuccess, id result, NSError *error))comlete
{
    __AFNManager *afnManager = [self shareManager];
    
    switch (requestType) {
        case __GET:{
            [afnManager GET:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task,
                                                                      id  _Nonnull responseObject)
             {
                 if (comlete) {
                     comlete(YES, responseObject, nil);
                 }
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 if (comlete) {
                     comlete(NO, nil, error);
                 }
             }];
            
            break;
        }
        case __POST:{
            
            break;
        }
        case __PUT:{
            
            break;
        }
        case __DELETE:{
            
            break;
        }
            
        default:
            break;
    }
}

+ (NSURL *)baseURL{
    return [NSURL URLWithString:@"http://www.1111-1.com"];
}

///  单例管理网络
+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    static __AFNManager *instance;
    dispatch_once(&onceToken, ^{
        
        // config可以用来配置超时
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        // config请求超时设置为15s
        config.timeoutIntervalForRequest = 15;
        
        instance.responseSerializer.acceptableContentTypes =
        [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"plant/html", nil];
        
        instance = [[self alloc]initWithBaseURL:[self baseURL] sessionConfiguration:config];
        
    });
    
    return instance;
}

///  自定义的GET请求方法
///
///  @param path    请求的路径
///  @param params  参数列表
///  @param comlete 完成的回调
//- (void)GET:(NSString *)path params:(id)params complete:(void (^)(BOOL, id))comlete {
//    
//    [self GET:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task,
//                                               id  _Nonnull responseObject)
//     {
//         comlete(YES, responseObject);
//     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//         comlete(NO,error);
//     }];
//    
//}

///  自定义的POST请求方法
///
///  @param path    请求的路径
///  @param params  参数列表
///  @param comlete 完成的回调
//- (void)POST:(NSString *)path params:(id)params complete:(void (^)(BOOL, id))comlete {
//    
//    [self POST:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task,
//                                                id  _Nonnull responseObject)
//     {
//         comlete(YES, responseObject);
//     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//         comlete(NO,error);
//     }];
//    
//}

@end
