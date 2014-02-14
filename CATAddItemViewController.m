//
//  CATAddItemViewController.m
//  goToGrosseries
//
//  Created by Pedro Catoira on 14-02-06.
//  Copyright (c) 2014 Pedro Catoira. All rights reserved.
//

#import "CATAddItemViewController.h"

@interface CATAddItemViewController ()

@end

@implementation CATAddItemViewController
@synthesize itemTextField;
@synthesize brandTextField;
@synthesize qtdTextField;
@synthesize grosseriesViewController;

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

- (IBAction)addItemButtonPressed:(id)sender {
    NSString *item = [itemTextField text];
    NSString *brand = [brandTextField text];
    NSString *qtd = [qtdTextField text];
    
    NSDictionary *newItem = [[NSDictionary alloc] initWithObjectsAndKeys:item, kCATItem, brand, kCATBrand, qtd, kCATQtd, nil];
    
    [grosseriesViewController addItem:newItem];
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backButtonPressed:(id)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}
@end
