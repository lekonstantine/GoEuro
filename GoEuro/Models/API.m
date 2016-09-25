//
//  API.m
//  GoEuro
//
//  Created by Konstantin on 24.09.16.
//  Copyright © 2016 Konstantin Skoblik. All rights reserved.
//

#import "API.h"
#import "Transport.h"
#import "AFNetworking.h"

NSString * const urlBuses = @"https://api.myjson.com/bins/37yzm";
NSString * const urlTrains = @"https://api.myjson.com/bins/3zmcy";
NSString * const urlFlights = @"https://api.myjson.com/bins/w60i";

@implementation API


+ (void)makeGETRequest: (NSString *)url withblock: (void (^)(id responseObject))block {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

+ (void)loadTrains: (void (^)(NSArray*))block {
    
    [self makeGETRequest:urlTrains withblock:^(id responseObject) {
        block([self convertResponse:responseObject]);
    }];
}

+ (void)loadBuses: (void (^)(NSArray*))block {
    
    [self makeGETRequest:urlBuses withblock:^(id responseObject) {
        block([self convertResponse:responseObject]);
    }];
}

+ (void)loadFlights: (void (^)(NSArray*))block {
    
    [self makeGETRequest:urlFlights withblock:^(id responseObject) {
        block([self convertResponse:responseObject]);
    }];
}

+ (NSArray *)convertResponse: (NSArray *)responseObject {
    
    NSMutableArray *result = [NSMutableArray new];
    
    for (NSDictionary *element in responseObject) {
        [result addObject:[Transport setupWith:element]];
    }
    
    return result;
}

@end
