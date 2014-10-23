//
//  TimerModel.m
//  TapNumber
//
//  Created by Nam on 2014/10/23.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import "TimerModel.h"

@interface TimerModel()

@property(nonatomic, assign) double timer;

@end

@implementation TimerModel


-(id)init
{
    self = [super init];
    if (self) {
        self.timer = 0.00;
    }
    return self;
}

-(void) setTimer:(double)timer
{
    _timer = timer;
}

-(double) getTimer
{
    return self.timer;
}

@end
