//
//  WX416LiveViewController.m
//  高仿喜马拉雅
//
//  Created by 小帅哥 on 2019/5/31.
//  Copyright © 2019 jiahedeng. All rights reserved.
//

#import "WX416LiveViewController.h"
#import "WX416AnchorsController.h"

#import "WX416LiveModel.h"
static NSString * identifier = @"cxCellID";
static CGFloat kMagin = 10.f;
static NSString * headIdentifier = @"cxHeadID";

@interface WX416LiveViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSArray * arrayList_row;
@end

@implementation WX416LiveViewController
#pragma mark - set_and_get
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        //自动网格布局
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        
        CGFloat itemWidth = (self.view.frame.size.width - 4 * kMagin) / 3;
        
        //设置单元格大小
        flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth);
        //最小行间距(默认为10)
        flowLayout.minimumLineSpacing = 10;
        //最小item间距（默认为10）
        flowLayout.minimumInteritemSpacing = 10;
        //设置senction的内边距
        flowLayout.sectionInset = UIEdgeInsetsMake(kMagin, kMagin, kMagin, kMagin);
        //设置UICollectionView的滑动方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //sectionHeader的大小,如果是竖向滚动，只需设置Y值。如果是横向，只需设置X值。
        flowLayout.headerReferenceSize = CGSizeMake(0,0);
        //网格布局
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49) collectionViewLayout:flowLayout];
        //注册cell
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
        //注册header
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headIdentifier];
        //设置数据源代理
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];

    }
    return _collectionView;
    
}

- (void)addRightBtn {
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"close" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedOKbtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)onClickedOKbtn {
    NSLog(@"onClickedOKbtn");
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayList_row = [[NSArray alloc]init];
    
    [self addRightBtn];
    [self.view addSubview:self.collectionView];
    
    [self configureNetWorkSubscription];
}
#pragma mark - deleDate
//有多少的分组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
    
}
//每个分组里有多少个item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrayList_row.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //根据identifier从缓冲池里去出cell
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIView *imag = [[UIView alloc]initWithFrame:CGRectMake(10, 10, (self.view.frame.size.width - 4 * kMagin) / 3 , (self.view.frame.size.width - 4 * kMagin) / 3 )];
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, view.bottom, imag.width, 22)];
    
    lable.font = [UIFont systemFontOfSize:14];

    [imag addSubview:view];
    [imag addSubview:lable];

    cell.backgroundView = imag;
    
    
    WX416List *model = self.arrayList_row[indexPath.row];
    [view sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:nil];
    lable.text = [NSString stringWithFormat:@"%@---%@",model.title,model.number];
    
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WX416List *model = self.arrayList_row[indexPath.row];
    WX416AnchorsController *vc = [[WX416AnchorsController alloc]init];
    vc.name = model.name;
    vc.url = self.url2;
    vc.token = self.token;
    [self.navigationController pushViewController:vc animated:YES];
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
    [NetWork POST:self.url1 parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        WX416LiveModel *model = [WX416LiveModel mj_objectWithKeyValues:responseObject];
        self.arrayList_row = model.data.lists;
        
        [self.collectionView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败-------%@",error);
        
    }];
    
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
