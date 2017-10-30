//
//  SecondViewController.m
//  SendOverPersonHeightInfo
//
//  Created by user on 10/25/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "SecondViewController.h"
@interface SecondViewController ()
@property(nonatomic,strong) IBOutlet UILabel *nameLabel;
@property(nonatomic,strong) IBOutlet UILabel *dobLabel;
@property(nonatomic,strong) IBOutlet UILabel *heightLabel;
@property(nonatomic,strong) IBOutlet UILabel *addressLabel;
@property(nonatomic,strong) IBOutlet UILabel *weightLabel;
@property(nonatomic,strong) IBOutlet UILabel *heightFeetLabel;
@property(nonatomic,strong) IBOutlet UILabel *weightPoundsLabel;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self displayLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



-(NSString *)convertToMeters :(NSString *) origFeet :(NSString *) origInches {
    double doubleFeet = [origFeet doubleValue];
    double doubleInches = [origInches doubleValue];
    double totalInches = (doubleFeet * 12) + doubleInches;
    double heightInMeters = totalInches * .0254;
    return [NSString stringWithFormat:@"%.2f m",heightInMeters];
}
-(NSString *)convertToMass: (NSString *) origWeight {
    double weight = [origWeight doubleValue];
    double mass = (weight * 453.59237)/1000;
    return [NSString stringWithFormat:@"%.2f kg",mass];
}
-(void)displayLabels {
    
    NSString * heightInMeters = [self convertToMeters:[_patientIntake getHeightInFeet] :[_patientIntake getHeightInInches]];
    NSString *massInKilograms = [self convertToMass:[_patientIntake getWeightInPounds]];
    NSString *heightInFeet = [NSString stringWithFormat:@"%@ ft %@ in",[_patientIntake getHeightInFeet],[_patientIntake getHeightInInches]];
    NSString *weightInPounds = [NSString stringWithFormat:@"%@ lbs",[_patientIntake getWeightInPounds]];
    self.nameLabel.text = [_patientIntake getName];
    self.dobLabel.text = [_patientIntake getDateOfBirth];
    self.addressLabel.text = [_patientIntake getAddress];
    self.heightLabel.text = heightInMeters;
    self.weightLabel.text = massInKilograms;
    self.heightFeetLabel.text = heightInFeet;
    self.weightPoundsLabel.text = weightInPounds;
}



@end
