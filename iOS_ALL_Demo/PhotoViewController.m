//
//  PhotoViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken on 2017/12/22.
//  Copyright © 2017年 Ken lu. All rights reserved.
//


#import "PhotoViewController.h"
#import "MessagePhotoView.h"
#import "ZBMessageShareMenuView.h"

#pragma mark - Enum

@interface PhotoViewController ()
<MessagePhotoViewDelegate,
ZBMessageShareMenuViewDelegate>

@property (nonatomic,strong) MessagePhotoView *photoView;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];
}

- (void)initUI{
    UIButton *optionButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [optionButton setFrame: CGRectMake(0, 20, 65, 40)];
    [optionButton setTitle:@"提交" forState:UIControlStateNormal];
    [optionButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [optionButton setAlpha:0.85];
    optionButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [optionButton addTarget: self action: @selector(optionRightButtonAction) forControlEvents: UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView: optionButton];
    
    
    if (!self.photoView){
        self.photoView = [[MessagePhotoView alloc]initWithFrame:CGRectMake(0,0, self.view.width, self.view.height)];
        [self.view addSubview:self.photoView];
        self.photoView.delegate = self;
    }
}

- (void) optionRightButtonAction {
    //将界面中的信息提交到服务器
    
}

//实现代理方法
-(void)addPicker:(UIImagePickerController *)picker{
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark ZBMessageShareMenuViewDelegate
- (void)didSelecteShareMenuItem:(ZBMessageShareMenuItem *)shareMenuItem atIndex:(NSInteger)index{
    
}

@end
