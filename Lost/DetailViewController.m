//
//  DetailViewController.m
//  Lost
//
//  Created by Josef Hilbert on 28.01.14.
//  Copyright (c) 2014 Josef Hilbert. All rights reserved.
//

#import "DetailViewController.h"
#import "Character.h"
#import "MasterViewController.h"
#import "AppDelegate.h"

@interface DetailViewController () <UITextFieldDelegate>
{
    NSDateFormatter *dateFormat;
    __weak IBOutlet UITextField *actorTextField;
    __weak IBOutlet UITextField *passengerTextField;
    __weak IBOutlet UITextField *dateOfIntroductionTextField;
    __weak IBOutlet UITextField *dateOfDeathTextField;
    
    BOOL editMode;
    BOOL newCharacterCreated;
}

- (void)configureView;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setEditedCharacter:(Character*)newCharacter
{

 //   if (_editedCharacter != newCharacter)
 //   {
        _editedCharacter = newCharacter;
        
        // Update the view.
        [self configureView];
 //   }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (_editedCharacter) {
        newCharacterCreated = NO;
        actorTextField.text = [[_editedCharacter valueForKey:@"actor"] description];
        passengerTextField.text = [[_editedCharacter valueForKey:@"passenger"] description];
        dateOfIntroductionTextField.text = [[_editedCharacter valueForKey:@"introductionDate"] description];
        dateOfDeathTextField.text = [[_editedCharacter valueForKey:@"dateOfDeath"] description];
    }
    else
    {
        newCharacterCreated = YES;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self configureView];
    
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateStyle:NSDateFormatterShortStyle];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(updateDateOfIntroductionTextField:) forControlEvents:UIControlEventValueChanged];
    [dateOfIntroductionTextField setInputView:datePicker];
 
    UIDatePicker *datePicker2 = [[UIDatePicker alloc]init];
    [datePicker2 setDate:[NSDate date]];
    datePicker2.datePickerMode = UIDatePickerModeDate;
    [datePicker2 addTarget:self action:@selector(updateDateOfDeathTextField:) forControlEvents:UIControlEventValueChanged];
    [dateOfDeathTextField setInputView:datePicker2];
}

-(void)updateDateOfDeathTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)dateOfDeathTextField.inputView;
    dateOfDeathTextField.text = [dateFormat stringFromDate:picker.date];
}

-(void)updateDateOfIntroductionTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)dateOfIntroductionTextField.inputView;
    dateOfIntroductionTextField.text = [dateFormat stringFromDate:picker.date];
}
- (IBAction)onCancelPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onDonePressed:(id)sender {

    if (newCharacterCreated == YES)
    {
    _editedCharacter = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:[(AppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext]];
    }
    _editedCharacter.actor = actorTextField.text;
    _editedCharacter.passenger = passengerTextField.text;
    _editedCharacter.dateOfDeath = [dateFormat dateFromString:dateOfDeathTextField.text];
    _editedCharacter.introductionDate = [dateFormat dateFromString:dateOfIntroductionTextField.text];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(Character*)newCharacter
{
    return _editedCharacter;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
