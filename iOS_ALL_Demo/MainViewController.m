//
//  MainViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 02/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "MainViewController.h"
#import "TableViewCell.h"
#import "UILabelViewController.h"
#import "TableViewController.h"
#import "AutoLayoutViewController.h"
#import "tableViewInCell.h"
#import "tableViewInCell2.h"

@interface MainViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView  *tableView;

@property (nonatomic, strong) NSArray<NSString *>  *titles;


@property(nonatomic,assign) BOOL  isone;
@property(nonatomic,assign) NSInteger  count;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self initData];
    [self initRequest];
    
    self.count = 2;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.isone = self.isone==YES ? NO : YES;
        
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
    NSArray *indexPaths = @[indexPath];
    self.count+=1;
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    cell.titleLabel.text = self.titles[indexPath.row];
    
    if (indexPath.row == 3) {
        if (!_isone) {
            tableViewInCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewInCell" forIndexPath:indexPath];
            cell.count = self.count;
            WeakSelf;
            cell.BlockName = ^{
                [weakSelf.tableView reloadData];
            };
            return cell;
        }
        else{
            tableViewInCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewInCell2" forIndexPath:indexPath];
            cell.count = self.count;
            WeakSelf;
            cell.BlockName = ^{
                [weakSelf.tableView reloadData];
            };
            return cell;
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UILabelViewController *vc = [[UILabelViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1) {
        TableViewController *vc = [[TableViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2) {
        AutoLayoutViewController *vc = [AutoLayoutViewController viewControllerWithStoryboardName:@"AutoLayoutViewController" identifier:@"AutoLayoutViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)initData{
    self.titles = @[
                    @"UILabel",
                    @"UITableViewController",
                    @"AutoLayoutViewController",
                    @"ken"
                    ];
}

- (void)initRequest{
    
}

- (void)initUI{
    self.title = @"首页";
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 0, ScreenWidth, 600);
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 150;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"tableViewInCell" bundle:nil] forCellReuseIdentifier:@"tableViewInCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"tableViewInCell2" bundle:nil] forCellReuseIdentifier:@"tableViewInCell2"];
    
    
    
    [self.view addSubview:self.tableView];
}

@end







