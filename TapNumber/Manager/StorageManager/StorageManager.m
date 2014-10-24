//
//  StorageManager.m
//  TapNumber
//
//  Created by Nam on 2014/10/23.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "StorageManager.h"

@interface StorageManager()

@property (readonly, nonatomic, retain) NSArray *storageKeys;

@end


@implementation StorageManager

static StorageManager *_sharedInstance = nil;

+ (StorageManager *)sharedInstance
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
        _storageKeys = @[@"highScoreList",
                
                       ];
        
        //-- 初期値を設定
        NSDictionary *dictionary = @{_storageKeys[HIGH_SCORE_LIST]:@"",
                                     
                                     };
        [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
        return self;
    }
    return nil;
}


//-- Methods --/////////////////////////////////////////////////////////////////

- (id)objectForKey:(StorageKey)key
{
    return
    [[NSUserDefaults standardUserDefaults] objectForKey:_storageKeys[key]];
}

- (void)setObject:(id)value forKey:(StorageKey)key
{
    [[NSUserDefaults standardUserDefaults]
     setObject:value forKey:_storageKeys[key]];
}

- (void)removeObjectForKey:(StorageKey)key
{
    [[NSUserDefaults standardUserDefaults]
     removeObjectForKey:_storageKeys[key]];
}


//-- Getting Default Values --//////////////////////////////////////////////////

- (NSString *)stringForKey:(StorageKey)key
{
    return
    [[NSUserDefaults standardUserDefaults] stringForKey:_storageKeys[key]];
}

- (NSArray *)arrayForKey:(StorageKey)key
{
    return
    [[NSUserDefaults standardUserDefaults] arrayForKey:_storageKeys[key]];
}


- (NSDictionary *)dictionaryForKey:(StorageKey)key
{
    return
    [[NSUserDefaults standardUserDefaults] dictionaryForKey:_storageKeys[key]];
}

- (NSData *)dataForKey:(StorageKey)key
{
    return
    [[NSUserDefaults standardUserDefaults] dataForKey:_storageKeys[key]];
}

- (NSArray *)stringArrayForKey:(StorageKey)key
{
    return
    [[NSUserDefaults standardUserDefaults] stringArrayForKey:_storageKeys[key]];
}

- (NSInteger)integerForKey:(StorageKey)key
{
    return
    [[NSUserDefaults standardUserDefaults] integerForKey:_storageKeys[key]];
}

- (float)floatForKey:(StorageKey)key
{
    return
    [[NSUserDefaults standardUserDefaults] floatForKey:_storageKeys[key]];
}

- (double)doubleForKey:(StorageKey)key
{
    return
    [[NSUserDefaults standardUserDefaults] doubleForKey:_storageKeys[key]];
}

- (BOOL)boolForKey:(StorageKey)key
{
    return
    [[NSUserDefaults standardUserDefaults] boolForKey:_storageKeys[key]];
}

- (NSURL *)URLForKey:(StorageKey)key NS_AVAILABLE(10_6, 4_0)
{
    return
    [[NSUserDefaults standardUserDefaults] URLForKey:_storageKeys[key]];
}


//-- Setting Default Values --//////////////////////////////////////////////////

- (void)setInteger:(NSInteger)value forKey:(StorageKey)key
{
    [[NSUserDefaults standardUserDefaults]
     setInteger:value forKey:_storageKeys[key]];
}

- (void)setFloat:(float)value forKey:(StorageKey)key
{
    [[NSUserDefaults standardUserDefaults]
     setFloat:value forKey:_storageKeys[key]];
}

- (void)setDouble:(double)value forKey:(StorageKey)key
{
    [[NSUserDefaults standardUserDefaults]
     setDouble:value forKey:_storageKeys[key]];
}

- (void)setBool:(BOOL)value forKey:(StorageKey)key
{
    [[NSUserDefaults standardUserDefaults]
     setBool:value forKey:_storageKeys[key]];
}

- (void)setURL:(NSURL *)url forKey:(StorageKey)key NS_AVAILABLE(10_6, 4_0)
{
    [[NSUserDefaults standardUserDefaults]
     setURL:url forKey:_storageKeys[key]];
}


//-- Syncronizing Default Values --/////////////////////////////////////////////

- (void)syncronize
{
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
