//
//  MaskView.m
//  vlow
//
//  Created by Nam on 2014/08/25.
//  Copyright (c) 2014年 QuattroMedia Corp. All rights reserved.
//

#import "MaskView.h"
#import "VolumeView.h"

@interface MaskView()

@property (nonatomic, retain) id<MaskViewDeledate> delegate;

@end


@implementation MaskView

- (id)initWithFrame:(CGRect)frame delegate:(id) delegate withAlpha:(CGFloat) alpha
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       [self setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:alpha]];
        
        self.autoresizesSubviews = YES;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.hidden = YES;
        
        if (delegate) {
            self.delegate = delegate;
            
            UITapGestureRecognizer *tapGesture =
            [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskViewTap)];
            [self addGestureRecognizer:tapGesture];
        }
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void) setAlpha:(CGFloat)alpha {
    [self setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:alpha]];
}


- (void) maskViewTap{
    self.hidden = YES;
    [self.delegate maskViewTap];
}

@end
