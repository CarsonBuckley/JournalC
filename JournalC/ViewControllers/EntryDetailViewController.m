//
//  EntryDetailViewController.m
//  JournalC
//
//  Created by Carson Buckley on 3/25/19.
//  Copyright © 2019 Launch. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "CMBEntry.h"

@interface EntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

-(void)updateViews
{
    if (self.entry) {
        self.textField.text = self.entry.title;
        self.textView.text = self.entry.body;
    }
}

- (IBAction)saveButtonTapped:(id)sender
{
    if (self.entry) {
        [[CMBEntryController sharedController] modifyEntry:self.entry withTitle:self.textField.text body:_textView.text];
    } else {
        CMBEntry *entry = [[CMBEntry alloc] initWithTitle:self.textField.text body:self.textView.text timestamp:[NSDate date]];
        [[CMBEntryController sharedController] addEntry:entry];
    }
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)clearButtonTapped:(id)sender
{
    self.textField.text = @"";
    self.textView.text = @"";
}


@end
