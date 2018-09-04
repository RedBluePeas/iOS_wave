//
//  MGWave.m
//  MGStock
//
//  Created by 姜艳昌 on 2017/12/14.
//  Copyright © 2017年 ningbomaiguo. All rights reserved.
//

#import "MGWave.h"

//屏幕宽
#define MainScreenWidth         [UIScreen mainScreen].bounds.size.width
//屏幕高
#define MainScreenHeight        [UIScreen mainScreen].bounds.size.height

//颜色
#define COLORHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation MGWave

+ (instancetype)defaultWave
{
    MGWave *wave = [MGWave layer];
    wave.waveSpeed = 1.0;
    wave.waveHeight = 10;
    wave.waveX = 0.0;
    wave.cycleWidth = MainScreenWidth;
    wave.waveColor = COLORHEX(0xFB3C25);
    
    return wave;
}

@end
