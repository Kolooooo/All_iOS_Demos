

#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSUInteger, __AFNManagerRequestType) {
    __GET    = 0,
    __POST   = 1,
    __PUT    = 2,
    __DELETE = 3
};

@interface __AFNManager : AFHTTPSessionManager

/////  单例管理网络
//+ (instancetype)shareManager;
//
///// BOOL result 如果成功就是YES ,id responseObj 如果成功就返回JSON/xml ，如果失败返回错误信息
//- (void)GET:(NSString *)path params:(id)params complete:(void(^)(BOOL result,id responseObj))comlete;
//
///// BOOL result 如果成功就是YES ,id responseObj 如果成功就返回JSON/xml ，如果失败返回错误信息
//- (void)POST:(NSString *)path params:(id)params complete:(void(^)(BOOL result,id responseObj))comlete;

+ (void)__requestWithType:(__AFNManagerRequestType)requestType
                urlString:(NSString *)urlString
               parameters:(id)parameters
                 complete:(void (^)(BOOL isSuccess, id result, NSError *error))comlete;

@end
