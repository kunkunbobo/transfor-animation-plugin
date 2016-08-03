//
//  YZWTransitionAnimation.h
//  PageTransforAnimation
//
//  Created by yzw on 16/7/29.
//  Copyright © 2016年 yzw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>



@interface YZWTransitionAnimation : CDVPlugin

/*
 切换页面动画，command第一个参数是动画类型，第二个参数是动画时间
 */
- (void)transition:(CDVInvokedUrlCommand*)command;

/*
  push 切换页面动画
 */
- (void)pushAnimation:(CDVInvokedUrlCommand*)command;

/*
    返回push切换页面动画
 */
- (void)backAnimation:(CDVInvokedUrlCommand*)command;

/*
    从底部往上推出页面动画
 */
- (void)presentAnimation:(CDVInvokedUrlCommand*)command;

/*
    从顶部向下移动动画
 */
- (void)dismissAnimation:(CDVInvokedUrlCommand*)command;

@end
