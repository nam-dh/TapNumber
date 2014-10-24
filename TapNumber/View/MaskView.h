//
//  MaskView.h
//  TapNumber
//
//  Created by Nam on 2014/10/22.
//  Copyright (c) 2014年 Nam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaskView : UIView

- (id)initWithFrame:(CGRect)frame delegate:(id) delegate withAlpha:(CGFloat) alpha;
- (void) startAnimation;
- (void) restartNumber;

@end
