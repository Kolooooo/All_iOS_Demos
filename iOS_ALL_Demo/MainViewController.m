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
#import "GCDViewController.h"

@interface MainViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView  *tableView;
@property (nonatomic, strong) NSArray<NSString *>  *titles;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self initData];
    [self initRequest];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    cell.titleLabel.text = self.titles[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            UILabelViewController *vc = [[UILabelViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:{
            TableViewController *vc = [[TableViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:{
            AutoLayoutViewController *vc = [AutoLayoutViewController __viewControllerWithStoryboardName:@"AutoLayoutViewController" identifier:@"AutoLayoutViewController"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:{
            [self.navigationController pushViewController:[[NSClassFromString(@"UITextFieldViewController") alloc] init] animated:YES];
            break;
        }
        case 4:{
            [self.navigationController pushViewController:[[NSClassFromString(@"UIBezierPathViewController") alloc] init] animated:YES];
            break;
        }
        case 5:{
            [self.navigationController pushViewController:[[NSClassFromString(@"RuntimeViewController") alloc] init] animated:YES];
            break;
        }
        case 6:{
            [self.navigationController pushViewController:[[NSClassFromString(@"GCDViewController") alloc] init] animated:YES];
            break;
        }
        case 7:{
            [self.navigationController pushViewController:[[NSClassFromString(@"GradientViewController") alloc] init] animated:YES];
            break;
        }
        case 8:{
            [self.navigationController pushViewController:[[NSClassFromString(@"SQLiteManagerViewController") alloc] init] animated:YES];
            break;
        }
            
            
        default:
            break;
    }
}

- (void)initData{
    self.titles = @[
                    @"UILabel",
                    @"UITableViewController",
                    @"AutoLayoutViewController",
                    @"UITextFieldViewController",
                    @"UIBezierPathViewController",
                    @"RuntimeViewController",
                    @"GCDViewController",
                    @"GradientViewController 渐变",
                    @"SQLiteManagerViewController"
                    ];
}

- (void)initRequest{
    
}

- (void)initUI{
    self.title = @"首页";
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 0, __ScreenWidth, 600);
    self.tableView.rowHeight = 50;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"tableViewInCell" bundle:nil] forCellReuseIdentifier:@"tableViewInCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"tableViewInCell2" bundle:nil] forCellReuseIdentifier:@"tableViewInCell2"];
    
    
    [self.view addSubview:self.tableView];
}

@end







