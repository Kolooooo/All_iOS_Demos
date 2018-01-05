




#import "ViewController.h"
#import "CZHTTPManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self getJSON];
}

/// AFN GET JSON
- (void)getJSON {
    [[CZHTTPManager shareManager] GET:@"http://appserver.hunlimao.com//adSetting/list?device=iPhone&position=appIndexAd_&city=%E5%B9%BF%E5%B7%9E" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


/// 自定义GET JSON
- (void)customGETJson {
    [[CZHTTPManager shareManager]GET:@"demo.json" params:nil complete:^(BOOL result, id responseObj) {
        if (result) {
            NSLog(@"请求成功%@",responseObj);
        }else {
            NSLog(@"请求出错%@",responseObj);
        }
    }];
}


// 使用GET 来登录
- (void)getLogin {
    NSDictionary *params = @{@"username":@"zhangsan",@"password":@"zhang"};
    [[CZHTTPManager shareManager]GET:@"login.php" params:params complete:^(BOOL result, id responseObj) {
        if (result) {
            NSLog(@"请求成功%@",responseObj);
        }else {
            NSLog(@"请求出错%@",responseObj);
        }
    }];
}

// 使用POST 来登录
- (void)postLogin {
    NSDictionary *params = @{@"username":@"zhangsan",@"password":@"zhang"};
    [[CZHTTPManager shareManager]POST:@"login.php" params:params complete:^(BOOL result, id responseObj) {
        if (result) {
            NSLog(@"请求成功%@",responseObj);
        }else {
            NSLog(@"请求出错%@",responseObj);
        }
    }];
}

// 上传文件
- (void)uploadFile {
    
    // 上传的图片
    NSURL *imageURL = [[NSBundle mainBundle]URLForResource:@"1.jpg" withExtension:nil];
    NSURL *imageURL2 = [[NSBundle mainBundle]URLForResource:@"2.jpg" withExtension:nil];
    
    [[CZHTTPManager shareManager] POST:@"post/upload-m.php" parameters:@{@"username":@"zhangsan"} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:[NSData dataWithContentsOfURL:imageURL] name:@"userfile[]" fileName:@"1.jpg" mimeType:@"image/jpg"];
        [formData appendPartWithFileData:[NSData dataWithContentsOfURL:imageURL2] name:@"userfile[]" fileName:@"2.jpg" mimeType:@"image/jpg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%f",(CGFloat)uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

// 下载文件
- (void)downLoadFile {
    NSURL *url = [NSURL URLWithString:@"http://localhost/ui.mp4"];
    [[[CZHTTPManager shareManager] downloadTaskWithRequest:[NSURLRequest requestWithURL:url] progress:^(NSProgress * _Nonnull downloadProgress) {
        
        NSLog(@"%f - %@",(CGFloat)downloadProgress.completedUnitCount / downloadProgress.totalUnitCount,[NSThread currentThread]);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSLog(@"%@",targetPath);// 临时文件保存的地方
        // ^NSURL * , 需要我们返回一个文件保存的路径
        NSString *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"ui.mp4"];
        return [NSURL fileURLWithPath:path];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"success %@",filePath.path);
    }] resume];
}



@end
