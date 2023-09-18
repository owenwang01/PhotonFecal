//
//  HTEpisodeTableView.m
// 
//
//  Created by Apple on 2022/11/26.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTEpisodeTableView.h"
#import "HTEpisodeTableCell.h"
#import "HTTVHeaderViewCell.h"

@interface HTEpisodeTableView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HTTVPlayDetailSSNModel *var_dataModel;
//TODO:03-13bug，解决季度不自动选中的问题
@property (nonatomic, assign) NSInteger currentSectionIndex;//当前选中的季度
@end

@implementation HTEpisodeTableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self ht_addSubviews];
    }
    return self;
}

- (void)ht_addSubviews{
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

- (void)ht_updateViewWithData:(HTTVPlayDetailSSNModel *)data{
    self.var_dataModel = data;
    [self.tableView reloadData];
}

- (void)ht_updateSelectWithIndex:(NSInteger)selectedIndex{
    [self.tableView reloadData];
    self.currentSectionIndex = selectedIndex;
}

- (void)ht_reloadData{
    [self.tableView reloadData];
}

#pragma mark -- UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(!self.var_dataModel){
        return 0;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        HTTVHeaderViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HTTVHeaderViewCell class]) forIndexPath:indexPath];
        [cell ht_updateHeaderWithData:self.var_dataModel];
        //TODO:03-13，解决不自动选中季的bug
        [cell ht_updateSelectWithIndex:self.currentSectionIndex];
        cell.BLOCK_operationButtonBlock = self.BLOCK_operationButtonBlock;
        kself
        cell.BLOCK_arrowDownButtonActionBlock = ^(BOOL var_isDown) {
            weakSelf.var_dataModel.var_detailMore = var_isDown;
            [weakSelf.tableView reloadData];
        };
        
        cell.BLOCK_HTSwitchEpsSeason = self.switchEpsSeason;
        return cell;
    }else{
        HTEpisodeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HTEpisodeTableCell class]) forIndexPath:indexPath];
        [cell ht_updateCellWithData:self.dataArray[indexPath.row-1]];
        HTTVPlayDetailEpsListModel *model = self.dataArray[indexPath.row-1];
        if([model.var_idNum isEqualToString:self.var_currentEpsModel.var_idNum]){
            [cell lgjeropj_setCellTextColor:YES];
        }else{
            [cell lgjeropj_setCellTextColor:NO];
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row > 0){
        HTTVPlayDetailEpsListModel *model = self.dataArray[indexPath.row-1];
        if(self.epsSelectedBlock){
            self.epsSelectedBlock(model);
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        if(self.var_dataModel.var_detailMore){
            return self.var_dataModel.var_detailHeight;
        }else{
            return self.var_dataModel.var_tagsHeight;
        }
    }
    return 70;
}
- (void)ht_autoPlayNextEP {
    int nextIndex = [self ht_getCurrentEpIndex] + 1;
    if (nextIndex < self.dataArray.count) {
        HTTVPlayDetailEpsListModel *model = self.dataArray[nextIndex];
        if(self.epsSelectedBlock){
            self.epsSelectedBlock(model);
        }
    }
}
- (int)ht_getCurrentEpIndex {
    int index = 0;
    for (int i = 0; i< self.dataArray.count - 1; i++) {
        HTTVPlayDetailEpsListModel *model = self.dataArray[i];
        if([model.var_idNum isEqualToString:self.var_currentEpsModel.var_idNum]){
            index = i;
            break;
        }
    }
    return index;
}
- (UITableView *)tableView {
    if (!_tableView){
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.showsHorizontalScrollIndicator = NO;
        [tableView registerClass:[HTEpisodeTableCell class] forCellReuseIdentifier:NSStringFromClass([HTEpisodeTableCell class])];
        [tableView registerClass:[HTTVHeaderViewCell class] forCellReuseIdentifier:NSStringFromClass([HTTVHeaderViewCell class])];
        _tableView = tableView;
    }
    return _tableView;
}

@end
