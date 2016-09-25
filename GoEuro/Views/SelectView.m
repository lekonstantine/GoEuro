//
//  SelectView.m
//  GoEuro
//
//  Created by Konstantin on 25.09.16.
//  Copyright © 2016 Konstantin Skoblik. All rights reserved.
//

#import "SelectView.h"

@interface SelectView ()

@property (weak) UIView *containerView;

@property (weak) IBOutlet UIButton *buttonBus;
@property (weak) IBOutlet UIButton *buttonTrain;
@property (weak) IBOutlet UIButton *buttonFlight;

@end


@implementation SelectView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        NSString *className = NSStringFromClass([self class]);
        _containerView = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
        _containerView.frame = self.bounds;
    
        if (CGRectIsEmpty(frame)) {
            self.bounds = _containerView.bounds;
        }
    
        [self addSubview:_containerView];
        
        [self uncheck];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        NSString *className = NSStringFromClass([self class]);
        _containerView = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
        _containerView.frame = self.bounds;
        [self addSubview:_containerView];
        [self uncheck];
    }
    
    return self;
}


- (void)uncheck {
    _viewIndicatorBus.hidden = _viewIndicatorTrain.hidden = _viewIndicatorFlight.hidden = YES;
}

- (void)setIndicatorToIndex: (NSInteger)index {
    
    [self uncheck];
    
    switch (index) {
        case 0: _viewIndicatorTrain.hidden = NO; break;
        case 1: _viewIndicatorBus.hidden = NO; break;
        case 2: _viewIndicatorFlight.hidden = NO; break;
        default: break;
    }
}


- (IBAction)buttonTrainTapped:(UIButton *)sender {
    [self setIndicatorToIndex: 0];
    [_delegate selectViewDidSelectTrain];
}

- (IBAction)buttonBusTapped:(UIButton *)sender {
    [self setIndicatorToIndex: 1];
    [_delegate selectViewDidSelectBus];
}

- (IBAction)buttonFlightTapped:(UIButton *)sender {
    [self setIndicatorToIndex: 2];
    [_delegate selectViewDidSelectFlight];
}


@end
