//
//  CATItemDetailViewController.h
//  goToGrosseries
//
//  Created by Pedro Catoira on 14-02-07.
//  Copyright (c) 2014 Pedro Catoira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CATItemDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
@property (weak, nonatomic) IBOutlet UILabel *brandLabel;
@property (weak, nonatomic) IBOutlet UILabel *qtdLabel;

@property (nonatomic, strong) NSDictionary *item;

@end
