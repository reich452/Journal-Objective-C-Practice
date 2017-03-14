//
//  EntryListTableViewController.m
//  JournalObjectiveC5
//
//  Created by Nick Reichard on 3/13/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "EntryController.h"
#import "EntryDetailViewController.h"


@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [EntryController shared].entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    Entry *entry = [EntryController shared].entries[indexPath.row];
    cell.textLabel.text = entry.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", entry.timestamp];
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Entry *entry = [EntryController shared].entries[indexPath.row];
        [[EntryController shared]removeEntry:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailVC"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //if ([EntryController shared].entries.count == 0)
        Entry *entry = [EntryController shared].entries[indexPath.row];
        EntryDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.entry = entry;
    }
}


@end
