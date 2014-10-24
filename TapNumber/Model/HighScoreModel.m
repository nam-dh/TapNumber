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

- (id) initWithName:(NSString*) name withScore:(double) score
{
    
    self = [super init];
    if (self) {
        self.name = name;
        self.highScoreTime = score;
    }
    return self;
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
