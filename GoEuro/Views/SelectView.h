//
//  SelectView.h
//  GoEuro
//
//  Created by Konstantin on 25.09.16.
//  Copyright © 2016 Konstantin Skoblik. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectViewDelegate <NSObject>
@optional
- (void)selectViewDidSelectBus;
- (void)selectViewDidSelectTrain;
- (void)selectViewDidSelectFlight;
@end


@interface SelectView : UIView

@property (weak) IBOutlet UIView *viewIndicatorBus;
@property (weak) IBOutlet UIView *viewIndicatorTrain;
@property (weak) IBOutlet UIView *viewIndicatorFlight;

@property (nonatomic, weak) id <SelectViewDelegate> delegate;

- (void)setIndicatorToIndex: (NSInteger)index;

@end
