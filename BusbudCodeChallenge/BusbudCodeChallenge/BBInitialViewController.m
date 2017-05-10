//
//  BBInitialViewController.m
//  BusbudCodeChallenge
//
//  Created by Ariel Scott-Dicker on 5/8/17.
//  Copyright © 2017 Ariel Scott-Dicker. All rights reserved.
//

#import "BBInitialViewController.h"
#import "BBResultsTableViewController.h"

@interface BBInitialViewController ()

@end

@implementation BBInitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)searchButtonTapped:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BBResultsTableViewController *resultsTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"resultsTableViewController"];
    
    [self.navigationController pushViewController:resultsTableViewController
                                         animated:YES];
}

@end
