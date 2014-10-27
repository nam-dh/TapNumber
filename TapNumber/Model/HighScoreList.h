//
//  HighScoreList.h
//  TapNumber
//
//  Created by Nam on 2014/10/24.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HighScoreModel.h"

@interface HighScoreList : NSObject

-(void) addObject:(HighScoreModel*)anObject;
-(void) removeObject:(HighScoreModel*)anObject;
- (NSArray*) getList;

-(BOOL) checkIsHighScore:(double) score;

@end
