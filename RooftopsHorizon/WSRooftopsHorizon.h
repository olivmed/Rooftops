//
//  WSRooftopsHorizon.h
//  RooftopsHorizon
//
//  Created by Olivier Medina on 26/01/2015.
//  Copyright (c) 2015 Olivier Medina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSRooftopsHorizon : NSObject
{
    NSString *sProperty;
}

@property (nonatomic, retain) NSString *sProperty;

+ (id)sharedData;

@end
