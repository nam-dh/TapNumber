//
//  StorageManager.h
//  TapNumber
//
//  Created by Nam on 2014/10/23.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum StorageKey : NSUInteger
{
    HIGH_SCORE_LIST,
}
StorageKey;

@interface StorageManager : NSObject

+ (StorageManager *)sharedInstance;

- (id)objectForKey:(StorageKey)key;
- (void)setObject:(id)value forKey:(StorageKey)key;
- (void)removeObjectForKey:(StorageKey)key;

//-- Getting Default Values --//////////////////////////////////////////////////
- (NSString *)stringForKey:(StorageKey)key;
- (NSArray *)arrayForKey:(StorageKey)key;
- (NSDictionary *)dictionaryForKey:(StorageKey)key;
- (NSData *)dataForKey:(StorageKey)key;
- (NSArray *)stringArrayForKey:(StorageKey)key;
- (NSInteger)integerForKey:(StorageKey)key;
- (float)floatForKey:(StorageKey)key;
- (double)doubleForKey:(StorageKey)key;
- (BOOL)boolForKey:(StorageKey)key;
- (NSURL *)URLForKey:(StorageKey)key NS_AVAILABLE(10_6, 4_0);

//-- Setting Default Values --//////////////////////////////////////////////////
- (void)setInteger:(NSInteger)value forKey:(StorageKey)key;
- (void)setFloat:(float)value forKey:(StorageKey)key;
- (void)setDouble:(double)value forKey:(StorageKey)key;
- (void)setBool:(BOOL)value forKey:(StorageKey)key;
- (void)setURL:(NSURL *)url forKey:(StorageKey)key NS_AVAILABLE(10_6, 4_0);

//-- Syncronizing Default Value --//////////////////////////////////////////////
- (void)syncronize;


@end
