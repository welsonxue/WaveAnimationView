//
//  WaveAnimationView.h
//  WaveAnimationView
//
//  Created by 薛琳 on 15/8/13.
//  Copyright (c) 2015年 Welson. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WaveType)
{
    WaveTypeCircle = 0,
    WaveTypeRoundSquare
};

@interface WaveAnimationView : UIView

@property (nonatomic, assign) NSUInteger numberOfWaves;
@property (nonatomic, assign) CGFloat innerRadius;
@property (nonatomic, assign) CGFloat waveWidth;
@property (nonatomic, strong) UIColor *waveColor;

@property (nonatomic, assign) CGFloat durationTime;
@property (nonatomic, assign) CGFloat alphaVarySpeed;
@property (nonatomic, assign) NSUInteger repeatCount;
@property (nonatomic, assign) BOOL reverse;

@property (nonatomic, assign) WaveType waveType;

- (instancetype)initWithFrame:(CGRect)frame
                numberOfWaves:(NSUInteger)waves
                       radius:(CGFloat)radius;

- (instancetype)initWithFrame:(CGRect)frame
                numberOfWaves:(NSUInteger)waves
                       radius:(CGFloat)radius
                     waveType:(WaveType)type;
- (void)startAnimation;
@end
