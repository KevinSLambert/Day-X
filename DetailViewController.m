//
//  DetailViewController.m
//  DayX
//
//  Created by Kevin Lambert on 1/13/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "EntryController.h"

@interface DetailViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, strong) Entry *entry;

@end

@implementation DetailViewController

- (void)updateWithEntry:(Entry *)entry {
    self.entry = entry;
    
    self.textField.text = entry.title;
    self.textView.text = entry.text;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.delegate = self;
    self.textView.delegate = self;
    
    self.textField.text = self.entry.title;
    self.textView.text = self.entry.text;
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)clear:(id)sender {
    self.textView.text = nil;
    self.textField.text = nil;
}


-(void)save:(id)sender {
    
    Entry *entry = [[Entry alloc] initWithDictionary: @{titleKey: self.textField.text, textKey: self.textView.text}];
    
    if (self.entry) {
        [[EntryController sharedInstance] replaceEntry:self.entry withEntry:entry];
    }
    else {
        [[EntryController sharedInstance] addEntry:entry];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
