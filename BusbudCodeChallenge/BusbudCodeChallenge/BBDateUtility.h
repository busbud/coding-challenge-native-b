//
//  BBDateUtility.h
//  BusbudCodeChallenge
//
//  Created by Ariel Scott-Dicker on 5/9/17.
//  Copyright © 2017 Ariel Scott-Dicker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBDateUtility : NSObject

+ (NSDate *)dateFromParsedISODateString:(NSString *)dateString;
+ (NSString *)formattedStringFromDate:(NSDate *)date;

@end
