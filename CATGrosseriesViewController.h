//
//  CATGrosseriesViewController.h
//  goToGrosseries
//
//  Created by Pedro Catoira on 14-02-06.
//  Copyright (c) 2014 Pedro Catoira. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCATItem @"Item"
#define kCATBrand @"Brand"
#define kCATQtd @"Qtd"

#define kCATOpenParentesis @" ("
#define kCATCloseParentesis @") "

@interface CATGrosseriesViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *grosseriesArray;

- (void) addItem: (NSDictionary *) newItem;
- (void) saveData:(NSNotification *) notification;

@end
