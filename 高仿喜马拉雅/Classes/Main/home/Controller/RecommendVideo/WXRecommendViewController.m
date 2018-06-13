//
//  WXRecommendViewController.m
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/29.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "WXRecommendViewController.h"
#import "RecommendTableViewCell.h"
#import "CMPopTipView.h"
#import "RecommendView.h"
#import "WXRecommendModel.h"
#define UserCellIdetifeir @"recommendTableViewCell.h"

@interface WXRecommendViewController ()<CMPopTipViewDelegate>
@property (nonatomic, strong) RecommendView *tableHeader;

@end

@implementation WXRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableView];
    [self rankListNetWork];
}
- (void)configureTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 104) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"RecommendTableViewCell" bundle:nil] forCellReuseIdentifier:UserCellIdetifeir];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.mArrDataList.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        RecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UserCellIdetifeir forIndexPath:indexPath];

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        __weak RecommendTableViewCell *weakSelf = cell; // that's enough

        [cell setCloseDetailClickActionBlock:^{
            NSLog(@"关闭");

            
            CMPopTipView *popTipView;
     
            popTipView.delegate = self;
                        
            popTipView = [[CMPopTipView alloc] initWithCustomView:[self tableHeader]];
            popTipView.hasShadow = YES;
           popTipView.has3DStyle = YES;
            popTipView.dismissTapAnywhere = YES;
            //[popTipView autoDismissAnimated:YES atTimeInterval:3.0];
            popTipView.backgroundColor = [UIColor whiteColor];
            popTipView.borderColor = [UIColor whiteColor];
            [popTipView presentPointingAtView:weakSelf.closeButton inView:self.view animated:YES];
       

        }];
        cell.modelList = self.mArrDataList[indexPath.row];
        return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 135;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getters And Setters
- (RecommendView *)tableHeader
{
    if (!_tableHeader) {
        _tableHeader = [[RecommendView alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
    }
    return _tableHeader;
}

-(void)rankListNetWork{
    NSDictionary *diction = @{
                              @"device":@"iPhone",
                              @"pageId":@"1",
                              @"pageSize":@"20",
                              @"rankingListId":@"21",
                              @"scale":@"2",
                              @"target":@"main",
                              @"version":@"6.3.6",
                              };
    [[WXNetworking sharedWXNetworking] MHNetGetUrl:@"http://140.207.215.247/mobile/discovery/v1/rank/album" Data:diction errcodeBlock:^(id  _Nullable data) {
    } SuccessBlock:^(id  _Nullable data) {
        NSArray *dictList = data[@"list"];
        for (NSDictionary *user in dictList) {
            WXRecommendModel *model = [WXRecommendModel mj_objectWithKeyValues:user];
            [self.mArrDataList addObject:model];
        }
        [self.tableView reloadData];
    } FailureBlock:^(id  _Nullable data) {
        NSLog(@"%@",data);
    }];

}
@end
