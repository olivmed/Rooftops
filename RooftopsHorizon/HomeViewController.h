//
//  HomeViewController.h
//  RooftopsHorizon
//
//  Created by Olivier Medina on 03/02/2015.
//  Copyright (c) 2015 Olivier Medina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "HomeCell.h"
#import "CSStickyHeaderFlowLayout.h"

@interface HomeViewController : UICollectionViewController
@property (weak, nonatomic) IBOutlet UITableView *homeTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *navButton;

@end
