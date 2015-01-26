//
//  WSRooftopsHorizon.m
//  RooftopsHorizon
//
//  Created by Olivier Medina on 26/01/2015.
//  Copyright (c) 2015 Olivier Medina. All rights reserved.
//

#import "WSRooftopsHorizon.h"


@implementation WSRooftopsHorizon

@synthesize sProperty;


+ (id)sharedData {
    static WSRooftopsHorizon *sharedMyData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyData = [[self alloc] init];
    });
    return sharedMyData;
}

- (id)init {
    if (self = [super init]) {
        sProperty = @"Default Property Value";
    }
    return self;
}

@end
