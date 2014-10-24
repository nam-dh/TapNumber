//
//  HighScoreModel.m
//  TapNumber
//
//  Created by Nam on 2014/10/24.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "HighScoreModel.h"

@interface HighScoreModel()

@property(nonatomic, strong) NSString* name;
@property(nonatomic, assign) double highScoreTime;

@end

@implementation HighScoreModel

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    
    self = [super init];
    if (self) {
        
        if (dictionary) {
            self.name = [dictionary objectForKey:@"Name"];
            self.highScoreTime = [[dictionary objectForKey:@"Score"] doubleValue];
        }
    }
    return self;
}

- (NSDictionary*) getDictonaryFromModel
{
    return [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:self.name, self.highScoreTime, nil] forKeys:[NSArray arrayWithObjects:@"Name", @"Score", nil]];
}

- (NSString*) getName
{
    return self.name;
}

- (double) getHighScore
{
    return self.highScoreTime;
}

@end
