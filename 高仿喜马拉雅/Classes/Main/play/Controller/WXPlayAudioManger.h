//
//  WXPlayAudioManger.h
//  高仿喜马拉雅
//
//  Created by 深海小飞象🐙哥 on 2017/6/16.
//  Copyright © 2017年 jiahedeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AEAudioFilePlayer.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
@interface WXPlayAudioManger : NSObject
singleton_interface(WXPlayAudioManger);

/** 音频  */
@property (nonatomic, strong) AEAudioFilePlayer *selectedSongCH1Player;
/** <#注释#>  */
@property (nonatomic, strong) AEAudioController *audioController;
@property (strong, nonatomic) AVAudioPlayer * player;
@property (strong, nonatomic) NSTimer *timer;
/**
 播放音频

 @param songURL URL
 */
- (void)playerInitialize:(NSURL *)songURL;
- (void)setPlayingInfo:(NSString *)title name:(NSString *)name;

@end
