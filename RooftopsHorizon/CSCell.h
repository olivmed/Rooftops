//
//  CSCell.h
//  RooftopsHorizon
//
//  Created by Olivier Medina on 16/12/2014.
//  Copyright (c) 2014 Olivier Medina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;


-(void)setData:(NSString*)data;
@end
