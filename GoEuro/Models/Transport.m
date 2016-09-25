//
//  Transport.m
//  GoEuro
//
//  Created by Konstantin on 24.09.16.
//  Copyright © 2016 Konstantin Skoblik. All rights reserved.
//

#import "Transport.h"

@implementation Transport

+ (Transport *)setupWith: (NSDictionary *)data {
    
    Transport *item = [Transport new];
    
    item.price = [data objectForKey:@"price_in_euros"];
    item.arrivalTime = [data objectForKey:@"arrival_time"];
    item.departureTime = [data objectForKey:@"departure_time"];
    
    item.index = [[data objectForKey:@"id"] integerValue];
    item.stops = [[data objectForKey:@"number_of_stops"] integerValue];
    
    NSString *path = [data objectForKey:@"provider_logo"];
    item.logo = [path stringByReplacingOccurrencesOfString:@"{size}" withString:@"63"];
    
    return item;
}

@end
