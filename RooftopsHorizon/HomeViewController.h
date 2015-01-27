//
//  HomeViewController.h
//  RooftopsHorizon
//
//  Created by Olivier Medina on 16/12/2014.
//  Copyright (c) 2014 Olivier Medina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btn_rh;
@property (weak, nonatomic) IBOutlet UIButton *btn_music;
@property (weak, nonatomic) IBOutlet UIImageView *bg_home;

- (IBAction)OnButtonClick:(id)sender;

@end
