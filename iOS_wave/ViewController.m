//
//  ViewController.m
//  iOS_wave
//
//  Created by 姜艳昌 on 2018/9/3.
//  Copyright © 2018年 jiang. All rights reserved.
//

#import "ViewController.h"
#import "MGWaveView.h"

@interface ViewController ()

@property (nonatomic, strong) MGWaveView *waveView;

@end

//屏幕宽
#define MainScreenWidth         [UIScreen mainScreen].bounds.size.width
//屏幕高
#define MainScreenHeight        [UIScreen mainScreen].bounds.size.height

//颜色
#define COLORHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.waveView];
    [self.waveView startWaveAnimate];
    
    for (int i=0; i<4; i++) {
        
    }
}

- (MGWaveView *)waveView
{
    if (!_waveView) {
        _waveView = [[MGWaveView alloc] init];
        _waveView.frame = CGRectMake(0, 0, MainScreenWidth, 240);
        //加背景图
        _waveView.image = [UIImage imageNamed:@"mine_ic_headbg"];
        for (int i=0; i<2; i++) {
            MGWave *wave = [MGWave defaultWave];
            wave.waveSpeed = 0.03;
            wave.waveHeight = 5;
            wave.cycleWidth = MainScreenWidth;
            if (i==0) {
                wave.waveX = 0;
                wave.waveColor = [[UIColor whiteColor] colorWithAlphaComponent:0.4];
            }else{
                wave.waveX = 10;
                wave.waveColor = [UIColor whiteColor];
            }
            [_waveView addWave:wave];
        }
    }
    return _waveView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
