//
//  BBResultsTableViewController.m
//  BusbudCodeChallenge
//
//  Created by Ariel Scott-Dicker on 5/9/17.
//  Copyright © 2017 Ariel Scott-Dicker. All rights reserved.
//

#import "BBResultsTableViewController.h"
#import "BBAPIClient.h"
#import "BBTripTableViewCell.h"

@interface BBResultsTableViewController ()

@property (strong, nonatomic) NSMutableArray <BBTrip *> *trips;
@property NSUInteger apiIndex;

@end

@implementation BBResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.trips = [NSMutableArray new];
    self.apiIndex = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    [self getAllDepartures];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.trips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BBTripTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tripTableViewCell" forIndexPath:indexPath];
    [cell configureCell:self.trips[indexPath.row]];
    return cell;
}

# pragma mark - Helper Methods

- (void)getAllDepartures {
    [BBAPIClient getTripsFromIndex:self.apiIndex
                           Success:^(NSArray *trips, BOOL complete) {
                               for (BBTrip *trip in trips) {
                                   [self.trips addObject:trip];
                               }
                               
                               if (!complete) {
                                   self.apiIndex += 1;
                                   [self getAllDepartures];
                               }
                               
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   [self.tableView reloadData];
                               });
                           }
     
                           failure:^(NSError *error) {
                               [BBAPIClient showAlertOnErrorInResultsTableViewController:self];
                           }];
}

@end
