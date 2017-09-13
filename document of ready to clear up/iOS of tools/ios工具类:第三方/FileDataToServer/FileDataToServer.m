

#import "FileDataToServer.h"

@implementation FileDataToServer

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
+ (NSData *)dataWithFileDatas:(NSDictionary *)fileDatas fileldName:(NSString *)fieldName params:(NSDictionary *)params boundary:(NSString *)boundary {

    NSMutableData *dataM = [NSMutableData data];
    NSMutableString *strM = [NSMutableString stringWithFormat:@"--%@\r\n",boundary];

    //循环拼接文件的字符串，然后转换成二进制。
    [fileDatas enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [strM appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",fieldName,key];
        [strM appendFormat:@"Content-Type: application/octet-stream \r\n\r\n"];
        [dataM appendData:[strM dataUsingEncoding:NSUTF8StringEncoding]];
        [dataM appendData:obj];
        [strM setString:@"\r\n"];
        [strM appendFormat:@"--%@\r\n",boundary];
    }];
    
    //其他参数的循环拼接
    [params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSString *  _Nonnull obj, BOOL * _Nonnull stop) {
        [strM appendFormat:@"Content-Disposition: form-data; name=\"%@\" \r\n\r\n",key];
        [strM appendString:obj];
        [strM appendFormat:@"\r\n--%@",boundary];
    }];
    
    [strM appendString:@"--"];
    [dataM appendData:[strM dataUsingEncoding:NSUTF8StringEncoding]];

    return dataM.copy;
}

@end
