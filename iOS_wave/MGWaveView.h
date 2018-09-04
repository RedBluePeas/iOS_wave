//
//  MGWaveView.h
//  MGStock
//
//  Created by 姜艳昌 on 2017/12/14.
//  Copyright © 2017年 ningbomaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGWave.h"

@interface MGWaveView : UIImageView

/**
 *  添加波形
 *
 *  @param wave     波形
 */
- (void)addWave:(MGWave *)wave;

/**
 *  移除所有波形
 */
- (void)removeAllWaves;

/**
 *  开始动画
 */
- (void)startWaveAnimate;

/**
 *  停止动画
 */
- (void)stopWaveAnimate;

@end
