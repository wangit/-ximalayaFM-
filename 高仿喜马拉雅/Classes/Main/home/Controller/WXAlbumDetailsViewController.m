//
//  WXAlbumDetailsViewController.m
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/13.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import "WXAlbumDetailsViewController.h"
#import "WXAlbumTracks.h"
#import "WXAlbumDetailsHeadView.h"
#import "WXSegmentedControl.h"
#import "WXAlbumTableViewCell.h"
#import "WXPlayViewController.h"
#define UserCellIdetifeir @"WXAlbumTableViewCell"
#define tableViewCel @"tableViewCel"

@interface WXAlbumDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *arrayUserDetails;
@property(nonatomic,strong)NSMutableArray *arrayUser;
@property(nonatomic,strong)NSMutableArray *arrayTracks;
@property(nonatomic, strong)UITableView     *tableView;
@property(nonatomic, strong)UIView          *tableViewHeaderView;   // tableView头部视图
@property(nonatomic, strong) WXAlbumDetailsHeadView *aaView;
@property (nonatomic, strong) WXSegmentedControl *segmentControl;
@property (nonatomic, strong) WXAlbumDetailsModel *model;
@property (nonatomic, assign) BOOL isChange;

@end

@implementation WXAlbumDetailsViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        _arrayUserDetails = [[NSMutableArray alloc]init];
        _arrayUser = [[NSMutableArray alloc]init];
        _arrayTracks = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"WXAlbumTableViewCell" bundle:nil] forCellReuseIdentifier:UserCellIdetifeir];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCel];

    [self createTableViewHeaderView];
    [self ssss];
}
- (void)createTableViewHeaderView
{
    _tableViewHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 170 + 44 +44)];
    _aaView = [[[NSBundle mainBundle] loadNibNamed:@"WXAlbumDetailsHeadView" owner:self options:nil] lastObject];
    [_tableViewHeaderView addSubview:_aaView];
    UIView *viewLine = [[UIView alloc]initWithFrame:CGRectMake(0, _aaView.bottom + 36, SCREEN_WIDTH, 10)];
    viewLine.backgroundColor = kBSColorSeparatorLine;
    [_tableViewHeaderView addSubview:viewLine];
    [_tableViewHeaderView addSubview:self.segmentControl];

    self.tableView.tableHeaderView = _tableViewHeaderView;

}
- (WXSegmentedControl *)segmentControl
{
    WEAKSELF
    if (!_segmentControl) {
        
        _segmentControl = [[WXSegmentedControl alloc] initWithFrame:CGRectMake(0, 170 + 44, SCREEN_WIDTH, 44) arrTitles:@[@"详情",[NSString stringWithFormat:@"节目%ld",(long)_model.tracks]]];

        _segmentControl.selectedSegmentIndex = 1;
        _isChange = YES;
        [_segmentControl setIndexChangeBlock:^(NSInteger index) {
            if (0 == index) {
                _isChange = NO;
                [weakSelf.tableView reloadData];
            }else if (1 == index) {
                _isChange = YES;
                [weakSelf.tableView reloadData];
                
            }
        }];
    }
    return _segmentControl;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_isChange) {
        return self.arrayTracks.count;
    }
    else{
        return 10;
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset = scrollView.contentOffset.y;// 偏移的y值
    if (yOffset>=200) {
        _segmentControl.y = yOffset;
    }
    else if (yOffset <200){
        _segmentControl.y =170 + 44;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_isChange) {
        WXAlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UserCellIdetifeir forIndexPath:indexPath];
        WXAlbumTracks *model = [WXAlbumTracks mj_objectWithKeyValues:self.arrayTracks[indexPath.row]];
        cell.model = model;
        return cell;
    }
    else{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCel forIndexPath:indexPath];
        return cell;

    }

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WXAlbumTracks *model = [WXAlbumTracks mj_objectWithKeyValues:self.arrayTracks[indexPath.row]];

    WXPlayViewController *play = [[WXPlayViewController alloc]init];
    play.audioMusic = model;
    [self presentViewController:play animated:YES completion:nil];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(void)ssss{
    MHLog(@"%ld",(long)[Oauth read].uid);
    NSDictionary *diction = @{
                              @"albumId":_AlbumID,
                              @"device":@"iPhone",
                              @"pageSize":@"20",
                              @"source":@"0",
                              @"statEvent":@"pageview/album@5318508",
                              @"statModule":@"猜你喜欢",
                              @"statPage":@"tab@发现_推荐",
                              };

    [[WXNetworking sharedWXNetworking] MHNetGetUrl:[NSString stringWithFormat:@"http://140.207.215.247/mobile/v1/album/ts-%@",[self intervalTime]] Data:diction errcodeBlock:^(id  _Nullable data) {
        
    } SuccessBlock:^(id  _Nullable data) {
        NSDictionary *dict = data;
        _arrayUserDetails = dict[@"data"][@"album"];
        _model = [WXAlbumDetailsModel mj_objectWithKeyValues:_arrayUserDetails];
        _aaView.model =_model;
        
        MHLog(@"%@",_arrayUserDetails);
        _arrayUser = dict[@"data"][@"user"];
        MHLog(@"%@",_arrayUser);
        //tracks
        NSArray *dictList = dict[@"data"][@"tracks"][@"list"];
        for (NSDictionary *user in dictList) {
            WXAlbumTracks *model = [WXAlbumTracks mj_objectWithKeyValues:user];
            [self.arrayTracks addObject:model];
        }
        MHLog(@"%lu",(unsigned long)self.arrayTracks.count);
        [_segmentControl setSectionTitles:@[@"详情",[NSString stringWithFormat:@"节目（%ld）",(long)_model.tracks]]];
        [self.tableView reloadData];
    } FailureBlock:^(id  _Nullable data) {
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
