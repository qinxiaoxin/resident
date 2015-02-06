//
//  ResidentMainArrayService.m
//  resident
//
//  Created by Xin Qin on 2/6/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "ResidentMainArrayService.h"

@implementation ResidentMainArrayService

+ (NSArray *)fetchResidentMainArray
{
    NSArray *mainArray = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"resident_main" ofType:@"plist"]];
    
    return mainArray;
}

@end
