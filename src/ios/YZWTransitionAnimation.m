//
//  YZWTransitionAnimation.m
//  PageTransforAnimation
//
//  Created by yzw on 16/7/29.
//  Copyright © 2016年 yzw. All rights reserved.
//

#import "YZWTransitionAnimation.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <WebKit/WebKit.h>


typedef enum : NSUInteger {
    PresentedDown,            //从上往下
    PresentedUp,              //从下往上
    PushToLeft,               //从右往左推
    PushToRight,              //从左往右推
} AnimationType;

@interface TransitionAnimation : NSObject

+ (void)animationWithType:(AnimationType)type duration:(double)duration;
+ (void)pushAnimation;
+ (void)backAnimation;
+ (void)presentAnimation;
+ (void)dismissAnimation;

@end

@implementation TransitionAnimation

+ (void)animationWithType:(AnimationType)type duration:(double)duration {

    NSString *subtypeString;
    
    switch (type) {
        case PresentedDown:
            subtypeString = kCATransitionFromTop  ;
            break;
        case PresentedUp:
            subtypeString =  kCATransitionFromBottom;
            break;
        case PushToLeft:
            subtypeString = kCATransitionFromLeft;
            break;
        case PushToRight:
            subtypeString = kCATransitionFromRight ;
            break;
        default:
            break;
    }
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = duration;
    
    //设置运动type
    animation.type = kCATransitionPush;
    //设置子类
    animation.subtype = subtypeString;
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    UIView *supView = ((AppDelegate*)[UIApplication  sharedApplication].delegate).window.rootViewController.view;
    
    UIView *webview = nil;
    for (UIView *view in supView.subviews) {
        if ([view isKindOfClass:[UIWebView class]] || [view isKindOfClass:[WKWebView class]]) {
            webview = view;
            break;
        }
    }
    
    if (webview) {
        [webview.layer addAnimation:animation forKey:@"animation"];
    }
}

+ (void)pushAnimation {
    [self animationWithType:PushToRight duration:0.2];
}

+ (void)backAnimation {
    [self animationWithType:PushToLeft duration:0.2];
}

+ (void)presentAnimation {
  [self animationWithType:PresentedDown duration:0.25];
}

+ (void)dismissAnimation {
     [self animationWithType:PresentedUp duration:0.25];
}
@end


@implementation YZWTransitionAnimation

- (void)transition:(CDVInvokedUrlCommand*)command {
    int type = [[command.arguments objectAtIndex:0] intValue];
    double duration = [[command.arguments objectAtIndex:1] doubleValue];
    
    [TransitionAnimation animationWithType:type duration:duration];
}

- (void)pushAnimation:(CDVInvokedUrlCommand*)command {
    [TransitionAnimation pushAnimation];
}
- (void)backAnimation :(CDVInvokedUrlCommand*)command {
    [TransitionAnimation backAnimation];
}
- (void)presentAnimation :(CDVInvokedUrlCommand*)command {
    [TransitionAnimation presentAnimation];
}
- (void)dismissAnimation :(CDVInvokedUrlCommand*)command {
    [TransitionAnimation dismissAnimation];
}

@end

