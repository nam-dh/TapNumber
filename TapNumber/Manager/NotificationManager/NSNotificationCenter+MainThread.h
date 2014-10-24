//
//  NSNotificationCenter+MainThread.h
//  TapNumber
//
//  Created by Nam on 2014/10/23.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter_MainThread : NSNotificationCenter

+ (NSNotificationCenter_MainThread *)defaultCenter;
- (void)postNotificationOnMainThread:(NSNotification *)notification;
- (void)postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject;
- (void)postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;

@end