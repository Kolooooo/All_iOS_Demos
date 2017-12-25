//
//  XMNPhotoPickerController.m
//  XMNPhotoPickerFrameworkExample
//
//  Created by XMFraker on 16/1/28.
//  Copyright © 2016年 XMFraker. All rights reserved.
//

#import "XMNPhotoPickerController.h"
#import "XMNPhotoCollectionController.h"
#import "XMNPhotoManager.h"
#import "XMNAlbumCell.h"

@interface XMNPhotoPickerController ()

@end

@implementation XMNPhotoPickerController

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"

#pragma mark - Life Cycle
- (instancetype)initWithMaxCount:(NSUInteger)maxCount
                        delegate:(id<XMNPhotoPickerControllerDelegate>)delegate {
    // !!!: init XMNAlbumListController
    XMNAlbumListController *albumListC = [[XMNAlbumListController alloc] init];
    if (self = [super initWithRootViewController:albumListC]) {
        _photoPickerDelegate = delegate;
        _maxCount = maxCount ? : NSUIntegerMax;
        _autoPushToPhotoCollection = YES;
        _pickingVideoEnable = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBarAppearance];
}

/**
 *  重写viewWillAppear方法
 *  判断是否需要自动push到第一个相册专辑内
 *  @param animated 是否需要动画
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self handleAuthorized];
}

- (void)dealloc {
    NSLog(@"photo picker dealloc");
}

#pragma mark - XMNPhotoPickerController
- (void)handleAuthorized {
    if ([XMNPhotoManager sharedManager].authorizationStatus == PHAuthorizationStatusNotDetermined) {
        //未决定是否授权 -> 启动定时器
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            
        }];
        [self performSelector:@selector(handleAuthorized) withObject:nil afterDelay:.3];
        return;
    }
    
    if ([[XMNPhotoManager sharedManager] hasAuthorized]) {
        //已授权
        [self autoPushPhotoCollectionViewController];
    }else {
        //未授权
        [self showUnAuthorizedTips];
    }
    
}

#pragma mark - 自动前往照片列表页面
/// 自动前往照片列表页面
- (void)autoPushPhotoCollectionViewController {
    if (self.autoPushToPhotoCollection) {
        XMNPhotoCollectionController *photoCollectionC = [[XMNPhotoCollectionController alloc] initWithCollectionViewLayout:[XMNPhotoCollectionController photoCollectionViewLayoutWithWidth:self.view.frame.size.width]];
        __weak typeof(*&self) wSelf = self;
        // !!!: 获取所有的相册
        [[XMNPhotoManager sharedManager] getAlbumsPickingVideoEnable:self.pickingVideoEnable completionBlock:^(NSArray<XMNAlbumModel *> *albums) {
            __weak typeof(*&self) self = wSelf;
            photoCollectionC.album = [albums firstObject];
            [self pushViewController:photoCollectionC animated:NO];
        }];
    }
}

/**
 *  call photoPickerDelegate & didFinishPickingPhotosBlock
 *
 *  @param assets 具体回传的资源
 */
- (void)didFinishPickingPhoto:(NSArray<XMNAssetModel *> *)assets {
    NSMutableArray *images = [NSMutableArray array];
    [assets enumerateObjectsUsingBlock:^(XMNAssetModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.previewImage != nil) {
            [images addObject:obj.previewImage];
        }
    }];
    if (self.photoPickerDelegate && [self.photoPickerDelegate respondsToSelector:@selector(photoPickerController:didFinishPickingPhotos:sourceAssets:)]) {
        [self.photoPickerDelegate photoPickerController:self didFinishPickingPhotos:images sourceAssets:assets];
    }
    self.didFinishPickingPhotosBlock ? self.didFinishPickingPhotosBlock(images,assets) : nil;
}

- (void)didFinishPickingVideo:(XMNAssetModel *)asset {
    
    if (self.photoPickerDelegate && [self.photoPickerDelegate respondsToSelector:@selector(photoPickerController:didFinishPickingVideo:sourceAssets:)]) {
        [self.photoPickerDelegate photoPickerController:self didFinishPickingVideo:asset.previewImage sourceAssets:asset];
    }
    
    if (self.didFinishPickingVideoBlock) {
        self.didFinishPickingVideoBlock(asset.previewImage, asset);
    }
    
//    self.didFinishPickingVideoBlock ? self.didFinishPickingVideoBlock(asset.previewImage , asset) : nil;
}

- (void)didCancelPickingPhoto {
    if (self.photoPickerDelegate && [self.photoPickerDelegate respondsToSelector:@selector(photoPickerControllerDidCancel:)]) {
        [self.photoPickerDelegate photoPickerControllerDidCancel:self];
    }
    self.didCancelPickingBlock ? self.didCancelPickingBlock() : nil;
}

/**
 *  显示用户拒绝授权提示
 */
- (void)showUnAuthorizedTips {
    
    UILabel *tipsLabel = [[UILabel alloc] init];
    tipsLabel.frame = CGRectMake(8, 64, self.view.frame.size.width - 16, 300);
    tipsLabel.textAlignment = NSTextAlignmentCenter;
    tipsLabel.numberOfLines = 0;
    tipsLabel.font = [UIFont systemFontOfSize:16];
    tipsLabel.textColor = [UIColor blackColor];
    tipsLabel.userInteractionEnabled = YES;
    NSString *appName = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleDisplayName"];
    if (!appName) appName = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleName"];
    tipsLabel.text = [NSString stringWithFormat:@"请在%@的\"设置-隐私-照片\"选项中，\r允许%@访问你的手机相册。",[UIDevice currentDevice].model,appName];
    [self.view addSubview:tipsLabel];
    
    //!!! bug 用户前往设置后,修改授权会导致app崩溃
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTipsTapAction)];
    [tipsLabel addGestureRecognizer:tap];
}


/**
 *  处理当用户未授权访问相册时 tipsLabel的点击手势,暂时有bug
 */
- (void)handleTipsTapAction {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

#pragma mark - Set the navigationBar
- (void)setupNavigationBarAppearance {
    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.translucent = YES;
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    if (iOS7Later) {
        self.navigationBar.barTintColor = kXMNBarBackgroundColor;
        self.navigationBar.tintColor = [UIColor whiteColor];
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    UINavigationBar *navigationBar;
    UIBarButtonItem *barItem;
    if (iOS9Later) {
        barItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[XMNPhotoPickerController class]]];
        navigationBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[XMNPhotoPickerController class]]];
    } else {
        barItem = [UIBarButtonItem appearanceWhenContainedIn:[XMNPhotoPickerController class], nil];
        navigationBar = [UINavigationBar appearanceWhenContainedIn:[XMNPhotoPickerController class], nil];
    }
    [barItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20.0f]}];
    [navigationBar setBarStyle:UIBarStyleBlackTranslucent];
}


@end

