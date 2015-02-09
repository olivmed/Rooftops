//
//  SingleTrackTableViewController.h
//  RooftopsHorizon
//
//  Created by Olivier Medina on 09/02/2015.
//  Copyright (c) 2015 Olivier Medina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "UIKit+AFNetworking/UIImageView+AFNetworking.h"

@interface SingleTrackTableViewController : UITableViewController <AVAudioPlayerDelegate>


@property (nonatomic, strong) NSArray *tracks;

@end
