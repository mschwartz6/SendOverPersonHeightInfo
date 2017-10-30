//
//  ViewController.m
//  SendOverPersonHeightInfo
//
//  Created by user on 10/25/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
{
    int patientNumber;
    Patient *newPatient;
    NSMutableArray *patientList;
}
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateOfBirthTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *feetTextField;
@property (weak, nonatomic) IBOutlet UITextField *inchesTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UIButton *enterButton;
@end

@implementation FirstViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _enterButton.enabled = NO;
    patientNumber = 0;
    patientList = [[NSMutableArray alloc]init];
    [self assignDelegates];
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed:(id)sender {
    patientNumber +=1;
    newPatient = [[Patient alloc]initWithName:_nameTextField.text andWithPatientNumber:[NSNumber numberWithInt:patientNumber] andWithDOB:_dateOfBirthTextField.text andWithAddress:_addressTextField.text andWithHeightInFeet:_feetTextField.text andWithHeightInInches:_inchesTextField.text andWithWeightInPounds:_weightTextField.text];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SecondViewController *destination = [segue destinationViewController];
    destination.patientIntake = newPatient;
}
-(IBAction)goBackAndEdit:(UIStoryboardSegue *)unWindSegue
{
    _nameTextField.text = [newPatient getName];
    _dateOfBirthTextField.text = [newPatient getDateOfBirth];
    _addressTextField.text = [newPatient getAddress];
    _feetTextField.text  = [newPatient getHeightInFeet];
    _inchesTextField.text = [newPatient getHeightInInches];
    _weightTextField.text  = [newPatient getWeightInPounds];
}
-(IBAction)saveAndReturn:(UIStoryboardSegue *)unWindSegue
{
    [patientList addObject:newPatient];
    _nameTextField.text = @"";
    _dateOfBirthTextField.text =@"";
    _addressTextField.text = @"";
    _feetTextField.text  = @"";
    _inchesTextField.text = @"";
    _weightTextField.text  = @"";
    _enterButton.enabled = NO;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self hideKeyboard];
    return YES;
}
- (void) hideKeyboard {
    [self.nameTextField resignFirstResponder];
    [self.dateOfBirthTextField resignFirstResponder];
    [self.addressTextField resignFirstResponder];
    [self.feetTextField resignFirstResponder];
    [self.inchesTextField resignFirstResponder];
    [self.weightTextField resignFirstResponder];
    
    if ([self isReadyToReview])
        _enterButton.enabled = YES;
    else
        _enterButton.enabled = NO;
    
    [self getCorrectHeight:_feetTextField.text :_inchesTextField.text];
}
-(void)assignDelegates {
    self.nameTextField.delegate = self;
    self.dateOfBirthTextField.delegate = self;
    self.addressTextField.delegate = self;
    self.feetTextField.delegate = self;
    self.inchesTextField.delegate = self;
    self.weightTextField.delegate = self;
}
-(BOOL)isReadyToReview
{
    NSString *emptyField = @"";
    
    if (    [_nameTextField.text isEqualToString: emptyField]
        || [_dateOfBirthTextField.text isEqualToString: emptyField]
        || [_addressTextField.text isEqualToString: emptyField]
        || [_feetTextField.text isEqualToString: emptyField]
        || [_inchesTextField.text isEqualToString: emptyField]
        || [_weightTextField.text isEqualToString: emptyField]
       )
        return false;
    else
        return true;
        
}
-(void) getCorrectHeight: (NSString*)origFeet : (NSString *)origInches
{
    int feet = [origFeet intValue];
    int inches = [origInches intValue];
    if (inches >= 12)
    {
        feet += (inches / 12);
        inches  = (inches % 12);
    }
    _feetTextField.text = [NSString stringWithFormat:@"%d",feet];
    _inchesTextField.text = [NSString stringWithFormat:@"%d",inches];
}
@end
