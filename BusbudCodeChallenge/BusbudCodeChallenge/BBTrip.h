//
//  BBTrip.h
//  BusbudCodeChallenge
//
//  Created by Ariel Scott-Dicker on 5/9/17.
//  Copyright © 2017 Ariel Scott-Dicker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBTrip : NSObject

@property (strong, nonatomic) NSDate *departureTime;
@property (strong, nonatomic) NSDate *arrivalTime;
@property (strong, nonatomic) NSString *departureLocation;
@property (strong, nonatomic) NSString *arrivalLocation;
@property (strong, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSURL *operatorLogoURL;

@end
