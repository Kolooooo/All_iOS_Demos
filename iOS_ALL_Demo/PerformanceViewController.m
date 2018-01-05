//
//  PerformanceViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/10/25.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "PerformanceViewController.h"
#import "PerformanceViewCell.h"

@interface PerformanceViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@end

@implementation PerformanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PerformanceViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:[PerformanceViewCell identifier] forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [PerformanceViewCell cellHeight];
}

- (void)initUI{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[PerformanceViewCell class] forCellReuseIdentifier:[PerformanceViewCell identifier]];
}

@end
