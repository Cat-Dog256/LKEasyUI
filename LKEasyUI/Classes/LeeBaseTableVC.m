//
//  LeeBaseTableVC.m
//  NIM
//
//  Created by mac on 2020/11/11.
//  Copyright © 2020 Luculent. All rights reserved.
//

#import "LeeBaseTableVC.h"

@interface LeeBaseTableVC ()

@end

@implementation LeeBaseTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self configTableView];
    [self registerTableViewCell];
    [self requestData];
    // Do any additional setup after loading the view.
}
- (void)makeUI{
 
}
- (void)registerTableViewCell{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"test-cell"];
}
- (void)requestData{
    [self.tableView.mj_header beginRefreshing];
}
- (void)requestDataAndIsRefresh:(BOOL)isRefresh {
    if (isRefresh) {
        [self.items removeAllObjects];
    }
    [self loadListData];
}
- (void)loadListData{
//    WeakSelf;
//    [[WorkService instance] rwgl_getReceivedTaskListWithToken:RWGL_TOKEN name: @"" processedType:@"0" pageNum:self.tableView.pageNum complete:^(id obj, BOOL hasNext) {
//        
//        [weakSelf.items addObjectsFromArray:obj];
//        [weakSelf.tableView reloadData];
//        [weakSelf.tableView endRefreshingWithNextPage:hasNext isEmptyData:!weakSelf.items.count];
//    } error:^(NSString *error) {
//        
//        [weakSelf.tableView endRefreshingWithNextPage:NO isEmptyData:!weakSelf.items.count];
//        [weakSelf.tableView reloadData];
//        [ToastView showMessage:error];
//    }];
}
- (void)configTableView {
   
    self.tableView = [LeeTableView initializeTableViewWithTarget:self];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.frame = self.view.bounds;
    
    [self.tableView configEmptyData];

    __weak typeof(self) weakSelf = self;
    [self.tableView configRefrechActionAndCallBack:^(BOOL isRefresh, NSInteger pageNum) {
        [weakSelf requestDataAndIsRefresh:isRefresh];
    }];
   
}
#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test-cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",indexPath.description];
    return cell;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  
    return CGFLOAT_MIN;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return footerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}

@end
