

#import "NSFileManager+__Category.h"

@implementation NSFileManager (__Category)

+ (NSString *_Nonnull)__home{
    NSString *dirHome = NSHomeDirectory();
    DEBUGLOG(@"app_home: %@",dirHome);
    return dirHome;
}

+ (NSString *_Nonnull)__documentPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    DEBUGLOG(@"app_home_doc: %@",documentsDirectory);
    return documentsDirectory;
}

+ (NSString *_Nonnull)__libraryPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    DEBUGLOG(@"app_home_lib: %@",libraryDirectory);
    return libraryDirectory;
}

+ (NSString *_Nonnull)__cachePath{
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    DEBUGLOG(@"app_home_lib_cache: %@",cachePath);
    return cachePath;
}

+ (NSString *_Nonnull)__tmpPath{
    NSString *tmpDirectory = NSTemporaryDirectory();
    DEBUGLOG(@"app_home_tmp: %@",tmpDirectory);
    return tmpDirectory;
}

- (BOOL)__createDocumentWithDocumentName:(NSString *_Nonnull)documentName{
    NSString *documentsPath = [NSFileManager __documentPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:documentName];
    
    // 创建目录
    BOOL res = [fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    if (res) {
        DEBUGLOG(@"文件夹创建成功");
        return YES;
    }
    else{
        DEBUGLOG(@"文件夹创建失败");
        NSAssert(NO, @"文件夹创建失败");
        return NO;
    }
}

- (BOOL)__createFileWithDocumentPath:(NSString *_Nullable)documentPath fileName:(NSString *_Nullable)fileName fileType:(NSString *_Nullable)fileType{
    if (documentPath == nil || [documentPath isEqualToString:@""]){
        NSAssert(NO, @"documentPath is nil or emtity");
        return NO;
    }
    
    if (fileName == nil || [fileName isEqualToString:@""]){
        NSAssert(NO, @"fileName is nil or emtity");
        return NO;
    }
    
    if (fileType == nil || [fileType isEqualToString:@""]){
        NSAssert(NO, @"fileType is nil or emtity");
        return NO;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *file = [NSString stringWithFormat:@"%@.%@", fileName, fileType];
    NSString *testPath = [documentPath stringByAppendingPathComponent:file];
    BOOL res = [fileManager createFileAtPath:testPath contents:nil attributes:nil];
    
    if (res) {
        DEBUGLOG(@"文件创建成功");
        return YES;
    }
    else{
        DEBUGLOG(@"文件创建失败");
        NSAssert(NO, @"文件创建失败");
        return YES;
    }
}

- (BOOL)__writeFileWithFilePath:(NSString *_Nullable)filePath contant:(NSString *_Nullable)contant{
    if (filePath == nil || [filePath isEqualToString:@""]){
        NSAssert(NO, @"filePath is nil or emtity");
        return NO;
    }
    
    if (contant == nil || [contant isEqualToString:@""]){
        NSAssert(NO, @"contant is nil or emtity");
        return NO;
    }
    
    BOOL res = [contant writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (res) {
        DEBUGLOG(@"文件写入成功");
        return YES;
    }
    else{
        DEBUGLOG(@"文件写入失败");
        NSAssert(NO, @"文件写入失败");
        return YES;
    }
}

- (NSString *_Nonnull)__loadFileWithFilePath:(NSString *_Nullable)filePath{
    if (filePath == nil || [filePath isEqualToString:@""]){
        NSAssert(NO, @"filePath is nil or emtity");
        return @"";
    }
    
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    DEBUGLOG(@"文件读取成功: %@",content);
    return content;
}

- (BOOL)__deleteFileWithFilePath:(NSString *_Nullable)filePath{
    if (filePath == nil || [filePath isEqualToString:@""]){
        NSAssert(NO, @"filePath is nil or emtity");
        return NO;
    }

    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL res = [fileManager removeItemAtPath:filePath error:nil];
    if (res) {
        DEBUGLOG(@"文件删除成功");
        return YES;
    }
    else{
        DEBUGLOG(@"文件删除失败");
        NSAssert(NO, @"文件删除失败");
        return YES;
    }
}

@end
