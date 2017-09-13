






#import "AFHTTPSessionManager.h"

@interface CZHTTPManager : AFHTTPSessionManager

///  单例管理网络
+ (instancetype)shareManager;

/// BOOL result 如果成功就是YES ,id responseObj 如果成功就返回JSON/xml ，如果失败返回错误信息
- (void)GET:(NSString *)path params:(id)params complete:(void(^)(BOOL result,id responseObj))comlete;

/// BOOL result 如果成功就是YES ,id responseObj 如果成功就返回JSON/xml ，如果失败返回错误信息
- (void)POST:(NSString *)path params:(id)params complete:(void(^)(BOOL result,id responseObj))comlete;

@end
