//
//  NotificationManager.m
//  TapNumber
//
//  Created by Nam on 2014/10/23.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "NotificationManager.h"
#import "NSNotificationCenter+MainThread.h"

@interface NotificationManager()

@property (readonly, nonatomic, retain) NSArray *notificationNames;

@end


@implementation NotificationManager

static NotificationManager *_sharedInstance = nil;

+ (NotificationManager *)sharedInstance
{
	static dispatch_once_t once;
	dispatch_once
    ( &once, ^{
		_sharedInstance = [[self alloc] init];
	});
    
	return _sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
	__block id ret = nil;
	
	static dispatch_once_t once;
	dispatch_once
    ( &once, ^{
		_sharedInstance = [super allocWithZone:zone];
		ret = _sharedInstance;
	});
	
	return ret;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)init
{
    if (self = [super init])
    {
        _notificationNames = [[NSArray alloc] initWithObjects:
                              
                              @"gotoGameView",
                              @"gotoHighScoreView",
                              @"startGameTiming",
                              
                              nil];
        return self;
    }
    return nil;
}

- (void)postNotificationName:(NotificationName)name
                      object:(id)object
                    userInfo:(NSDictionary *)userInfo
{
    [[NSNotificationCenter_MainThread defaultCenter]
     postNotificationName:[self.notificationNames objectAtIndex:name]
     object:object userInfo:userInfo];
}

- (void)postNotificationOnMainThreadName:(NotificationName)name
                      object:(id)object
                    userInfo:(NSDictionary *)userInfo
{
    [[NSNotificationCenter_MainThread defaultCenter]
     postNotificationOnMainThreadName:[self.notificationNames objectAtIndex:name]
     object:object userInfo:userInfo];
}


- (void)addObserver:(NSObject *)observer selector:(SEL)selector
               name:(NotificationName)name object:(id)object
{
    [[NSNotificationCenter_MainThread defaultCenter]
     addObserver:observer selector:selector
     name:[self.notificationNames objectAtIndex:name] object:nil];
}

- (NSString*) getNotificationName: (NotificationName) name {
    return [self.notificationNames objectAtIndex:name];
}

@end
