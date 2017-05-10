//
//  BBTripTableViewCell.h
//  BusbudCodeChallenge
//
//  Created by Ariel Scott-Dicker on 5/9/17.
//  Copyright © 2017 Ariel Scott-Dicker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBTrip.h"

@interface BBTripTableViewCell : UITableViewCell

- (void)configureCell:(BBTrip *)trip;

@end
