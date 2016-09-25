//
//  TransportCell.m
//  GoEuro
//
//  Created by Konstantin on 25.09.16.
//  Copyright © 2016 Konstantin Skoblik. All rights reserved.
//

#import "TransportCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TransportCell()

@property (weak) IBOutlet UILabel *labelTime;
@property (weak) IBOutlet UILabel *labelPrice;
@property (weak) IBOutlet UILabel *labelStops;

@property (weak) IBOutlet UIImageView *imageViewLogo;

@end


@implementation TransportCell

- (void)setTransport: (Transport *)transport {
 
    _transport = transport;
    
    _labelPrice.text = [NSString stringWithFormat:@"€%.2f", transport.price.doubleValue];
    _labelStops.text = [NSString stringWithFormat:@"Stops: %li", (long)transport.stops];
    
    _labelTime.text = [NSString stringWithFormat: @"%@ - %@", transport.departureTime, transport.arrivalTime];
    
    [_imageViewLogo sd_setImageWithURL: [NSURL URLWithString: transport.logo]];
}

@end
