//
//  Patient.h
//  SendOverPersonHeightInfo
//
//  Created by alive on 10/27/17.
//  Copyright © 2017 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Patient : NSObject
@property(strong, nonatomic, getter=getName, setter=setName:)NSString* name;
@property(strong, nonatomic, getter=getPatientNumber, setter=setPatientNumber:)NSNumber *patientNumber;
@property(strong, nonatomic, getter=getDateOfBirth, setter=setDateOfBirth:)NSString *dateOfBirth;
@property(strong, nonatomic, getter=getAddress, setter=setAddress:)NSString *address;
@property(strong, nonatomic, getter=getHeightInFeet, setter=setHeightInFeet:)NSString *heightInFeet;
@property(strong, nonatomic, getter=getHeightInInches, setter=setHeightInInches:)NSString *heightInInches;
@property(strong, nonatomic, getter=getWeightInPounds, setter=setWeightInPounds:)NSString *weightInPounds;
- (id)initWithName: (NSString *) name
andWithPatientNumber:(NSNumber *) patientNumber
        andWithDOB: (NSString *) dateOfBirth
    andWithAddress:(NSString *) address
andWithHeightInFeet:(NSString *)heightInFeet
andWithHeightInInches:(NSString *)heightInInches
andWithWeightInPounds: (NSString *)weightInPounds;
@end
