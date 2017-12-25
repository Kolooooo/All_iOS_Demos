//
//  XMNAlbumListController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/12/26.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "XMNAlbumListController.h"
#import "XMNPhotoPickerController.h"
#import "XMNPhotoCollectionController.h"
#import "XMNPhotoManager.h"
#import "XMNAlbumCell.h"

@interface XMNAlbumListController ()

@end

@implementation XMNAlbumListController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"照片";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(_handleCancelAction)];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.rowHeight = 70.0f;
    [self.tableView registerNib:[UINib nibWithNibName:XMNAlbumCell.cellID bundle:nil ] forCellReuseIdentifier:XMNAlbumCell.cellID];
    
    XMNPhotoPickerController *imagePickerVC = (XMNPhotoPickerController *)self.navigationController;
    
    __weak typeof(*&self) wSelf = self;
    [[XMNPhotoManager sharedManager] getAlbumsPickingVideoEnable:imagePickerVC.pickingVideoEnable completionBlock:^(NSArray<XMNAlbumModel *> *albums) {
        __strong typeof(*&wSelf) self = wSelf;
        self.albums = [NSArray arrayWithArray:albums];
        [self.tableView reloadData];
    }];
}

- (void)_handleCancelAction {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    XMNPhotoPickerController *photoPickerVC = (XMNPhotoPickerController *)self.navigationController;
    [photoPickerVC didCancelPickingPhoto];
}


#pragma mark - XMNAlbumListController UITableViewDataSource && UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XMNAlbumCell *albumCell = [tableView dequeueReusableCellWithIdentifier:XMNAlbumCell.cellID];
    [albumCell configCellWithItem:self.albums[indexPath.row]];
    return albumCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XMNPhotoCollectionController *photoCollectionC = [[XMNPhotoCollectionController alloc] initWithCollectionViewLayout:[XMNPhotoCollectionController photoCollectionViewLayoutWithWidth:self.view.frame.size.width]];
    photoCollectionC.album = self.albums[indexPath.row];
    [self.navigationController pushViewController:photoCollectionC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
