//
//  BBDateUtility.m
//  BusbudCodeChallenge
//
//  Created by Ariel Scott-Dicker on 5/9/17.
//  Copyright © 2017 Ariel Scott-Dicker. All rights reserved.
//

#import "BBDateUtility.h"

@implementation BBDateUtility

+ (NSDate *)dateFromParsedISODateString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyy-MM-dd'T'HH:mm:ss"];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
    return [dateFormatter dateFromString:dateString];
}

+ (NSString *)formattedStringFromDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    return [dateFormatter stringFromDate:date];
}

@end
