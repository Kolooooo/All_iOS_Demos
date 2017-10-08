//
//  TableViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 02/09/2017.
//  Copyright © 2017 Ken lu. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell2.h"

@interface TableViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView  *tableView;

@property (nonatomic, strong) NSArray<NSString *>  *datas;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self initData];
    [self showTheMethod];
}

- (void)showTheMethod{
    // iOS 8.0 使用这两句就可以自动适配cell 的高度。注意约束cell 内部控件的时候，cell 的contentView 必须四个边都得到约束才行
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell2" forIndexPath:indexPath];
    cell.text2Label.text = self.datas[indexPath.row];
    
//    [tableView bottomLineColor:[UIColor purpleColor]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:11 inSection:0];
        [self.tableView scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

#pragma mark showTheMethod
// iOS 7.0 需要实现height 的代理方法计算
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    TableViewCell2 *cell = (TableViewCell2 *)[tableView dequeueReusableCellWithIdentifier:@"TableViewCell2"];
//    cell.text2Label.text = self.datas[indexPath.row];
//
//    //这句代码必须要有，也就是说必须要设定contentView的宽度约束。
//    //设置以后，contentView里面的内容才知道什么时候该换行了
//    CGFloat contentViewWidth = CGRectGetWidth(tableView.frame);
//    [cell.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@(contentViewWidth));
//    }];
//
//    //重新加载约束
//    [cell setNeedsUpdateConstraints];
//    [cell updateConstraintsIfNeeded];
//
//    //自动算高度，+1的原因是因为contentView的高度要比cell的高度小1
//    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
//
//
//    CGFloat textHeight = [cell.text2Label autoHeight];
//    return height + textHeight;
//}

- (void)initData{
    self.datas = @[
                   @"123123123123asdfasfsdfasdf34534534534534534534534534",
                   @"12312312312312323",
                   @"1231231231231231231323441234234234234234234234235345345345345345345345345341231231231231231231323441234234232312313234412342342342342342342342353453453453453453453453453412312312312312312313234412342342323123132344123423423423423423423423534534534534534534534534534123123123123123123132344123423423423423423423423534534534534534534534534534123123123123123123132344123423423423423423423423534534534534534534534534534",
                   @"123123123123123123132344123423423423423423423423534534534534534534534534534123123123123123123132344123423423423423423423434534534534",
                   @"123123123123123123132344123423423423423423423423534534534534534534534534534123123123123123123132344123423423423423423423434534534534",
                   @"123123123123123123132344123423423423423423423423534534534534534534534534534123123123123123123132344123423423423423423423434534534534",
                   @"123123123123123123132344123423423423423423423423534534534534534534534534534123123123123123123132344123423423423423423423434534534534",
                   @"123123123123123123132344123423423423423423423423534534534534534534534534534123123123123123123132344123423423423423423423434534534534",
                   @"123123123123123123132344123423423423423423423423534534534534534534534534534123123123123123123132344123423423423423423423434534534534",
                   @"123123123123123123132344123423423423423423423423534534534534534534534534534123123123123123123132344123423423423423423423434534534534",
                   @"123123123123123123132344123423423423423423423423534534534534534534534534534123123123123123123132344123423423423423423423434534534534",
                   @"123123123123123123132344123423423423423423423423534534534534534534534534534123123123123123123132344123423423423423423423434534534534",
                   @"11111111112312312312312312313234412342342342342342342342353453453453453453453453453412312312312312312313234412342342342342342342343453111111111",
                   @"123123123123123123132344123423423423423423423423534534534534534534534534534123123123123123123132344123423423423423423423434534534534",
                   @"123123123123123123132344123423423423423423423423534534534534534534534534534123123123123123123132344123423423423423423423434534534534"
                   ];
    
}

- (void)initUI{
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell2" bundle:nil] forCellReuseIdentifier:@"TableViewCell2"];
    
    
    [self.view addSubview:self.tableView];
    [self someNumber];
}


- (NSArray<NSNumber *> *_Nonnull)someNumber {
    NSInteger one   = 1;
    NSInteger two   = 2;
    NSInteger three = 3;
    
    NSArray *numbers = @[@(one), @(two), @(three)];
    
    return numbers;
}




@end
