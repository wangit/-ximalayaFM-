//
//  WXDiscoverViewController.m
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/25.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "WXDiscoverViewController.h"
#import "WXDiscoverModel.h"
#import "WXDiscoverTableViewCell.h"
#define tableViewCel @"WXDiscoverTableViewCell"

@interface WXDiscoverViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *arrayList_row;

@property(nonatomic,strong)NSMutableArray *arrayList_1;
@property(nonatomic,strong)NSMutableArray *arrayList_2;
@property(nonatomic,strong)NSMutableArray *arrayList_3;
@property(nonatomic,strong)NSMutableArray *arrayList_4;

@end

@implementation WXDiscoverViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        _arrayList_row = [[NSMutableArray alloc]init];
        _arrayList_1 = [[NSMutableArray alloc]init];
        _arrayList_2 = [[NSMutableArray alloc]init];
        _arrayList_3 = [[NSMutableArray alloc]init];
        _arrayList_4 = [[NSMutableArray alloc]init];

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self configureNetWorkSubscription];
    [self.tableView registerNib:[UINib nibWithNibName:@"WXDiscoverTableViewCell" bundle:nil] forCellReuseIdentifier:tableViewCel];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return _arrayList_1.count;
            break;
            case 1:
            return _arrayList_2.count;
        case 2:
            return _arrayList_3.count;
        case 3:
            return _arrayList_4.count;
        default:
            return 0;
            break;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WXDiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCel forIndexPath:indexPath];

    if (indexPath.section == 0) {
        cell.model = _arrayList_1[indexPath.row];
        if (indexPath.row == _arrayList_1.count - 1) {
            cell.lineView.hidden = YES;
        }
    }
    if (indexPath.section == 1) {
        cell.model = _arrayList_2[indexPath.row];
        if (indexPath.row == _arrayList_2.count - 1) {
            cell.lineView.hidden = YES;
        }
    }
    
    if (indexPath.section == 2) {
        cell.model = _arrayList_3[indexPath.row];
        if (indexPath.row == _arrayList_3.count - 1) {
            cell.lineView.hidden = YES;
        }
    }
    
    if (indexPath.section == 3) {
        cell.model = _arrayList_4[indexPath.row];
        if (indexPath.row == _arrayList_4.count - 1) {
            cell.lineView.hidden = YES;
        }
    }
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _arrayList_row.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 12;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(void)configureNetWorkSubscription{

    NSDictionary *diction = @{
                              @"cityCode":@"43_110000_1100",
                              @"device":@"iPhone",
                              @"uid":@"3185651",
                              @"version":@"6.3.6",
                              };
    
    [[WXNetworking sharedWXNetworking] MHNetGetUrl:@"http://140.207.215.242/mobile/discovery/v1/square/list" Data:diction errcodeBlock:^(id  _Nullable data) {
    } SuccessBlock:^(id  _Nullable data) {
        NSDictionary *dict = data;
        _arrayList_row = dict[@"list"];
        for (NSDictionary *idid in _arrayList_row) {
            if ([idid[@"id"] integerValue] == 1) {
                NSArray *dictArray = idid[@"list"];
                for (NSDictionary *idList in dictArray) {
                    WXDiscoverModel *model = [WXDiscoverModel mj_objectWithKeyValues:idList];
                    MHLog(@"%@",model.contentType);
                    [_arrayList_1 addObject:model];
                }

            }
            
            if ([idid[@"id"] integerValue] == 2) {
                NSArray *dictArray = idid[@"list"];
                for (NSDictionary *idList in dictArray) {
                    WXDiscoverModel *model = [WXDiscoverModel mj_objectWithKeyValues:idList];
                    MHLog(@"%@",model.contentType);
                    [_arrayList_2 addObject:model];
                }
                
            }
            
            if ([idid[@"id"] integerValue] == 3) {
                NSArray *dictArray = idid[@"list"];
                for (NSDictionary *idList in dictArray) {
                    WXDiscoverModel *model = [WXDiscoverModel mj_objectWithKeyValues:idList];
                    MHLog(@"%@",model.contentType);
                    [_arrayList_3 addObject:model];
                }
            }
            if ([idid[@"id"] integerValue] == 4) {
                NSArray *dictArray = idid[@"list"];
                for (NSDictionary *idList in dictArray) {
                    WXDiscoverModel *model = [WXDiscoverModel mj_objectWithKeyValues:idList];
                    MHLog(@"%@",model.contentType);
                    [_arrayList_4 addObject:model];
                }
            }

        }
        [self.tableView reloadData];
    } FailureBlock:^(id  _Nullable data) {
        NSLog(@"%@",data);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
