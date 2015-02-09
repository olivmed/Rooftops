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
#import "SCUI.h"
#import <SingleTrackTableViewController.h>

@interface HomeViewController : UICollectionViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *navButton;
@property (strong, nonatomic) IBOutlet UICollectionView *homeCollectionView;

@end
