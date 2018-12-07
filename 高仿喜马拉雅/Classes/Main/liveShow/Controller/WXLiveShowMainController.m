//
//  WXLiveShowMainController.m
//  高仿喜马拉雅
//
//  Created by 小帅哥 on 2018/12/7.
//  Copyright © 2018 jiahedeng. All rights reserved.
//

#import "WXLiveShowMainController.h"
#import "WXLiveShowController.h"

@interface WXLiveShowMainController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,strong)NSArray *arrayList_row;

@end

@implementation WXLiveShowMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRightBtn];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT, SCREEN_HEIGHT - 88)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}
- (void)addRightBtn {
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"close" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedOKbtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)onClickedOKbtn {
    NSLog(@"onClickedOKbtn");
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayList_row count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.arrayList_row objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

        WXLiveShowController *vc = [[WXLiveShowController alloc] init];
        vc.urlList = [self.arrayList_row objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
}

- (NSArray *)arrayList_row{

    if (_arrayList_row == nil) {
        _arrayList_row = @[
                           
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xiaobaobei",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_youmeng",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_aike",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_qixiannu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xiamo",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_kawayi",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_pikaqiu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_huihui",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xiaomimei",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_YOBF",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_chijiunan",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_qingqu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xiaolajiao",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_mengmei",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xiaojingling",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_sequ",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xiaoshimei",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_ailian",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_zhuoyao",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_yidianyuan",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_yenulang",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_youguo",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_mengjing",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_huajian",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xiaoying",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_mitao",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_lanmao",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_moon",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xiaomonu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_yechun",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_mingliu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_niuniu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_maotouying",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_ouyu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xingbo",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_jiudian",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_tianmi",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_ruxiang",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_qianshou",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_qingxin",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_jiaomei",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_yanhou",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_yingke",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_sile",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_wenxiangshe",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xiaomifeng",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_woniu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xihuanni",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_yumeng",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_meirenzhuang",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_shuangyue",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_laosiji",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_yehu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_shuangdie",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_fengkuang",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_longzhu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_Dancelife",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_yelaixiang",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_ningxiang",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_bale",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_lanyueliang",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_yelu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_jiaochuan",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_zhaocaimao",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_linglong",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_jiatelin",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_sky",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_yile",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_mitang",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_haojiyou",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_mangguopai",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_meiyan",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_yuhuo",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_taxiu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xiaohuizi",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_tangguo",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_baoyu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xingyunxing",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_fengliu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_shuimeiren",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_huaxianzi",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_jinbei",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xingguang",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_qiqi",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_yeyan",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_douyin",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_jiuweihu",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_903yule",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_tanke",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_youwudao",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xiaoyao",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_chunban",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_quanqiuying",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_xiaomiaochong",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_tuhao",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_yuezhibo",
                           @"http://lfonyjb.cn/api_taiyang.php?pt=taiyang_903yule",

                           
                           ];
    }
    return _arrayList_row;
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
