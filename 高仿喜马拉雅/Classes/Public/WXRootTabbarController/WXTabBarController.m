//
//  WXTabBarController.m
//  MyHealth
//
//  Created by 甲和灯 on 16/10/9.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "WXTabBarController.h"
#import "WXNavigationController.h"
#import "WXDiscoverViewController.h"
#import "WXHomeViewController.h"
#import "WXMineViewController.h"
#import "WXPlayViewController.h"
#import "WXLiveShowController.h"
#import "WXLiveShowMainController.h"

#import "WXSubscriptionViewController.h"
#import "WX416LiveViewController.h"
#import "HWTabBar.h"

#import "WBShareView.h"

@interface WXTabBarController ()<HWTabBarDelegate,WBShareViewDelegate,WBShareViewDataSource>

@end

@implementation WXTabBarController
//- (void)viewWillLayoutSubviews{
//    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
//    tabFrame.size.height = 40;
//    tabFrame.origin.y = self.view.frame.size.height - 40;
//    self.tabBar.frame = tabFrame;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChildControllers];
}
#pragma mark - Private Methods
- (void)setupChildControllers
{
    
    // 1.初始化子控制器
    WXHomeViewController *home = [[WXHomeViewController alloc] init];
    [self addChildVc:home title:@"首页" image:@"雅购圈_n" selectedImage:@"雅购圈"];
    
    WXSubscriptionViewController *messageCenter = [[WXSubscriptionViewController alloc] init];
    [self addChildVc:messageCenter title:@"d订阅" image:@"星星_n" selectedImage:@"星星"];
    
    WXDiscoverViewController *discover = [[WXDiscoverViewController alloc] init];
    [self addChildVc:discover title:@"发现" image:@"发现_n" selectedImage:@"发现"];
    
    WXMineViewController *profile = [[WXMineViewController alloc] init];
    [self addChildVc:profile title:@"我" image:@"我的_n" selectedImage:@"我的"];
    

    HWTabBar *tabBar = [[HWTabBar alloc] init];
    tabBar.delegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
    [self.tabBar setBackgroundImage:[UIImage createImageWithColor:UIColorFromRGB(0xFBFBFB)]];
    //self.tabBar.shadowImage = [[UIImage alloc] init];
    [self.tabBar setShadowImage:[UIImage imageWithColor:UIColorFromRGB(0xEDEDED) size:CGSizeMake(SCREEN_WIDTH,0.5)]];

}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    //childVc.title = title; // 同时设置tabbar和navigationBar的文字
   childVc.tabBarItem.title = title; // 设置tabbar的文字
    //    childVc.navigationItem.title = title; // 设置navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = UIColorFromRGB(0x939393);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = UIColorFromRGB(0xF66549);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    //    childVc.view.backgroundColor = HWRandomColor;
    // 先给外面传进来的小控制器 包装 一个导航控制器
    WXNavigationController *nav = [[WXNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HWTabBarDelegate代理方法
- (void)tabBarDidClickPlusButton:(HWTabBar *)tabBar
{
//    WXLiveShowController *vc = [[WXLiveShowController alloc] init];
//    WXNavigationController *control = [[WXNavigationController alloc]initWithRootViewController:vc];
//    [self presentViewController:control animated:YES completion:nil];
    
    
//        WXLiveShowMainController *vc = [[WXLiveShowMainController alloc] init];
//        WXNavigationController *control = [[WXNavigationController alloc]initWithRootViewController:vc];
//        [self presentViewController:control animated:YES completion:nil];
    
//            WX416LiveViewController *vc = [[WX416LiveViewController alloc] init];
//            WXNavigationController *control = [[WXNavigationController alloc]initWithRootViewController:vc];
//            [self presentViewController:control animated:YES completion:nil];
    WBShareView *view = [[WBShareView alloc]initWithHigh:300];
    //[self.view addSubview:view];
    //view.lineNumber = 3;
    view.imgUnderlySize = CGSizeMake(44, 44);
    view.cancelCor = [UIColor whiteColor];
    view.rowAdaption = YES;
    view.delegate = self;
    view.dataSource = self;
    view.lineIconText = @[@[@"q",@"w",@"e",@"r",@"r",@"r",@"r",@"r",@"r",@"r"]];
    view.lineIconImg = @[@[IMG(@"copy"),IMG(@"copy"),IMG(@"copy"),IMG(@"copy"),IMG(@"copy"),IMG(@"copy"),IMG(@"copy"),IMG(@"copy"),IMG(@"copy"),IMG(@"copy")]];
    [view showInView:self.view];
    
}

- (NSInteger)numberOfSectionsInWBShareView:(UIView *)wbShareView{
    return 1;
}
- (CGFloat)wbShareView:(UIView *)wbShareViewheightForRow{
    return 100;
}
- (BOOL)wbShareViewLable:(UILabel *)lable hideCaptionForRowAtIndexPath:(int)indexPath{
    
    if (indexPath == 0) {
        lable.font = [UIFont systemFontOfSize:12];
        return NO;
    }
    return YES;
}

- (BOOL)wbShareViewlineView:(UIView *)lineView hideCaptionForRowAtIndexPath:(int)indexPath{
    lineView.backgroundColor = [UIColor purpleColor];
    if (indexPath == 2) {
        return YES;
    }
    
    return NO;
}
- (NSString *)wbShareViewLableTitle:(UILabel *)lable titleForRowAtIndexPath:(int)indexPath{
    return @"打开";
}

- (UIColor *)wbShareViewContentView:(UIView *)contentView colorForRowAtIndexPath:(int)indexPath{
    return [UIColor colorWithRed:188/255.0 green:192/255.0 blue:192/255.0 alpha:0.4];
}
- (void)wbShareView:(UIView *)wbShareView didSelectRowAtIndexPath:(long)indexPath ColumnAtIndexPath:(long)indexColumn{
    NSLog(@"%@--%ld--%ld",wbShareView,indexPath,indexColumn);
    WX416LiveViewController *vc = [[WX416LiveViewController alloc] init];

    if (indexColumn == 0) {
        vc.url1 = @"http://www.221751.com/mobile/live/index";
        vc.url2 = @"http://www.221751.com/mobile/live/anchors";
        vc.token = @"3721318294b835a03db52c071441ad20";

    }else if (indexColumn == 1){
        
        vc.url1 = @"http://missvip.top/mobile/live/index";
        vc.url2 = @"http://missvip.top/mobile/live/anchors";
        vc.token = @"3d489a026b684ab60b7888d34956c0f7";

     
    }
    else if (indexColumn == 2){
        
        vc.url1 = @"http://chengzi888.top/mobile/live/index";
        vc.url2 = @"http://chengzi888.top/mobile/live/anchors";
        vc.token = @"45345b0289519fd60aae4e3a18fac987";
        
        
    }
    
    WXNavigationController *control = [[WXNavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:control animated:YES completion:nil];
}
@end
