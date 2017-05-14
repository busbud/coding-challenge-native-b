//
//  BBAPIClient.m
//  BusbudCodeChallenge
//
//  Created by Ariel Scott-Dicker on 5/8/17.
//  Copyright © 2017 Ariel Scott-Dicker. All rights reserved.
//

#import "BBAPIClient.h"
#import "BBTrip.h"
#import "BBDateUtility.h"
#import <AFNetworking.h>

@implementation BBAPIClient

+ (void)getTripsFromIndex:(NSUInteger)index
                  Success:(void (^)(NSArray *, NSNumber *))success
                  failure:(void (^)(NSError *))failure {
    NSString *url;
    
    if (index == 0) {
        url = @"https://napi.busbud.com/x-departures/dr5reg/f25dvk/2017-07-29?adult=1";
    
    } else {
        url = [NSString stringWithFormat:@"https://napi.busbud.com/x-departures/dr5reg/f25dvk/2017-07-29/poll?adult=1&index=%lu", index];
    }
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [sessionManager.requestSerializer setValue:@"application/vnd.busbud+json; version=2; profile=https://schema.busbud.com/v2/"
                            forHTTPHeaderField:@"Accept"];
    
    [sessionManager.requestSerializer setValue:@"PARTNER_JSWsVZQcS_KzxNRzGtIt1A"
                            forHTTPHeaderField:@"X-Busbud-Token"];
    
    [sessionManager GET:url
             parameters:nil
               progress:nil
                success:^(NSURLSessionDataTask *task, id responseObject) {
                    NSMutableArray *trips = [NSMutableArray new];
                    NSDictionary *operators = [self parseOperatorsFromDictionary:responseObject[@"operators"]];
                    NSDictionary *locations = [self parseLocationsFromDictionary:responseObject[@"locations"]];
                    
                    for (NSDictionary *departure in responseObject[@"departures"]) {
                        BBTrip *trip = [BBTrip new];
                        
                        NSNumber *departureLocationID = departure[@"origin_location_id"];
                        NSNumber *arrivalLocationID = departure[@"destination_location_id"];
                        
                        NSString *operatorID = departure[@"operator_id"];
                        NSString *operatorURLString = operators[operatorID];
                        NSArray *operatorURLStringComponents = [operatorURLString componentsSeparatedByString:@"?"];
                        
                        NSNumber *price = departure[@"prices"][@"total"];
                        NSNumber *formattedPrice = @(price.integerValue / 100);
                        
                        trip.departureTime = [BBDateUtility dateFromParsedISODateString:departure[@"departure_time"]];
                        trip.arrivalTime = [BBDateUtility dateFromParsedISODateString:departure[@"arrival_time"]];
                        trip.departureLocation = locations[departureLocationID.stringValue];
                        trip.arrivalLocation = locations[arrivalLocationID.stringValue];
                        trip.operatorLogoURL = [NSURL URLWithString:operatorURLStringComponents.firstObject];
                        trip.price = formattedPrice;
                        
                        [trips addObject:trip];
                    }
                    
                    success(trips, (NSNumber *)[responseObject valueForKey:@"complete"]);
                }
     
                failure:^(NSURLSessionDataTask *task, NSError *error) {
                    failure(error);
                }];
}

+ (void)showAlertOnErrorInResultsTableViewController:(BBResultsTableViewController *)resultsTableViewController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Something's up..."
                                                                             message:@"Check your network!"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK!"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    
    [alertController addAction:okAction];
    [resultsTableViewController presentViewController:alertController
                                             animated:YES
                                           completion:nil];
}

+ (void)showAlertOnNoResultsInResultsTableViewController:(BBResultsTableViewController *)resultsTableViewController {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Hmmm..."
                                                                             message:@"We couldn't find any trips for those days. Try changing your search."
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Got It"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    
    [alertController addAction:okAction];
    [resultsTableViewController presentViewController:alertController
                                             animated:YES
                                           completion:nil];
}

#pragma mark - Helper Methods

+ (NSDictionary *)parseOperatorsFromDictionary:(NSDictionary *)dictionary {
    NSMutableDictionary *operators = [NSMutableDictionary new];
    
    for (NSDictionary *operator in dictionary) {
        [operators setObject:operator[@"logo_url"]
                      forKey:operator[@"id"]];
    }
    
    return operators;
}

+ (NSDictionary *)parseLocationsFromDictionary:(NSDictionary *)dictionary {
    NSMutableDictionary *locations = [NSMutableDictionary new];
    
    for (NSDictionary *location in dictionary) {
        NSNumber *id = location[@"id"];
        
        [locations setObject:location[@"name"]
                      forKey:id.stringValue];
    }
    
    return locations;
}

@end
