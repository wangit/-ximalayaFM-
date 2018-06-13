//
//  WXPlayViewController.m
//  高仿喜马拉雅
//
//  Created by 甲和灯 on 2016/11/25.
//  Copyright © 2016年 jiahedeng. All rights reserved.
//

#import "WXPlayViewController.h"
#import "WXPlayAudioManger.h"
@interface WXPlayViewController ()

@end

@implementation WXPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [[WXPlayAudioManger sharedWXPlayAudioManger] playerInitialize:URL(_audioMusic.playPathAacv224)];
    [[WXPlayAudioManger sharedWXPlayAudioManger] setPlayingInfo:_audioMusic.title name:_audioMusic.nickname];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
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
