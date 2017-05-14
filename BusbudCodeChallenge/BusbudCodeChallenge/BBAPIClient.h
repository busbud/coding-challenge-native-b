//
//  BBAPIClient.h
//  BusbudCodeChallenge
//
//  Created by Ariel Scott-Dicker on 5/8/17.
//  Copyright © 2017 Ariel Scott-Dicker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBResultsTableViewController.h"

@interface BBAPIClient : NSObject

+ (void)getTripsFromIndex:(NSUInteger)index
                  Success:(void (^) (NSArray *trips, NSNumber *complete))success
                  failure:(void (^) (NSError *error))failure;

+ (void)showAlertOnErrorInResultsTableViewController:(BBResultsTableViewController *)resultsTableViewController;
+ (void)showAlertOnNoResultsInResultsTableViewController:(BBResultsTableViewController *)resultsTableViewController;

@end
