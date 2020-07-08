//
//  ViewController.m
//  LottieTest
//

//  ne_extended 拓展UIControl响应区域
//  Created by 张雨帆 on 2020/6/23.
//  Copyright © 2020 张雨帆. All rights reserved.
//

#import <Lottie/Lottie.h>
#import <Masonry/Masonry.h>

#import "NKPlayerSwitch.h"
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NKPlayerSwitch *playSwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _playSwitch = [NKPlayerSwitch initWithAnimationSize:CGSizeMake(24, 24)];
    [self.view addSubview:_playSwitch];
    _playSwitch.frame = self.view.bounds;
    NSLog(@"animationViewSize: (%0.2f, %0.2f)", _playSwitch.animationViewSize.width, _playSwitch.animationViewSize.height);
    NSLog(@"animationView.size: (%0.2f, %0.2f)", _playSwitch.animationView.frame.size.width, _playSwitch.animationView.frame.size.height);
    
    [self.playSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@44);
        make.height.equalTo(@44);
        make.center.equalTo(self.view);
    }];
    NSLog(@"playSwitch的frame：%@", @(_playSwitch.frame));
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"---------viewDidLayoutSubviews------------");
    NSLog(@"animationViewSize: (%0.2f, %0.2f)", _playSwitch.animationViewSize.width, _playSwitch.animationViewSize.height);
    NSLog(@"animationView.size: (%0.2f, %0.2f)", _playSwitch.animationView.frame.size.width, _playSwitch.animationView.frame.size.height);
    NSLog(@"playSwitch的frame：%@", @(_playSwitch.frame));
}


@end
