//
//  TopView.h
//  TapNumber
//
//  Created by Nam on 2014/10/22.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TopViewDelegate <NSObject>
-(void) newGameTap;
@end

@interface TopView : UIView

-(id) initWithFrame:(CGRect)frame delegate:(id) delegate;

@end
