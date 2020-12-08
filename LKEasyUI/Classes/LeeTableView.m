//
//  LeeTableView.m
//  NIM
//
//  Created by mac on 2020/7/17.
//  Copyright © 2020 Luculent. All rights reserved.
//

#import "LeeTableView.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface LeeTableView()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>


@property (nonatomic, assign) BOOL hasNext;
@property (nonatomic, assign) BOOL isEmpty;
@property (nonatomic, assign) BOOL didloadData;

@property (nonatomic, copy) refreshBlock refreshActionCallBack;
@end

@implementation LeeTableView
+ (LeeTableView *)initializeTableViewWithTarget:(id)target{
    LeeTableView *tableView = [[LeeTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.dataSource = target;
    tableView.delegate = target;
    if (@available(iOS 11.0, *)) {
        tableView.estimatedRowHeight = 44;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedSectionHeaderHeight = 60;
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
        tableView.estimatedSectionFooterHeight = 0;
    }
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    tableView.pageNum = 1;
    tableView.didloadData = NO;
    tableView.isEmpty = YES;
    return tableView;
}
/// 配置刷新加载组件
- (void)configRefreshAndReloadDataSet {
    __weak typeof(self) weakSelf = self;
    self.headerRefresh = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.pageNum = 1;
        if (weakSelf.refreshActionCallBack) {
            weakSelf.pageNum = 1;
            weakSelf.refreshActionCallBack(YES, weakSelf.pageNum);
            weakSelf.didloadData = YES;
        }
        
    }];
    self.mj_header = self.headerRefresh;
    
    self.footerRefresh = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if (weakSelf.refreshActionCallBack) {
            weakSelf.refreshActionCallBack(NO, weakSelf.pageNum);
        }
        
    }];
//    self.mj_footer = self.footerRefresh;
}
- (void)configRefrechActionAndCallBack:(refreshBlock)callBack{
    [self configRefreshAndReloadDataSet];
    self.refreshActionCallBack = callBack;
}

- (void)endRefreshingWithNextPage:(BOOL)hasNext
                      isEmptyData:(BOOL)isEmpty{
    [self.headerRefresh endRefreshing];
    
    if (isEmpty || self.didloadData == NO) {
        self.mj_footer = nil;
    }else{
        self.mj_footer = self.footerRefresh;
        if (hasNext) {
            self.pageNum += 1;
            [self.footerRefresh resetNoMoreData];
        } else {
            [self.footerRefresh endRefreshingWithNoMoreData];
        }
        
    }
}
- (void)configEmptyData{
    self.emptyDataSetSource = self;
    self.emptyDataSetDelegate = self;
}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    return [UIImage imageNamed:@"work_waittodo_prompt_nothing"];
}
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"暂无相关数据";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16.0f],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView{
    if (self.didloadData == NO) {
        return NO;
    }
    
    return self.isEmpty;
}
@end
