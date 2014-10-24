//
//  NotificationManager.h
//  TapNumber
//
//  Created by Nam on 2014/10/23.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum NotificationName : NSUInteger
{
    GO_TO_GAME_VIEW,
    GO_TO_HIGHSCORE_VIEW,
    START_GAME_TIMING,

}
NotificationName;

@interface NotificationManager : NSObject

+ (NotificationManager *)sharedInstance;

- (void)postNotificationName:(NotificationName)name
                      object:(id)object
                    userInfo:(NSDictionary *)userInfo;

- (void)postNotificationOnMainThreadName:(NotificationName)name
                                  object:(id)object
                                userInfo:(NSDictionary *)userInfo;

- (void)addObserver:(NSObject *)observer selector:(SEL)selector
               name:(NotificationName)name object:(id)object;

//Notification名を取得
- (NSString*) getNotificationName: (NotificationName) name;

@end
