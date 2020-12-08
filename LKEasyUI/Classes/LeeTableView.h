//
//  LeeTableView.h
//  NIM
//
//  Created by mac on 2020/7/17.
//  Copyright © 2020 Luculent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^refreshBlock)(BOOL isRefresh, NSInteger pageNum);
@interface LeeTableView : UITableView

@property (nonatomic, strong) MJRefreshNormalHeader *headerRefresh;
@property (nonatomic, strong) MJRefreshAutoNormalFooter *footerRefresh;

@property (nonatomic, assign) NSInteger pageNum;

+ (LeeTableView *)initializeTableViewWithTarget:(id)target;

- (void)configRefrechActionAndCallBack:(refreshBlock)callBack;

- (void)endRefreshingWithNextPage:(BOOL)hasNext
                      isEmptyData:(BOOL)isEmpty;


- (void)configEmptyData;
@end

NS_ASSUME_NONNULL_END
