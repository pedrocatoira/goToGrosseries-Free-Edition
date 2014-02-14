//
//  CATAddItemViewController.h
//  goToGrosseries
//
//  Created by Pedro Catoira on 14-02-06.
//  Copyright (c) 2014 Pedro Catoira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CATGrosseriesViewController.h"

@interface CATAddItemViewController : UIViewController

@property (nonatomic, weak) CATGrosseriesViewController *grosseriesViewController;
@property (weak, nonatomic) IBOutlet UITextField *itemTextField;
@property (weak, nonatomic) IBOutlet UITextField *brandTextField;
@property (weak, nonatomic) IBOutlet UITextField *qtdTextField;

- (IBAction)addItemButtonPressed:(id)sender;
- (IBAction)backButtonPressed:(id)sender;

@end
