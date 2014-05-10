//
//  DANewEntryViewController.m
//  Diary
//
//  Created by Collin Hartigan on 5/7/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import "DAEntryViewController.h"
#import "DADiaryEntry.h"
#import "DACoreDataStack.h"

@interface DAEntryViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation DAEntryViewController

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
    
    if (self.entry != nil) {
        self.textField.text = self.entry.body;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)dismissSelf {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void)insertDiaryEntry {
    DACoreDataStack *coreDataStack = [DACoreDataStack defaultStack];
    DADiaryEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"DADiaryEntry" inManagedObjectContext:coreDataStack.managedObjectContext];
    entry.body = self.textField.text;
    entry.date = [[NSDate date] timeIntervalSince1970];
    [coreDataStack saveContext];
    
}

-(void)updateDiaryEntry {
    self.entry.body = self.textField.text;
    
    DACoreDataStack *coreDataStack = [DACoreDataStack defaultStack];
    [coreDataStack saveContext];
}

- (IBAction)doneWasPressed:(id)sender {
    if (self.entry != nil) {
        [self updateDiaryEntry];
    } else {
            [self insertDiaryEntry];
    }
    [self dismissSelf];
    
}

- (IBAction)cancelWasPressed:(id)sender {
    [self dismissSelf];
}

@end
