//
//  ViewController.m
//  LottieTest
//

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
//    [self addObserver];
    
//    NSLog(@"%@", [NSRunLoop currentRunLoop]);

    _playSwitch = [NKPlayerSwitch initNormalSwitch];
    [self.view addSubview:_playSwitch];
    _playSwitch.frame = self.view.bounds;
    NSLog(@"animationView.size: (%0.2f, %0.2f)", _playSwitch.animationView.frame.size.width, _playSwitch.animationView.frame.size.height);
    
    [self.playSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@44);
        make.height.equalTo(@44);
        make.center.equalTo(self.view);
    }];
    NSLog(@"playSwitch的frame：%@", @(_playSwitch.frame));
    
//    UIView *testView = [[TestView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:testView];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"---------viewDidLayoutSubviews------------");
//    NSLog(@"animationView.size: (%0.2f, %0.2f)", _playSwitch.animationView.frame.size.width, _playSwitch.animationView.frame.size.height);
//    NSLog(@"playSwitch的frame：%@", @(_playSwitch.frame));
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"---------viewDidAppear------------");
    NSLog(@"animationView.size: (%0.2f, %0.2f)", _playSwitch.animationView.frame.size.width, _playSwitch.animationView.frame.size.height);
}


// 添加一个监听者
- (void)addObserver {
    
    // 1. 创建监听者
   
//    CFRunLoopObserverRef observer1 = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//
//        /*
//         kCFRunLoopEntry = (1UL << 0),          进入工作
//         kCFRunLoopBeforeTimers = (1UL << 1),   即将处理Timers事件
//         kCFRunLoopBeforeSources = (1UL << 2),  即将处理Source事件
//         kCFRunLoopBeforeWaiting = (1UL << 5),  即将休眠
//         kCFRunLoopAfterWaiting = (1UL << 6),   被唤醒
//         kCFRunLoopExit = (1UL << 7),           退出RunLoop
//         kCFRunLoopAllActivities = 0x0FFFFFFFU  监听所有事件
//         */
//        switch (activity) {
//            case kCFRunLoopEntry:
//                NSLog(@"进入");
//                break;
//            case kCFRunLoopBeforeTimers:
//                NSLog(@"即将处理Timer事件");
//                break;
//            case kCFRunLoopBeforeSources:
//                NSLog(@"即将处理Source事件");
//                break;
//            case kCFRunLoopBeforeWaiting:
//                NSLog(@"即将休眠");
//                break;
//            case kCFRunLoopAfterWaiting:
//                NSLog(@"被唤醒");
//                break;
//            case kCFRunLoopExit:
//                NSLog(@"退出RunLoop");
//                break;
//            default:
//                break;
//        }
//    });
    
//    CFRunLoopObserverRef observer1 = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAfterWaiting, YES, 1999900, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//
//        NSLog(@"00000000000");
//    });
    
    CFRunLoopObserverRef observer2 = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, YES, -1, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        NSLog(@"22222222222");
    });
    
    CFRunLoopObserverRef observer3 = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, YES, 1, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        NSLog(@"33333333333");
    });
    
    // 2. 添加监听者
    /**
     *  给指定的RunLoop添加监听者
     *
     *  @param rl#>       要添加监听者的RunLoop
     *  @param observer#> 监听者对象
     *  @param mode#>     RunLoop的运行模式, 填写默认模式即可
     */
//    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer1, kCFRunLoopDefaultMode);
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer2, kCFRunLoopDefaultMode);
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer3, kCFRunLoopDefaultMode);
}

- (void)getCurrentRunLoopMode{
    // 每次定时器触发, 都去查看当前的RunLoop的运行mode
    NSLog(@"%@", [NSRunLoop currentRunLoop].currentMode);
}

@end
