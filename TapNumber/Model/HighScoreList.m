//
//  HighScoreList.m
//  TapNumber
//
//  Created by Nam on 2014/10/24.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "HighScoreList.h"
#import "StorageManager.h"

@interface HighScoreList()

@property(nonatomic, strong) NSMutableArray* list;

@end

@implementation HighScoreList


- (id) init
{
    self = [super init];
    if (self) {
        
        NSArray *array = [[StorageManager sharedInstance] arrayForKey:HIGH_SCORE_LIST];
        self.list = [self modelListFromDictList:[NSMutableArray arrayWithArray:array]];
    }
    return self;
}

-(void) addObject:(HighScoreModel*)anObject
{
    [self.list addObject:anObject];
    [[StorageManager sharedInstance] setObject:[self dictListFromModelList:self.list] forKey:HIGH_SCORE_LIST];
}


-(void) removeObject:(HighScoreModel*)anObject
{
    [self.list removeObject:anObject];
    [[StorageManager sharedInstance] setObject:[self dictListFromModelList:self.list] forKey:HIGH_SCORE_LIST];
}

- (NSArray*) getList
{
    return self.list;
}


-(NSDictionary*) dictFromModel:(HighScoreModel*) model {
    
    NSArray *objects = [[NSArray alloc] initWithObjects:[model getName], [NSString stringWithFormat:@"%.2f",[model getHighScore]], nil];
    NSArray *keys = [[NSArray alloc] initWithObjects:@"N", @"S", nil];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
    return dict;
}

-(HighScoreModel*) modelFromNSDict:(NSDictionary*) model {
    
    NSString* name = [model objectForKey:@"N"];
    NSString* score = [model objectForKey:@"S"];
    HighScoreModel *highScoreModel = [[HighScoreModel alloc] initWithName:name withScore:[score doubleValue]];
    return highScoreModel;
}

- (NSMutableArray*) modelListFromDictList:(NSMutableArray*) array
{
    NSMutableArray * result = [[NSMutableArray alloc] init];
    for (NSDictionary* dict in array) {
        [result addObject:[self modelFromNSDict:dict]];
    }
    return result;
}

- (NSMutableArray*) dictListFromModelList:(NSMutableArray*) array
{
    NSMutableArray * result = [[NSMutableArray alloc] init];
    for (HighScoreModel* model in array) {
        [result addObject:[self dictFromModel:model]];
    }
    return result;
}


@end
