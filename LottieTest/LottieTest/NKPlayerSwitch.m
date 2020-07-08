//
//  NKPlayerSwitch.m
//  NKCoreUI
//
//  Created by 张雨帆 on 2020/6/30.
//

//#import <NKCoreUI/NKCoreUI.h>
#import <Masonry/Masonry.h>

#import "NKPlayerSwitch.h"

@implementation NKPlayerSwitch

+ (instancetype)initNormalSwitch {
    return [NKPlayerSwitch initWithColor:nil];
}

+ (instancetype)initWithColor:(UIColor *)color {
    return [NKPlayerSwitch initWithColor:color animationSize:CGSizeZero];
}

+ (instancetype)initWithAnimationSize:(CGSize)size {
    return [NKPlayerSwitch initWithColor:nil animationSize:size];
}

+ (instancetype)initWithColor:(UIColor *)color animationSize:(CGSize)size {
    NKPlayerSwitch *playSwitch = [NKPlayerSwitch switchNamed:@"motion-assets_全局播放按钮_play_btn_global"];
    // 设置初始为“播放状态”。
    [playSwitch setOn:YES];
    [playSwitch setFrameRangeForOnState:@0 toFrame:@19];
    [playSwitch setFrameRangeForOffState:@21 toFrame:@39];
    if (color) {
        // keypath路径依赖于lottie动画，修改动画后其相应value路径也需要修改。
        LOTKeypath *keypath = [LOTKeypath keypathWithString:@"**.Fill 1.Color"];
        [playSwitch setColor:color forKeypath:keypath];
    }
    if (size.height > 0 && size.width > 0) {
        [playSwitch setAnimationViewSize:size];
    }
    return playSwitch;
}

- (void)setFrameRangeForOnState:(NSNumber *)fromFrame
                        toFrame:(NSNumber *)toFrame
{
    CGFloat startProgress = fromFrame.floatValue / self.animationComp.endFrame.integerValue;
    CGFloat endProgress = toFrame.floatValue / self.animationComp.endFrame.integerValue;
    [self setProgressRangeForOnState:startProgress toProgress:endProgress];
}

- (void)setFrameRangeForOffState:(NSNumber *)fromFrame
                        toFrame:(NSNumber *)toFrame
{
    CGFloat startProgress = fromFrame.floatValue / self.animationComp.endFrame.integerValue;
    CGFloat endProgress = toFrame.floatValue / self.animationComp.endFrame.integerValue;
    [self setProgressRangeForOffState:startProgress toProgress:endProgress];
}

- (void)setColor:(UIColor *)color forKeypath:(LOTKeypath *)keypath {
    LOTColorValueCallback *colorProvider = [LOTColorValueCallback withCGColor:color.CGColor];
    [self.animationView setValueDelegate:colorProvider forKeypath:keypath];
}

- (void)layoutSubviews {
    NSLog(@"~~~~~~~~playSwitch.layoutSubviews~~~~~~~~");
    [super layoutSubviews];
//    CGSize size = [self animationViewSize];
//    NSLog(@"1、animationView'frame: %@", @(self.animationView.frame));
//    if (size.height > 0 && size.width > 0) {
//        // make constraint
//        [self.animationView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.equalTo(self);
//            make.width.mas_equalTo(24);
//            make.height.mas_equalTo(24);
//        }];
//        NSLog(@"2、animationView'frame: %@", @(self.animationView.frame));
//
//        // set frame
////        [self.animationView setFrame:CGRectMake(self.animationView.frame.origin.x, self.animationView.frame.origin.y, size.width, size.height)];
////        NSLog(@"2、animationView'frame: %@", @(self.animationView.frame));
////        self.animationView.center = self.center;
////        NSLog(@"3、animationView'frame: %@", @(self.animationView.frame));
//
//    } else {
//        self.animationView.frame = self.bounds;
//    }
//
}
@end
