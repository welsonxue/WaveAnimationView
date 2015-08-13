//
//  WaveAnimationView.m
//  WaveAnimationView
//
//  Created by 薛琳 on 15/8/13.
//  Copyright (c) 2015年 Welson. All rights reserved.
//

#import "WaveAnimationView.h"

@implementation WaveAnimationView

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame
                numberOfWaves:(NSUInteger)waves
                       radius:(CGFloat)radius
{
    return [self initWithFrame:frame
                 numberOfWaves:waves
                        radius:radius
                      waveType:WaveTypeCircle];
}

- (instancetype)initWithFrame:(CGRect)frame
                numberOfWaves:(NSUInteger)waves
                       radius:(CGFloat)radius
                     waveType:(WaveType)type
{
    if (self = [super initWithFrame:frame]) {
        _numberOfWaves = waves;
        _innerRadius = radius;
        _waveType = type;
        _waveWidth = 2.0;
        _waveColor = [UIColor blackColor];
        
        _durationTime = 2.0;
        _repeatCount = INFINITY;
        _alphaVarySpeed = 0.5;
        _reverse = NO;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

#pragma mark - public methods

- (void)startAnimation
{
    [self setup];
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CAShapeLayer *layer, NSUInteger index, BOOL *stop) {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        animation.values = @[@0,@1,@0,@0];
        animation.duration = self.durationTime;
        animation.beginTime = (animation.duration / self.numberOfWaves) * (self.reverse?index + 1:self.numberOfWaves - index) * self.alphaVarySpeed;
        animation.repeatCount = self.repeatCount;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [layer addAnimation:animation forKey:nil];
        layer.opacity = 0;
    }];
}

#pragma mark - private methods

- (void)setup
{
    self.layer.sublayers = nil;
    CGFloat insetOffsetDelta = (CGRectGetHeight(self.layer.bounds)/2 - self.innerRadius) / self.numberOfWaves;
    CGFloat currentInsetOffset = 0;
    for (int i=0; i<self.numberOfWaves; i++) {
        CAShapeLayer *layer = [CAShapeLayer new];
        layer.frame = CGRectInset(self.layer.bounds, currentInsetOffset, currentInsetOffset);
        UIBezierPath *circle;
        switch (self.waveType) {
            case WaveTypeCircle:
                circle = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(layer.bounds, self.waveWidth, self.waveWidth)];
                break;
            case WaveTypeRoundSquare:
                circle = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(layer.bounds, self.waveWidth, self.waveWidth) cornerRadius:self.innerRadius];
                break;
            default:
                break;
        }
        layer.path = circle.CGPath;
        layer.strokeColor = self.waveColor.CGColor;
        layer.lineWidth = self.waveWidth;
        layer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:layer];
        currentInsetOffset += insetOffsetDelta;
    }
}

@end
