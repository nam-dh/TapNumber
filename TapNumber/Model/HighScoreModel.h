//
//  HighScoreModel.h
//  TapNumber
//
//  Created by Nam on 2014/10/24.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HighScoreModel : NSObject

- (id) initWithName:(NSString*) name withScore:(double) score;
- (NSString*) getName;
- (double) getHighScore;

@end
