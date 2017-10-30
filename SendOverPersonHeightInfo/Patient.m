//
//  Patient.m
//  SendOverPersonHeightInfo
//
//  Created by alive on 10/27/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "Patient.h"

@implementation Patient
- (id)initWithName: (NSString *) name
    andWithPatientNumber:(NSNumber *) patientNumber
    andWithDOB: (NSString *) dateOfBirth
    andWithAddress:(NSString *) address
    andWithHeightInFeet:(NSString *)heightInFeet
    andWithHeightInInches:(NSString *)heightInInches
    andWithWeightInPounds: (NSString *)weightInPounds
{
    if (self) {
        [self setName:name];
        [self setPatientNumber:patientNumber];
        [self setDateOfBirth:dateOfBirth];
        [self setAddress:address];
        [self setHeightInFeet:heightInFeet];
        [self setHeightInInches:heightInInches];
        [self setWeightInPounds:weightInPounds];
    }
    return self;
}
@end
