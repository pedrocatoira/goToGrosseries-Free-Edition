//
//  CATItemDetailViewController.m
//  goToGrosseries
//
//  Created by Pedro Catoira on 14-02-07.
//  Copyright (c) 2014 Pedro Catoira. All rights reserved.
//

#import "CATItemDetailViewController.h"
#import "CATGrosseriesViewController.h"

@interface CATItemDetailViewController ()

@end

@implementation CATItemDetailViewController

@synthesize item;
@synthesize itemLabel;
@synthesize brandLabel;
@synthesize qtdLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [itemLabel setText:[item objectForKey:kCATItem]];
    [brandLabel setText:[item objectForKey:kCATBrand]];
    [qtdLabel setText:[item objectForKey:kCATQtd]];
}

@end
