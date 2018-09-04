//
//  MGWave.h
//  MGStock
//
//  Created by 姜艳昌 on 2017/12/14.
//  Copyright © 2017年 ningbomaiguo. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "MGWave.h"

@interface MGWave : CAShapeLayer

/*
 y =Asin（ωx+φ）+C
 A 表示振幅，也就是使用这个变量来调整波浪的高度
 ω表示周期，也就是使用这个变量来调整在屏幕内显示的波浪的数量
 φ表示波浪横向的偏移，也就是使用这个变量来调整波浪的流动
 C表示波浪纵向的位置，也就是使用这个变量来调整波浪在屏幕中竖直的位置。
 */

/**
 *  浪速
 */
@property (nonatomic, assign) CGFloat waveSpeed;
/**
 *  浪高
 */
@property (nonatomic, assign) CGFloat waveHeight;

/**
 *  波浪x轴偏离
 */
@property (nonatomic, assign) CGFloat waveX;

/**
 *  波浪周期
 */
@property (nonatomic, assign) CGFloat cycleWidth;

/**
 *  实浪颜色
 */
@property (nonatomic, strong) UIColor *waveColor;

+ (instancetype)defaultWave;

@end
