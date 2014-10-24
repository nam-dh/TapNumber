//
//  HighScoreModel.h
//  TapNumber
//
//  Created by Nam on 2014/10/24.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HighScoreModel : NSObject

- (id) initWithDictionary:(NSDictionary*)dictionary;
- (NSDictionary*) getDictonaryFromModel;
- (NSString*) getName;
- (double) getHighScore;

@end
