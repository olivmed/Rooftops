//
//  HomeCell.h
//  RooftopsHorizon
//
//  Created by Olivier Medina on 04/02/2015.
//  Copyright (c) 2015 Olivier Medina. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HomeCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iv_cell;
@property (weak, nonatomic) IBOutlet UILabel *lb_title;
@property (weak, nonatomic) IBOutlet UILabel *lb_subtitle;

@end
