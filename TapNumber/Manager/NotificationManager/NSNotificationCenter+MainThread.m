//
//  NSNotificationCenter+MainThread.m
//  TapNumber
//
//  Created by Nam on 2014/10/23.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "NSNotificationCenter+MainThread.h"

@implementation NSNotificationCenter_MainThread


+ (NSNotificationCenter_MainThread *)defaultCenter;
{
    return (NSNotificationCenter_MainThread*)[super defaultCenter];
}

- (void)postNotificationOnMainThread:(NSNotification *)notification
{
	[self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:YES];
}

- (void)postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject
{
	NSNotification *notification = [NSNotification notificationWithName:aName object:anObject];
	[self postNotificationOnMainThread:notification];
}

- (void)postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo
{
	NSNotification *notification = [NSNotification notificationWithName:aName object:anObject userInfo:aUserInfo];
	[self postNotificationOnMainThread:notification];
}

@end