//
//  WAGuideView.h
//  WaveAnimationView
//
//  Created by 薛琳 on 15/8/13.
//  Copyright (c) 2015年 Welson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaveAnimationView.h"
#define kGuideHandImageName         @"hand"

@interface WAGuideView : UIView

@property (nonatomic, strong) WaveAnimationView *waveView;
@property (nonatomic, strong) UIImageView *handImageView;
@property (nonatomic, copy) void (^tapBlock)();

@end
