//
//  WXMineViewController.m
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/25.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "WXMineViewController.h"
#import "WXUserInfoModel.h"
@interface WXMineViewController ()<UITableViewDataSource, UITableViewDelegate>{
    UIView *viewBG;
}
@property(nonatomic, strong)UITableView     *tableView;
@property(nonatomic, strong)UIImageView     *headerBackView;        // 头像背景图片
@property(nonatomic, strong)UIImageView     *photoImageView;        // 头像图片
@property(nonatomic, strong)UILabel         *userNameLabel;         // 用户名label
@property(nonatomic, strong)UILabel         *introduceLabel;        // 简介label
@property(nonatomic, strong)UIView          *tableViewHeaderView;   // tableView头部视图
@property(nonatomic, strong) UIImageView *imageIntro;//会员
@property(nonatomic, assign)NSInteger       imageHeight;            // 背景图片的高度
@property(nonatomic, strong) WXUserInfoModel *model;

@end

@implementation WXMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    _imageHeight = 220;// 背景图片的高度
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    [self createTableViewHeaderView];
    if ([Oauth read].uid == 0) {
        [self configureNetWorkSubscription];
    }
    else{
        [self setupValue];
    }
}
- (void)setupLabel:(UILabel *)lable{
    lable.numberOfLines = 1;//根据最大行数需求来设置
    lable.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize maximumLabelSize = CGSizeMake(320, 20);//labelsize的最大值
    CGSize expectSize = [lable sizeThatFits:maximumLabelSize];
    lable.width = expectSize.width;
    _imageIntro.x = lable.right +8;
}
- (void)setupValue{
    [_headerBackView sd_setImageWithURL:URL([Oauth read].backgroundLogo) placeholderImage:IMG(@"shopping3")];
    [_photoImageView sd_setImageWithURL:URL([Oauth read].mobileLargeLogo) placeholderImage:IMG(@"shopping3")];
    _userNameLabel.text = [Oauth read].nickname;
    [self setupLabel:_userNameLabel];
    _introduceLabel.text = [NSString stringWithFormat:@"关注 %ld    |    粉丝 %ld",(long)[Oauth read].followings,(long)[Oauth read].followers];
}
#pragma mark - 创建头视图
- (void)createTableViewHeaderView
{
    _tableViewHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, _imageHeight + 100)];
    
    // 背景图
    _headerBackView = [[UIImageView alloc] init];
    _headerBackView.contentMode = UIViewContentModeScaleAspectFill;
    _headerBackView.frame = CGRectMake(0, 0, SCREEN_WIDTH, _imageHeight);
    [_tableViewHeaderView addSubview:_headerBackView];
    
    // 头像
    _photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 76, 80, 80)];
    [self.tableViewHeaderView addSubview:self.photoImageView];
    ViewBorderRadius(_photoImageView, 40, 4, UIColorFromRGB(0x95A1AC));
    // 用户名
    _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_photoImageView.right + 12, _photoImageView.centerY - 12, SCREEN_WIDTH -(_photoImageView.right + 12 ) * 2, 20)];
    _userNameLabel.font = BOLDSYSTEMFONT(20);
    _userNameLabel.textAlignment = 1;
    _userNameLabel.textColor = [UIColor whiteColor];
    [_tableViewHeaderView addSubview:self.userNameLabel];
    
    _imageIntro = [[UIImageView alloc]init];
    _imageIntro.frame = CGRectMake(_userNameLabel.right +8, _userNameLabel.y, 60, _userNameLabel.height);
    _imageIntro.backgroundColor = UIColorFromRGB(0xfafafa);
    [_tableViewHeaderView addSubview:_imageIntro];

    // 简介
    _introduceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_userNameLabel.x, CGRectGetMaxY(_userNameLabel.frame) + 8, SCREEN_WIDTH, 20)];
    _introduceLabel.text = @"他强任他强,我干我的羊";
    _introduceLabel.textAlignment = 0;
    _introduceLabel.font = [UIFont systemFontOfSize:12];
    _introduceLabel.textColor = [UIColor whiteColor];
    [_tableViewHeaderView addSubview:_introduceLabel];
    viewBG = [[UIView alloc]initWithFrame:CGRectMake(0, 220 - 46, SCREEN_WIDTH, 50)];
    viewBG.backgroundColor = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:0.35];
    [_tableViewHeaderView addSubview:viewBG];

    [self setupAutoMarginViewsWithCount:3 itemWidth:50];
    
    
    UIView *viewBoottom = [[UIView alloc]initWithFrame:CGRectMake(0, viewBG.bottom, SCREEN_WIDTH, _tableViewHeaderView.height - viewBG.bottom + 50)];
    viewBoottom.backgroundColor = UIColorFromRGB(0xF4F5F7);
    [_tableViewHeaderView addSubview:viewBoottom];
    UIButton *buttonRecord = [[UIButton alloc]initWithFrame:CGRectMake(20, 24, SCREEN_WIDTH - 40, 44)];
    buttonRecord.backgroundColor = UIColorFromRGB(0xF6664A);
    ViewRadius(buttonRecord, 22);
    [viewBoottom addSubview:buttonRecord];
    [buttonRecord setImage:[UIImage imageNamed:@"ic_rec_w"] forState:UIControlStateNormal];
    [buttonRecord setTitle:@"开始录音" forState:UIControlStateNormal];
    
    UIButton *buttonHost = [[UIButton alloc]initWithFrame:CGRectMake(20, buttonRecord.bottom + 12, SCREEN_WIDTH - 40, 44)];
    buttonHost.backgroundColor = [UIColor whiteColor];
    
    ViewBorderRadius(buttonHost, 22, 1, kBSColorBorderGray);
    [viewBoottom addSubview:buttonHost];
    [buttonHost setImage:[UIImage imageNamed:@"ic_jmgl"] forState:UIControlStateNormal];
    [buttonHost setTitle:@"主播中心" forState:UIControlStateNormal];
    [buttonHost setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    self.tableView.tableHeaderView = _tableViewHeaderView;
}
// 设置一排固定宽度自动间距子view
- (void)setupAutoMarginViewsWithCount:(NSInteger)count itemWidth:(CGFloat)itemWidth
{
    NSMutableArray *temp = [NSMutableArray new];
    NSArray *title = @[@"历史",@"订阅",@"下载"];
    NSArray *image = @[IMG(@"me_setting_account"),IMG(@"me_setting_account"),IMG(@"me_setting_account")];

    for (int i = 0; i < count; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor clearColor];
        [viewBG addSubview:view];
        view.sd_layout.autoHeightRatio(1); // 设置高度约束
        [temp addObject:view];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(12.5, 7.5, 25, 25)];
        imageView.image = image[i];
        [view addSubview:imageView];
        
        UILabel *lableView = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.bottom, 50, 15)];
        lableView.textAlignment = NSTextAlignmentCenter;
        lableView.textColor = [UIColor whiteColor];
        lableView.text = title[i];
        lableView.font = SYSTEMFONT(15);
        [view addSubview:lableView];
    }
    // 此步设置之后_autoMarginViewsContainer的高度可以根据子view自适应
    [viewBG setupAutoMarginFlowItems:[temp copy] withPerRowItemsCount:3 itemWidth:itemWidth verticalMargin:25 verticalEdgeInset:0 horizontalEdgeInset:25];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat width = self.view.frame.size.width;// 图片的宽度
    CGFloat yOffset = scrollView.contentOffset.y;// 偏移的y值
    if (yOffset < 0) {
        CGFloat totalOffset = _imageHeight + ABS(yOffset);
        CGFloat f = totalOffset / _imageHeight;
        self.headerBackView.frame = CGRectMake(- (width * f - width) / 2, yOffset, width * f, totalOffset - 100);// 拉伸后的图片的frame应该是同比例缩放
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}


