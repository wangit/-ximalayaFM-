//
//  WXPlayAudioManger.m
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/16.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import "WXPlayAudioManger.h"

@implementation WXPlayAudioManger
singleton_implementation(WXPlayAudioManger);

#pragma mark - 音频播放
- (void)playNewSongCH1:(NSURL *)songURL {
    if (_selectedSongCH1Player) {
        [_audioController removeChannels:@[_selectedSongCH1Player]];
        _selectedSongCH1Player = nil;
    }
    // 创建AEAudioFilePlayer对象
    _selectedSongCH1Player = [[AEAudioFilePlayer alloc] initWithURL:songURL error:nil];
    
    // 进行播放
    [_audioController addChannels:@[_selectedSongCH1Player]];
}
- (void)playerInitialize:(NSURL *)songURL{
    NSData *data = [NSData dataWithContentsOfURL:songURL];
    
    NSError *error = nil;
    //初始化一个音频对象，播放一首就要初始化一次，同时会把之前内容给遗弃。比如正在播放时切换一首歌，就需要重新调用下面代码。
    _player = [[AVAudioPlayer alloc] initWithData:data error:nil];
    //一首歌播放次数：负数--无限循环，0--播放一次，1--播放2次，2--播放3此，以此类推
    _player.numberOfLoops = 0;
    //音量
    _player.volume = 0.5;
    [_player prepareToPlay];
    if (error) {
        NSLog(@"%@",error.localizedDescription);
    }
    [_player play];
    //设置锁屏仍能继续播放
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
    }
}
-(void)updateProgress{
    //进度条显示播放进度
    MHLog(@"%@",[NSString stringWithFormat:@"当前播放时间%f",self.player.currentTime])
}
- (void)stop{
    [self.player stop];
}
-(void)pause{
    [self.player pause];

}

- (void)setPlayingInfo:(NSString *)title name:(NSString *)name {
    //    设置后台播放时显示的东西，例如歌曲名字，图片等
    MPMediaItemArtwork *artWork = [[MPMediaItemArtwork alloc] initWithImage:IMG(@"header_icon")];
    
    NSDictionary *dic = @{MPMediaItemPropertyTitle:title,
                          MPMediaItemPropertyArtist:name,
                          MPMediaItemPropertyArtwork:artWork
                          };
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:dic];
}
@end
