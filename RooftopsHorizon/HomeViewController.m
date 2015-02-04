//
//  HomeViewController.m
//  RooftopsHorizon
//
//  Created by Olivier Medina on 03/02/2015.
//  Copyright (c) 2015 Olivier Medina. All rights reserved.
//

#import "HomeViewController.h"


@interface HomeViewController ()

@end

@implementation HomeViewController
static NSString *cellId = @"homeCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Locate your layout
    CSStickyHeaderFlowLayout *layout = (id)self.collectionViewLayout;
    if ([layout isKindOfClass:[CSStickyHeaderFlowLayout class]]) {
        layout.parallaxHeaderReferenceSize = CGSizeMake(self.view.frame.size.width, 240);
    }
    
    // Locate the nib and register it to your collection view
    UINib *headerNib = [UINib nibWithNibName:@"HomeHeader" bundle:nil];
    [self.collectionView registerNib:headerNib
          forSupplementaryViewOfKind:CSStickyHeaderParallaxHeader
                 withReuseIdentifier:@"header"];

     
    self.title = @"Rooftops Horizon";
    SWRevealViewController *revealViewController = self.revealViewController;

    if ( revealViewController )
    {
        [_navButton setTarget: self.revealViewController];
        [_navButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 7;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    CGRect rect = cell.frame;
    rect.size.width = self.view.frame.size.width;
    rect.origin.x = 0;
    [cell setFrame:rect];
    
    cell.lb_title.text = [NSString stringWithFormat:@"DATHAN // WAVES #%ld#", (long)indexPath.row];
    cell.lb_subtitle.text = [NSString stringWithFormat:@"Last release from the well known Dathan, enjoy! #%ld#", (long)indexPath.row];
    cell.lb_subtitle.textColor = [UIColor grayColor];
    cell.iv_cell.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png", (long)indexPath.row]];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    // Check the kind if it's CSStickyHeaderParallaxHeader
    if ([kind isEqualToString:CSStickyHeaderParallaxHeader]) {
        
        UICollectionReusableView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                            withReuseIdentifier:@"header"
                                                                                   forIndexPath:indexPath];
        
        return cell;
        
    } else if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        // Your code to configure your section header...
    } else {
        // other custom supplementary views
    }
    return nil;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
