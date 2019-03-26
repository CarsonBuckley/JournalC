//
//  EntryListTableViewController.m
//  JournalC
//
//  Created by Carson Buckley on 3/25/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "CMBEntry.h"
#import "CMBEntryController.h"
#import "EntryDetailViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[CMBEntryController sharedController] entries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    CMBEntry *entry = [[CMBEntryController sharedController] entries][indexPath.row];
    cell.textLabel.text = entry.title;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    cell.detailTextLabel.text = [dateFormatter stringFromDate:entry.timestamp];
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        CMBEntry *entry = [[CMBEntryController sharedController] entries][indexPath.row];
        [[CMBEntryController sharedController] removeEntry:entry];
        [tableView reloadData];
    }   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toDetailVC"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EntryDetailViewController *destinationVC = [segue destinationViewController];
        CMBEntry *entry = [[CMBEntryController sharedController] entries][indexPath.row];
        destinationVC.entry = entry;
    }
}

@end
