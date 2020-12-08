//
//  LeeBaseTableVC.h
//  NIM
//
//  Created by mac on 2020/11/11.
//  Copyright © 2020 Luculent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>
#import "LeeBaseViewController.h"
#import "LeeTableView.h"
NS_ASSUME_NONNULL_BEGIN

@interface LeeBaseTableVC : LeeBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) LeeTableView *tableView;
@property (nonatomic, strong) NSMutableArray *items;


- (void)registerTableViewCell;
- (void)loadListData;
@end

NS_ASSUME_NONNULL_END
