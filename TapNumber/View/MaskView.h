//
//  MaskView.h
//  vlow
//
//  Created by Nam on 2014/08/25.
//  Copyright (c) 2014年 QuattroMedia Corp. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MaskViewDeledate <NSObject>
- (void)maskViewTap;
@end

@interface MaskView : UIView

- (id)initWithFrame:(CGRect)frame delegate:(id) delegate withAlpha:(CGFloat) alpha;
- (void) setAlpha:(CGFloat)alpha;

@end
