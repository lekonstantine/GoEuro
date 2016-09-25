//
//  Transport.h
//  GoEuro
//
//  Created by Konstantin on 24.09.16.
//  Copyright © 2016 Konstantin Skoblik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transport: NSObject

@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) NSString *logo;
@property (strong, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSString *departureTime;
@property (strong, nonatomic) NSString *arrivalTime;
@property (assign, nonatomic) NSInteger stops;

+ (Transport *)setupWith: (NSDictionary *)data;

@end
