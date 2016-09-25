//
//  TransportViewController.h
//  GoEuro
//
//  Created by Konstantin on 24.09.16.
//  Copyright © 2016 Konstantin Skoblik. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, TransportType) {
    TransportTypeBus,
    TransportTypeTrain,
    TransportTypeFlight
};


@interface TransportViewController : UIViewController

@property (assign, nonatomic) NSInteger index;
@property (assign, nonatomic) TransportType type;

+ (TransportViewController *)getInstanceForType: (TransportType) type;

@end
