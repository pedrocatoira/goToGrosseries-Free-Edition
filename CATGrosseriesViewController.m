//
//  CATGrosseriesViewController.m
//  goToGrosseries
//
//  Created by Pedro Catoira on 14-02-06.
//  Copyright (c) 2014 Pedro Catoira. All rights reserved.
//

#import "CATGrosseriesViewController.h"
#import "CATAddItemViewController.h"
#import "CATItemDetailViewController.h"

@interface CATGrosseriesViewController ()

@end

@implementation CATGrosseriesViewController
@synthesize grosseriesArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveData:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self plistPath]]) {
        grosseriesArray = [[NSMutableArray alloc] initWithContentsOfFile:[self plistPath]];
    } else {
        NSDictionary *grosseryDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"Leite", kCATItem, @"1", kCATQtd, @"2%", kCATBrand, nil];
        grosseriesArray = [[NSMutableArray alloc] initWithObjects:grosseryDictionary, nil];
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addItem:(NSDictionary *)newItem
{
    [grosseriesArray addObject:newItem];
    [[self tableView] reloadData];
}

- (NSString *)plistPath {
    NSString *homeDirectory = NSHomeDirectory();
    NSString *filePath = [homeDirectory stringByAppendingString:@"/Documents/grosseries.plist"];
    return filePath;
}

- (void) saveData:(NSNotification *) notification {
    NSString *filePath;
    filePath = [self plistPath];
    [grosseriesArray writeToFile:filePath atomically:YES];
    
}

#pragma mark - Table view data source

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"addItemSegue"]) {
        CATAddItemViewController *addItemViewControler = [segue destinationViewController];
        [addItemViewControler setGrosseriesViewController:self];
    } else if ([[segue identifier] isEqualToString:@"itemDetailSegue"]) {
        NSIndexPath *selectedRow = [[self tableView] indexPathForSelectedRow];
        NSDictionary *selectedItem = [grosseriesArray objectAtIndex:[selectedRow row]];
        CATItemDetailViewController *itemDetailViewController = [segue destinationViewController];
        [itemDetailViewController setItem:selectedItem];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [grosseriesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BasicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    int rowNumber = [indexPath row];
    
    NSDictionary *grosseryDictionary = [grosseriesArray objectAtIndex:rowNumber];
    
    NSString *item = [grosseryDictionary objectForKey:kCATItem];
    NSString *brand = [grosseryDictionary objectForKey:kCATBrand];
    NSString *qtd = [grosseryDictionary objectForKey:kCATQtd];
    
    NSString *subtitle = [brand stringByAppendingString: kCATOpenParentesis];
    subtitle = [subtitle stringByAppendingString: qtd];
    subtitle = [subtitle stringByAppendingString: kCATCloseParentesis];
    
    [[cell textLabel] setText:item];
    [[cell detailTextLabel] setText:subtitle];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [grosseriesArray removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
