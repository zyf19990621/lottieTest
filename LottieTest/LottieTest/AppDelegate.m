//
//  AppDelegate.m
//  LottieTest
//
//  Created by 张雨帆 on 2020/6/23.
//  Copyright © 2020 张雨帆. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        CFRunLoopObserverRef observer1 = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopBeforeSources, YES, 1999900, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
//            NSLog(@"00000000000");
//        });
//        CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer1, kCFRunLoopDefaultMode);
//    }
//    return self;
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
