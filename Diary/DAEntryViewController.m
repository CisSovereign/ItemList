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

@property (weak, nonatomic) IBOutlet UITextView *textView;


@property (nonatomic, assign) enum DADiaryEntry *pickedMood;
@property (weak, nonatomic) IBOutlet UIButton *badButton;
@property (weak, nonatomic) IBOutlet UIButton *averageButton;
@property (weak, nonatomic) IBOutlet UIButton *goodButton;
@property (strong, nonatomic) IBOutlet UIView *accessoryView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;

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
    
    NSDate *date;
    
    if (self.entry != nil) {
        self.textView.text = self.entry.body;
        self.pickedMood = self.entry.mood;
        date = [NSDate dateWithTimeIntervalSince1970:self.entry.date];
    } else {
        self.pickedMood = DADiaryEntryMoodGood;
        date = [NSDate date];
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE MMMM d, yyyy"];
    self.dateLabel.text = [dateFormatter stringFromDate:date];
    
    self.textView.inputAccessoryView = self. accessoryView;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.textView becomeFirstResponder];
    
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
    entry.body = self.textView.text;
    entry.date = [[NSDate date] timeIntervalSince1970];
    [coreDataStack saveContext];
    
}

-(void)updateDiaryEntry {
    self.entry.body = self.textView.text;
    
    DACoreDataStack *coreDataStack = [DACoreDataStack defaultStack];
    [coreDataStack saveContext];
}

- (void)setPickedMood:(enum DADiaryEntryMood)pickedMood {
    _pickedMood = pickedMood;
    
    self.badButton.alpha = 0.5f;
    self.goodButton.alpha = 0.5f;
    self.averageButton.alpha = 0.5;
    
    switch (pickedMood) {
        case DADiaryEntryMoodGood:
            self.goodButton.alpha = 1.0f;
            break;
            
        case DADiaryEntryMoodAverage:
            self.averageButton.alpha = 1.0f;
            break;
        case DADiaryEntryMoodBad:
            self.badButton.alpha = 1.0f;
            break;
    }
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

- (IBAction)badWasPressed:(id)sender {
    self.pickedMood = DADiaryEntryMoodBad;
}
- (IBAction)averageWasPressed:(id)sender {
    self.pickedMood = DADiaryEntryMoodAverage;
}
- (IBAction)goodWasPressed:(id)sender {
    self.pickedMood = DADiaryEntryMoodGood;
}

- (IBAction)imageButtonWasPressed:(id)sender {
    
    
}


@end
