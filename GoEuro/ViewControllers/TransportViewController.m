//
//  TransportViewController.m
//  GoEuro
//
//  Created by Konstantin on 24.09.16.
//  Copyright © 2016 Konstantin Skoblik. All rights reserved.
//

#import "TransportViewController.h"

#import "API.h"
#import "Transport.h"
#import "TransportCell.h"

@interface TransportViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *tableData;
@property (weak) IBOutlet UITableView *tableView;
@property (weak) IBOutlet UIActivityIndicatorView *indicator;

@end


@implementation TransportViewController


+ (TransportViewController *)getInstanceForType: (TransportType) type {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:NULL];
    TransportViewController *VC = [sb instantiateViewControllerWithIdentifier:@"TransportViewController"];
    VC.type = type;
    
    return VC;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *cellNib = [UINib nibWithNibName:@"TransportCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];
    
    [self loadData];
}



- (void)loadData {
    
    switch (_type) {
        case TransportTypeBus:      [self loadBuses]; break;
        case TransportTypeTrain:    [self loadTrains]; break;
        case TransportTypeFlight:   [self loadFlights]; break;
        default: break;
    }
}

- (void)loadBuses {
    
    [API loadBuses:^(NSArray *trains) {
        
        [_indicator stopAnimating];
        
        self.tableData = trains;
        [self.tableView reloadData];
    }];
}

- (void)loadTrains {
    
    [API loadTrains:^(NSArray *trains) {
        
        [_indicator stopAnimating];
        
        self.tableData = trains;
        [self.tableView reloadData];
    }];
}

- (void)loadFlights {
    
    [API loadFlights:^(NSArray *trains) {
        
        [_indicator stopAnimating];
        
        self.tableData = trains;
        [self.tableView reloadData];
    }];
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    TransportCell *cell = [tableView dequeueReusableCellWithIdentifier: @"Cell"];
    
    [cell setTransport: _tableData[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

@end
