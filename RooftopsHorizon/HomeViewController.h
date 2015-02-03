//
//  HomeViewController.h
//  RooftopsHorizon
//
//  Created by Olivier Medina on 03/02/2015.
//  Copyright (c) 2015 Olivier Medina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+APParallaxHeader.h"
#import "SWRevealViewController.h"

@interface HomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, APParallaxViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *homeHeaderView;
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *navButton;

@end
