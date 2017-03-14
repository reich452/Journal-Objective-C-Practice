//
//  EntryDetailViewController.m
//  JournalObjectiveC5
//
//  Created by Nick Reichard on 3/13/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"
#import "Entry.h"

@interface EntryDetailViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *entryTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextField;


@end

@implementation EntryDetailViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)updateWithEntry:(Entry *)entry {
    if(self.entry) {  // if there is something there, then do this.. .
        self.entryTextField.text = self.entry.title;
        self.bodyTextField.text = self.bodyTextField.text;
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    if (self.entry) {
        self.entry.title = self.entryTextField.text;
        self.entry.entryBody = self.bodyTextField.text;
        self.entry.timestamp = [NSDate date];
    } else {
        Entry *entry = [[Entry alloc] initWithTitle:self.entryTextField.text entryBody:self.entryTextField.text timestamp:[NSDate date]];
        [[EntryController shared] addEntry:entry];
        self.entry = entry;
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonTapped:(id)sender {
    self.entryTextField.text = @"";
    self.bodyTextField.text = @"";
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}




@end
