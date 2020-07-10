//
//  NKPlayerSwitch.h
//  NKCoreUI
//
//  Created by 张雨帆 on 2020/6/30.
//

#import <Lottie/Lottie.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestView : UIView

@end

@interface NKPlayerSwitch : LOTAnimatedSwitch

@property (nonatomic, assign) CGSize animationViewSize;

+ (instancetype)initNormalSwitch;

+ (instancetype)initWithColor:(nullable UIColor *)color;

+ (instancetype)initWithAnimationSize:(CGSize)size;

+ (instancetype)initWithColor:(nullable UIColor *)color
                         animationSize:(CGSize)size;

- (void)setFrameRangeForOnState:(nonnull NSNumber *)fromFrame
                        toFrame:(nonnull NSNumber *)toFrame;

- (void)setFrameRangeForOffState:(nonnull NSNumber *)fromFrame
                         toFrame:(nonnull NSNumber *)toFrame;

- (void)setColor:(UIColor *)color forKeypath:(LOTKeypath * _Nonnull)keypath;

@end

NS_ASSUME_NONNULL_END
