//
//  NSFileManager+__Category.h
//  iOS_ALL_Demo
//
//  Created by Ken on 2017/12/23.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (__Category)

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

/// 创建文件夹
- (BOOL)__createDocumentWithDocumentName:(NSString *_Nonnull)documentName;

/// 创建文件
- (BOOL)__createFileWithDocumentPath:(NSString *_Nullable)documentPath fileName:(NSString *_Nullable)fileName fileType:(NSString *_Nullable)fileType;

/// 将数据写到文件
- (BOOL)__writeFileWithFilePath:(NSString *_Nullable)filePath contant:(NSString *_Nullable)contant;

/// 读文件数据
- (NSString *_Nonnull)__loadFileWithFilePath:(NSString *_Nullable)filePath;

/// 删除文件
- (BOOL)__deleteFileWithFilePath:(NSString *_Nullable)filePath;

@end
