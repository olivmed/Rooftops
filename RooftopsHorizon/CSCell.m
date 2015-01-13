//
//  CSCell.m
//  RooftopsHorizon
//
//  Created by Olivier Medina on 16/12/2014.
//  Copyright (c) 2014 Olivier Medina. All rights reserved.
//

#import "CSCell.h"

@implementation CSCell

- (void)awakeFromNib {
    // Initialization code
}


-(void)setData:(NSString *)data{
    self.cellLabel.text = data;
}
@end
