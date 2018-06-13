//
//  WXHotVideoViewController.m
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/28.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "WXHotVideoViewController.h"
#import "HotHeaderTableViewCell.h"
#import "UserLoveTableViewCell.h"
#import "WXRecommendIMGModel.h"
#import "WXRecommendICONModel.h"
#import "WXRecommendYouLikeModel.h"
#import "WXAlbumDetailsViewController.h"
#define UserCellIdetifeir @"hotHeaderTableViewCell"
#define ULoveCellIdetifeir @"userLoveTableViewCell.h"

#define tableViewCel @"tableViewCel"

@interface WXHotVideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UserLoveTableViewCell *selectView;
@property (nonatomic, strong) NSMutableArray *ImageArray;
@property (nonatomic, strong) NSMutableArray *ImageIconArray;
@property (nonatomic, strong) NSMutableArray *ImageYouLikeArray;


@end

@implementation WXHotVideoViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        _ImageArray = [[NSMutableArray alloc]init];
        _ImageIconArray =[[NSMutableArray alloc]init];
        _ImageYouLikeArray =[[NSMutableArray alloc]init];


    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableView];
    [self configureNetWorkScrollImage];
}
- (void)configureTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 147.5)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"HotHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:UserCellIdetifeir];
    [self.tableView registerNib:[UINib nibWithNibName:@"UserLoveTableViewCell" bundle:nil] forCellReuseIdentifier:ULoveCellIdetifeir];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCel];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        HotHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UserCellIdetifeir forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setIconDetailClickActionBlock:^(NSInteger NumberTag) {
            WXRecommendICONModel *dictionPic =self.ImageIconArray[NumberTag -10];
            NSLog(@"%@",dictionPic.idList);

        }];
        if (_ImageArray.count != 0 & cell.imageArray.count == 0) {
            cell.imageArray = self.ImageArray;
        }
        if (_ImageIconArray.count != 0 & cell.IconTitleArray.count == 0) {
            cell.IconTitleArray = _ImageIconArray;
            
        }
        cell.cycleScrollerView.clickItemOperationBlock = ^(NSInteger currentIndex){
            WXRecommendIMGModel *dictionPic =self.ImageArray[currentIndex];
            NSLog(@"%@",dictionPic.idList);

            
        };
        return cell;
        
    }
    else if (indexPath.row == 1){
        
        UserLoveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ULoveCellIdetifeir forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (self.mArrDataList.count != 0 & cell.list.count == 0) {
            cell.list = self.mArrDataList;
        }
        [cell setCoverDetailClickActionBlock:^(WXRecommendYouLikeModel * model) {
            NSLog(@"%@",model);
            WXAlbumDetailsViewController *details = [[WXAlbumDetailsViewController alloc]init];
            details.AlbumID = model.albumId;
            details.hidesBottomBarWhenPushed = YES;

            [self.navigationController pushViewController:details animated:YES];
            
        }];
        [cell setMoreDetailClickActionBlock:^{
            NSLog(@"查看更多");
        }];
        
        return cell;
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCel forIndexPath:indexPath];
        return cell;
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return  HeightScale(180 + 115);
        }
        else{
            return (SCREEN_WIDTH/3 + WidthScale(60)) * 2+ HeightScale(36) + 42;
        }
    }
    else{
        return (SCREEN_WIDTH/3 + WidthScale(60)) * 2+ HeightScale(36);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Network
- (void)configureNetWorkData{


    for (WXRecommendYouLikeModel *love in self.ImageYouLikeArray) {
        NSString *stringPay;
        if ([love.isPaid isEqualToString:@"ture"]) {
            stringPay = [NSString stringWithFormat:@"%d",1];
        }
        else{
            stringPay = [NSString stringWithFormat:@"%d",0];
        }

        [self.mArrDataList addObject:love];

    }

    [_tableView reloadData];
}

- (void)parseListReport:(NSDictionary *)dic{
    
}
-(void)configureNetWorkScrollImage{
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970] *1000;
    long long dTime = [[NSNumber numberWithDouble:interval] longLongValue]; // 将double转为long long型
    NSString *curTime = [NSString stringWithFormat:@"%llu",dTime]; // 输出long long型
    
    NSDictionary *diction = @{
                              @"channel":@"ios-b1",
                              @"code":@"43_110000_1100",
                              @"device":@"iPhone",
                              @"includeActivity":@"true",
                              @"includeSpecial":@"true",
                              @"scale":@"2",
                              @"version":@"6.3.6",
                              };
    [[WXNetworking sharedWXNetworking] MHNetGetUrl:[NSString stringWithFormat:@"http://140.207.215.247/mobile/discovery/v1/recommend/ts-%@",curTime] Data:diction errcodeBlock:^(id  _Nullable data) {
    } SuccessBlock:^(id  _Nullable data) {
        NSDictionary *dict = data;
        NSArray *dictList = dict[@"list"];
        
        NSDictionary *imageListDict = dictList[0];
        NSArray *imageListArray = imageListDict[@"list"];
        for (NSDictionary *user in imageListArray) {
            WXRecommendIMGModel *model = [WXRecommendIMGModel mj_objectWithKeyValues:user];
            [self.ImageArray addObject:model];
        }
        
        NSDictionary *imageIconDict = dictList[1];
        NSArray *imageIconArray = imageIconDict[@"list"];
        for (NSDictionary *user in imageIconArray) {
            WXRecommendICONModel *model = [WXRecommendICONModel mj_objectWithKeyValues:user];
            [self.ImageIconArray addObject:model];
        }

        NSDictionary *imageLikeDict = dictList[2];
        NSArray *imageYouLikeArray = imageLikeDict[@"list"];
        for (NSDictionary *user in imageYouLikeArray) {
            WXRecommendYouLikeModel *model = [WXRecommendYouLikeModel mj_objectWithKeyValues:user];
            [self.ImageYouLikeArray addObject:model];
        }
        [self configureNetWorkData];

        
        [self.tableView reloadData];
    } FailureBlock:^(id  _Nullable data) {
        NSLog(@"%@",data);
    }];

}

@end
