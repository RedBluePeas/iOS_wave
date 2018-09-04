//
//  MGWaveView.m
//  MGStock
//
//  Created by 姜艳昌 on 2017/12/14.
//  Copyright © 2017年 ningbomaiguo. All rights reserved.
//

#import "MGWaveView.h"
#import "MGWave.h"

@interface MGWaveView()

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) NSMutableArray<CAShapeLayer *> *wavesArray;

@property (nonatomic, assign) CGFloat offset;

@end

@implementation MGWaveView

#pragma mark -- onEvent --
- (void)onDisplayFrameUpadte:(CADisplayLink *)sender
{
    for (MGWave *wave in self.wavesArray) {
        self.offset -= wave.waveSpeed;
        
        [self drawWave:wave];
    }
}

#pragma mark -- 定时器 --
- (void)startWaveAnimate
{
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopWaveAnimate
{
    [self.displayLink invalidate];
    self.displayLink = nil;
}

#pragma mark -- 波形相关 --
- (void)addWave:(MGWave *)wave
{
    CGRect frame = [self bounds];
    frame.origin.y = frame.size.height-wave.waveHeight;
    frame.size.height = wave.waveHeight;
    wave.frame = frame;
    
    [self.wavesArray addObject:wave];
    [self.layer addSublayer:wave];
}

- (void)removeAllWaves
{
    [self.wavesArray performSelector:@selector(removeFromSuperlayer)];
    [self.wavesArray removeAllObjects];
}

#pragma mark -- draw --
- (void)drawWave:(MGWave *)wave
{
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = wave.waveHeight;

    //path
    //ref会导致底部出现一根线
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, 0, height);
    CGFloat pathY = 0.f;
    
    UIBezierPath * linePath = [[UIBezierPath alloc] init];
    
    for (CGFloat x = 0.f; x <= width; x++) {
        
        pathY = height * sin(M_PI * 2 / wave.cycleWidth * x + self.offset + wave.waveX);
        CGPoint point = CGPointMake(x, pathY);
        if (x == 0) {
            
            [linePath moveToPoint:point];
            
        }else {
            
            [linePath addLineToPoint:point];
        }
//        CGPathAddLineToPoint(path, NULL, x, pathY);
        
    }
    
//    CGPathAddLineToPoint(path, NULL, width, height);
//    CGPathAddLineToPoint(path, NULL, 0, height);
//    CGPathCloseSubpath(path);
//    wave.path = path;
    wave.fillColor = wave.waveColor.CGColor;
    [linePath addLineToPoint:CGPointMake(width, height)];
    [linePath addLineToPoint:CGPointMake(0, height)];
    [linePath closePath];
    
    //创建layer
    wave.path = linePath.CGPath;
//    CGPathRelease(path);
}

#pragma mark -- lazy --
- (NSMutableArray<CAShapeLayer *> *)wavesArray
{
    if (!_wavesArray) {
        _wavesArray = [[NSMutableArray alloc] init];
    }
    return _wavesArray;
}

- (CADisplayLink *)displayLink
{
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(onDisplayFrameUpadte:)];
    }
    return _displayLink;
}

@end
