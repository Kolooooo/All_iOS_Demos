

#import <Foundation/Foundation.h>

@interface NSFileManager (__Category)

#pragma mark - get the path
/// 获取应用沙盒根路径
+ (NSString *_Nonnull)__home;

/// 获取Documents目录路径
+ (NSString *_Nonnull)__documentPath;

/// 获取Library目录路径
+ (NSString *_Nonnull)__libraryPath;

/// 获取Cache目录路径
+ (NSString *_Nonnull)__cachePath;

/// 获取Tmp目录路径
+ (NSString *_Nonnull)__tmpPath;

#pragma mark - file manager
/**
 创建文件夹

 @param documentName 文件夹名字
 @return 是否创建成功
 */
- (BOOL)__createDocumentWithDocumentName:(NSString *_Nonnull)documentName;

/**
 创建文件

 @param documentPath 文件夹路径
 @param fileName 文件名字
 @param fileType 文件格式，不用带"."
 @return 是否创建成功
 */
- (BOOL)__createFileWithDocumentPath:(NSString *_Nullable)documentPath fileName:(NSString *_Nullable)fileName fileType:(NSString *_Nullable)fileType;

/**
 将NSString 数据写入文件

 @param filePath 文件路径
 @param contant  NSString 内容
 @return 是否写入成功
 */
- (BOOL)__writeFileWithFilePath:(NSString *_Nullable)filePath contant:(NSString *_Nullable)contant;

/**
 读取NSString 文件

 @param filePath 文件路径
 @return 返回的NSString 对象
 */
- (NSString *_Nonnull)__loadFileWithFilePath:(NSString *_Nullable)filePath;

/**
 删除文件

 @param filePath 文件路径
 @return 是否删除成功
 */
- (BOOL)__deleteFileWithFilePath:(NSString *_Nullable)filePath;

@end