-(void)configureNetWorkSubscription{
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970] *1000;
    long long dTime = [[NSNumber numberWithDouble:interval] longLongValue]; // 将double转为long long型
    NSString *curTime = [NSString stringWithFormat:@"%llu",dTime]; // 输出long long型
    NSDictionary *diction = @{
                              @"device":@"iPhone",
                              @"uid":@"3185651",
                              };
    //NSString *URLString = [NSString stringWithFormat:@"http://140.207.215.242/mobile/v1/artist/intro/ts-%@",curTime];//用户介绍
    NSString *URLString = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/v1/homePage/ts-%@",curTime];//用户介绍
    AFHTTPSessionManager *NetWork = [AFHTTPSessionManager manager];
    NetWork.requestSerializer.timeoutInterval = 10.f;
    NetWork.requestSerializer = [AFJSONRequestSerializer serializer];
    NetWork.responseSerializer = [AFJSONResponseSerializer serializer];
    NetWork.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    [NetWork.requestSerializer setValue:[NSString stringWithFormat:@"domain=.ximalaya.com; path=/; channel=ios-b1; 1&_device=iPhone&DD487C68-B834-48DB-B832-89E419067A76&6.3.6; impl=com.gemd.iting; NSUP=42E8D0BB421FCD471497255591690; XUM=DD487C68-B834-48DB-B832-89E419067A76; c-oper=; net-mode=WIFI; res=6401136; 1&_token=3185651&53cb3fcf0c63e04aef086fc0d99ff977341c; idfa=DD487C68-B834-48DB-B832-89E419067A76; x_xmly_ts=%@; x_xmly_resource=xm_sourcehomepage; x_xmly_tid=3351711401",curTime] forHTTPHeaderField:@"Cookie"];

    [NetWork GET:URLString parameters:diction progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = responseObject;
        MHLog(@"%@",responseObject);
        if ([dic[@"ret"] intValue] == 50) {
            ALERT_MSG(@"提示", @"请登录");
            [self setupValue];
            return ;
        }
        else{
            _model = [WXUserInfoModel mj_objectWithKeyValues:dic];
            [Oauth save:_model];
            [self setupValue];
        }

     
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败-------%@",error);
        
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
