//
//  tableViewInCell.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 20/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "tableViewInCell.h"

@interface tableViewInCell()
<UITableViewDelegate,
UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeight;

@end

@implementation tableViewInCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self initUI];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.textLabel.text = @"ken";
    
    if (self.tableViewHeight.constant != tableView.contentSize.height) {
        self.tableViewHeight.constant = tableView.contentSize.height;
        self.BlockName();
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}

- (void)initUI{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
}

- (void)setCount:(NSInteger)count{
    _count = count;
    
    [self.tableView reloadData];
}

@end
