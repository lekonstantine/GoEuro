//
//  API.h
//  GoEuro
//
//  Created by Konstantin on 24.09.16.
//  Copyright © 2016 Konstantin Skoblik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface API : NSObject

+ (void)loadBuses: (void (^)(NSArray *trains))block;
+ (void)loadTrains: (void (^)(NSArray *trains))block;
+ (void)loadFlights: (void (^)(NSArray *trains))block;

@end
