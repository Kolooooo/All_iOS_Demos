

/**
 *  作用：将文件上传到服务器
 */

#import <Foundation/Foundation.h>

@interface FileDataToServer : NSObject

/**
 *  将文件上传到服务器
 *
 *  @param fileDatas 文件二进制数据，key 是 文件名，value 是文件的二进制数据
 *  @param fieldName 文件上传到后台的字段
 *  @param params    其他的参数，key 后台给的参数名字，value 就是参数的值
 *  @param boundary  分割线
 *
 *  @return 返回文件的二进制数据
 */
+ (NSData *)dataWithFileDatas:(NSDictionary *)fileDatas fileldName:(NSString *)fieldName params:(NSDictionary *)params boundary:(NSString *)boundary ;

@end
