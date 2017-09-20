//
//  tableViewInCell2.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 20/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "tableViewInCell2.h"

@interface tableViewInCell2()
<UITableViewDataSource,
UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeight;


@end

@implementation tableViewInCell2


- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.textLabel.text = @"kenny";
    
    if (self.tableViewHeight.constant != tableView.contentSize.height) {
        self.tableViewHeight.constant = tableView.contentSize.height;
        self.BlockName();
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0f;
}

- (void)setCount:(NSInteger)count{
    _count = count;
    
    [self.tableView reloadData];
}

@end
