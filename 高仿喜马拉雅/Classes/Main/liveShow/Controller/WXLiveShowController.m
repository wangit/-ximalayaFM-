//
//  WXLiveShowController.m
//  高仿喜马拉雅
//
//  Created by lifesea on 2018/6/7.
//  Copyright © 2018年 jiahedeng. All rights reserved.
//

#import "WXLiveShowController.h"
#import "WXLiveShowCollectionViewCell.h"
#import "WXLiveShowModel.h"
#import "WXPlayShowController.h"
#import "WXLiveShowingModel.h"

@interface WXLiveShowController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *arrayList_row;
@property(nonatomic,strong)WXLiveShowModel *arrayList_Model;


@end

@implementation WXLiveShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayList_row = [[NSMutableArray alloc]init];
    [self initCollectionView];
    [self configureNetWorkSubscription];
}

- (void)addRightBtn {
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"close" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedOKbtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)onClickedOKbtn {
    NSLog(@"onClickedOKbtn");
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark  设置CollectionView的的参数
- (void) initCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置CollectionView的属性
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT ) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = YES;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    //注册Cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"WXLiveShowCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"WXLiveShowCollectionViewCell"];
}

#pragma mark  设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark  设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrayList_row.count;
    
}

#pragma mark  设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"WXLiveShowCollectionViewCell";
    WXLiveShowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    WXDatum *p = self.arrayList_row[indexPath.row];
    cell.model = p;
    return cell;
}



#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(SCREEN_WIDTH /2 - 15,(SCREEN_WIDTH / 2- 15));
}



#pragma mark  定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, (self.arrayList_row.count / 2 - 15) * SCREEN_WIDTH / 2 - 15, 10);//（上、左、下、右）
}


#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark  点击CollectionView触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    WXDatum *p = self.arrayList_row[indexPath.item];
//    NSLog(@"---------------------%@",p.anchor.push_video_add);
//    NSLog(@"---------------------%@",p.anchor.push_video_add2);
//    NSLog(@"---------------------%@",p.anchor.video_address_suffix);
//
//    WXPlayShowController *vc = [[WXPlayShowController alloc]init];
//    vc.urlNst = [NSString stringWithFormat:@"%@",p.download_video_add];
//
//    [self.navigationController pushViewController:vc animated:YES];
    
    WXDatum *p = self.arrayList_row[indexPath.row];
     WXPlayShowController *vc = [[WXPlayShowController alloc]init];
     vc.urlNst = [NSString stringWithFormat:@"%@",p.url];
    [self presentViewController:vc animated:YES completion:nil];
//
//    [self configureDidSelectNetWorkSubscription:p.room_id CallBack:^(WXLiveShowingModel* responseObject) {
//        NSLog(@"%@",responseObject.play_url);
//            WXPlayShowController *vc = [[WXPlayShowController alloc]init];
//        if (responseObject.play_url.length < 10) {
//            vc.urlNst = [NSString stringWithFormat:@"%@",responseObject.preview_play_url];
//
//        }else{
//            vc.urlNst = [NSString stringWithFormat:@"%@",responseObject.play_url];
//
//        }
//            [self.navigationController pushViewController:vc animated:YES];
//
//    }];
    
    
}

#pragma mark  设置CollectionViewCell是否可以被点击
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configureNetWorkSubscription{
    
    NSDictionary *diction = @{
                              @"num":@"1000000",
                              @"platform":@"ios",
   
                              };

    
    AFHTTPSessionManager *NetWork = [AFHTTPSessionManager manager];
    NetWork.requestSerializer.timeoutInterval = 10.f;
    NetWork.requestSerializer = [AFJSONRequestSerializer serializer];
    NetWork.responseSerializer = [AFJSONResponseSerializer serializer];
    NetWork.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    //http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xiamo
    //http://lfonyjb.cn/api_taiyang.php?pt=taiyang_YOBF
    [NetWork GET:self.urlList parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        WXLiveShowModel *model = [WXLiveShowModel mj_objectWithKeyValues:responseObject];
        self.arrayList_row = model.data;
        
        [self.collectionView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败-------%@",error);
        
    }];
    
}


-(void)configureDidSelectNetWorkSubscription:(NSString *)room_id
    CallBack: (void (^)(id responseObject))callBack{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];

    //2.设置参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];

    params[@"act"] = @"get_video2";
    params[@"ctl"] = @"video";
    params[@"is_vod"] = @"0";
    params[@"room_id"] = room_id;//40575
    params[@"sdk_type"] = @"ios";
    params[@"sdk_version"] = @"2018081618";
    params[@"sdk_version_name"] = @"2.5.0";
    params[@"sign"] = @"55311eba44a4be46393a49cecb61ea70";
    params[@"xpoint"] = @"116.414119";
    params[@"ypoint"] = @"39.951616";
    
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"PHPSESSID2=m6vadoj2cgf6le9ubev5jk21a2;client_ip=60.10.114.133;nick_name:178528;user_id=178528;user_pwd=9c73b488299fc67e51cce5d631fdf1e5;PHPSESSID=m6vadoj2cgf6le9ubev5jk21a2"] forHTTPHeaderField:@"Cookie"];
    
//    NSString *sessionString = @"session_1_2";
//    [manager.requestSerializer setValue:sessionString forHTTPHeaderField:@"Cookie"];

    
    
    //nick_name    178528user_pwd    9c73b488299fc67e51cce5d631fdf1e5     m6vadoj2cgf6le9ubev5jk21a2
//http://www.asrv001.com/mapi/index.php
    [manager GET:@"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_youmeng" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        WXLiveShowingModel *model = [WXLiveShowingModel mj_objectWithKeyValues:responseObject];
        callBack(model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败-------%@",error);

    }];

}



@end
