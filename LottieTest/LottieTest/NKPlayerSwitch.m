//
//  NKPlayerSwitch.m
//  NKCoreUI
//
//  Created by 张雨帆 on 2020/6/30.
//

//#import <NKCoreUI/NKCoreUI.h>
#import <Masonry/Masonry.h>

#import "NKPlayerSwitch.h"

@interface TestLayer : CALayer

@end

@implementation TestLayer

- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
}

- (void)setPosition:(CGPoint)position {
    [super setPosition:position];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

@end



@implementation TestView

+ (Class)layerClass {
    return [TestLayer class];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
}

- (void)setBounds:(CGRect)bounds {
//    NSLog(@"11111");
    [super setBounds:bounds];
}

- (void)setCenter:(CGPoint)center {
    [super setCenter:center];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"111 %@", @(self.frame.size));
    
}

@end

@implementation NKPlayerSwitch {
    UIView *_testView;
}

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        _testView = [[TestView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
//        _testView.backgroundColor = [UIColor redColor];
//        [self addSubview:_testView];
//    }
//    return self;
//}

+ (instancetype)initNormalSwitch {
    return [self initWithColor:nil];
}

+ (instancetype)initWithColor:(UIColor *)color {
    return [self initWithColor:color animationSize:CGSizeZero];
}

+ (instancetype)initWithAnimationSize:(CGSize)size {
    return [self initWithColor:nil animationSize:size];
}

+ (instancetype)initWithColor:(UIColor *)color animationSize:(CGSize)size {
    NKPlayerSwitch *playSwitch = [self switchNamed:@"motion-assets_全局播放按钮_play_btn_global"];
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

- (void)setAnimationViewSize:(CGSize)animationViewSize {
    _animationViewSize = animationViewSize;
    [self setNeedsLayout];
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    [super layoutSublayersOfLayer:layer];
//    NSLog(@"animationView'frame: %@", @(self.animationView.frame));
    
}

- (void)drawRect:(CGRect)rect {
//    NSLog(@"animationView'frame: %@", @(self.animationView.frame));
    [super drawRect:rect];
}

- (void)updateConstraints {
    [super updateConstraints];
    
}

- (void)layoutSubviews {
    NSLog(@"~~~~~~~~playSwitch.layoutSubviews~~~~~~~~");
    [super layoutSubviews];
    [self.animationView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(24);
    }];
    
//    [self.animationView setFrame:CGRectMake(0, 0, 24, 24)];
    
    NSLog(@"animationView'frame: %@", @(self.animationView.frame));
//
//    _testView.frame = self.bounds;
//    CGSize size = [self animationViewSize];
//    NSLog(@"1、animationView'frame: %@", @(self.animationView.frame));
//    if (size.height > 0 && size.width > 0) {
//         make constraint

    
//    [_testView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.offset(24.0);
////        make.top.left.offset(10);
//    }];
    
//    [_testView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.offset(10);
//        make.width.mas_equalTo(48);
//        make.height.mas_equalTo(48);
//    }];
    
//        NSLog(@"2、animationView'frame: %@", @(self.animationView.frame));

        // set frame
//        [self.animationView setFrame:CGRectMake(self.animationView.frame.origin.x, self.animationView.frame.origin.y, size.width, size.height)];
//        NSLog(@"2、animationView'frame: %@", @(self.animationView.frame));
//        CGPoint center = [self convertPoint:self.center fromView:self.superview];
//        self.animationView.center = center;
//        NSLog(@"3、animationView'frame: %@", @(self.animationView.frame));

//    } else {
//        self.animationView.frame = self.bounds;
//    }

}
@end
