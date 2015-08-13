//
//  WAGuideView.m
//  WaveAnimationView
//
//  Created by 薛琳 on 15/8/13.
//  Copyright (c) 2015年 Welson. All rights reserved.
//

#import "WAGuideView.h"
#import "UIView+Layout.h"

@interface WAGuideView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation WAGuideView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        _waveView = [[WaveAnimationView alloc] initWithFrame:CGRectMake(0, 0, 56, 56)
                                               numberOfWaves:3
                                                      radius:8.0];
        _waveView.waveColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
        [self addSubview:_waveView];
        [_waveView startAnimation];
        
        _handImageView = [UIImageView new];
        _handImageView.image = [UIImage imageNamed:kGuideHandImageName];
        [self addSubview:_handImageView];
        
        _titleLabel = [UILabel new];
        _titleLabel.text = @"Tap to show Demo :)";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:17.0];
        [self addSubview:_titleLabel];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(handleTap:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.handImageView.width = self.handImageView.image.size.width;
    self.handImageView.height = self.handImageView.image.size.height;
    self.handImageView.center = self.center;
    
    [self.titleLabel sizeToFit];
    self.titleLabel.centerX = self.width/2;
    self.titleLabel.centerY = self.handImageView.top - 50;
    
    self.waveView.center = CGPointMake(self.handImageView.left + 41.0, self.handImageView.top + 17.0);
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    if (self.tapBlock) {
        self.tapBlock();
    }
    [self removeFromSuperview];
}

@end
