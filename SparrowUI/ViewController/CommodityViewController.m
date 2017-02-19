//
//  CommodityViewController.m
//  SparrowUI
//
//  Created by microsparrow on 16/10/18.
//  Copyright © 2016年 microsparrow. All rights reserved.
//

#import "CommodityViewController.h"

@import SparrowBusiness;
@import SparrowModel;

@interface CommodityViewController ()<UITableViewDelegate,UITableViewDataSource>

@property   (nonatomic,weak)    IBOutlet    UITableView     *dataTable;
@property   (nonatomic,strong)  NSArray<MCommodity *>       *dataArray;

@end

@implementation CommodityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"点菜";
    
    UIButton *btnLeftv = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLeftv.frame = (CGRect){0,0,64,44};
    [btnLeftv setTitle:@"返回" forState:UIControlStateNormal];
    [btnLeftv setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [btnLeftv addTarget:self action:@selector(touchBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnLeft = [[UIBarButtonItem alloc] initWithCustomView:btnLeftv];
    self.navigationItem.leftBarButtonItem = btnLeft;
    
    self.dataTable.delegate     = self;
    self.dataTable.dataSource   = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self orderBinding];
}

#pragma mark - Data

- (void)orderBinding {
    self.dataArray = [[BInterface OrderInterface] fetchOrderWithTime:17232392 pageSize:8 pageIndex:1];
}

#pragma mark - Action

- (void)touchBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
//    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSArray *array = self.dataArray[section];
//    return array.count;
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 92.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *labView = [[UILabel alloc] init];
    labView.frame = (CGRect){0,0,200,30};
    labView.text  = [NSString stringWithFormat:@"section Name : %zi",section];
    labView.backgroundColor = [UIColor redColor];
    
    return labView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MCommodity  *commodity  = self.dataArray[indexPath.row];
    NSString    *cellName   = [NSString stringWithFormat:@"%@",commodity.name];
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = cellName;
    
    return cell;
}


@end
