//
//  BBTripTableViewCell.m
//  BusbudCodeChallenge
//
//  Created by Ariel Scott-Dicker on 5/9/17.
//  Copyright © 2017 Ariel Scott-Dicker. All rights reserved.
//

#import "BBTripTableViewCell.h"
#import "BBDateUtility.h"
#import <UIImageView+AFNetworking.h>

@interface BBTripTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *operatorImageview;
@property (weak, nonatomic) IBOutlet UILabel *departLocationAndTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *arriveLocationAndTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation BBTripTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)configureCell:(BBTrip *)trip {
    self.departLocationAndTimeLabel.adjustsFontSizeToFitWidth = YES;
    self.arriveLocationAndTimeLabel.adjustsFontSizeToFitWidth = YES;
    self.departLocationAndTimeLabel.text = [NSString stringWithFormat:@"%@ - %@", trip.departureLocation, [BBDateUtility formattedStringFromDate:trip.departureTime]];
    self.arriveLocationAndTimeLabel.text = [NSString stringWithFormat:@"%@ - %@", trip.arrivalLocation, [BBDateUtility formattedStringFromDate:trip.arrivalTime]];
    self.priceLabel.text = [NSString stringWithFormat:@"$%@", trip.price.stringValue];
    
    [self.operatorImageview setImageWithURL:trip.operatorLogoURL
                           placeholderImage:[UIImage imageNamed:@"BusbudPlaceholder"]];
}

@end
