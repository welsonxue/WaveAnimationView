//
//  WAViewController.m
//  WaveAnimationView
//
//  Created by 薛琳 on 15/8/13.
//  Copyright (c) 2015年 Welson. All rights reserved.
//

#import "WAViewController.h"
#import "WAGuideView.h"
#import "UIView+Layout.h"
#import "WaveAnimationView.h"

@interface WAViewController()

@property (nonatomic, strong) WaveAnimationView *waveViewCircle;
@property (nonatomic, strong) WaveAnimationView *waveViewCircleSlow;
@property (nonatomic, strong) WaveAnimationView *waveViewSquare;
@property (nonatomic, strong) WaveAnimationView *waveViewSquareReverse;

@end

@implementation WAViewController

#pragma mark - life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.title = @"WaveAnimation";
    
    CGRect rect = CGRectMake(0, 0, 100, 100);
    
    //case circle
    self.waveViewCircle = [[WaveAnimationView alloc] initWithFrame:rect
                                                     numberOfWaves:6
                                                            radius:8.0];
    self.waveViewCircle.durationTime = 5.0;
    [self.view addSubview:self.waveViewCircle];
    
    //case circleSlow
    self.waveViewCircleSlow = [[WaveAnimationView alloc] initWithFrame:rect
                                                     numberOfWaves:4
                                                            radius:8.0];
    self.waveViewCircleSlow.durationTime = 5.0;
    self.waveViewCircleSlow.alphaVarySpeed = 0.2;
    self.waveViewCircleSlow.waveColor = [UIColor blueColor];
    [self.view addSubview:self.waveViewCircleSlow];
    
    //case square
    self.waveViewSquare = [[WaveAnimationView alloc] initWithFrame:rect
                                                         numberOfWaves:4
                                                                radius:4.0
                                                          waveType:WaveTypeRoundSquare];
    self.waveViewSquare.durationTime = 3.0;
    self.waveViewSquare.alphaVarySpeed = 1.0;
    self.waveViewSquare.waveWidth = 4.0;
    self.waveViewSquare.waveColor = [UIColor grayColor];
    [self.view addSubview:self.waveViewSquare];
    
    
    //case squareReverse
    self.waveViewSquareReverse = [[WaveAnimationView alloc] initWithFrame:rect
                                                     numberOfWaves:8
                                                            radius:2.0
                                                          waveType:WaveTypeRoundSquare];
    self.waveViewSquareReverse.durationTime = 4.0;
    self.waveViewSquareReverse.alphaVarySpeed = 1.0;
    self.waveViewSquareReverse.reverse = YES;
    self.waveViewSquareReverse.waveColor = [UIColor darkGrayColor];
    [self.view addSubview:self.waveViewSquareReverse];
    
    //case guide mask
    WAGuideView *guideView = [[WAGuideView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    guideView.tapBlock = ^{
        [self.waveViewCircle startAnimation];
        [self.waveViewCircleSlow startAnimation];
        [self.waveViewSquare startAnimation];
        [self.waveViewSquareReverse startAnimation];
    };
    [[UIApplication sharedApplication].keyWindow addSubview:guideView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.waveViewCircle.top = 40;
    self.waveViewCircle.left = 40;
    
    self.waveViewCircleSlow.top = 40;
    self.waveViewCircleSlow.right = self.view.width - 40;
    
    self.waveViewSquare.top = self.waveViewCircle.bottom + 30;
    self.waveViewSquare.left = 40;
    
    self.waveViewSquareReverse.top = self.waveViewCircle.bottom + 30;
    self.waveViewSquareReverse.right = self.view.width - 40;
}

@end
