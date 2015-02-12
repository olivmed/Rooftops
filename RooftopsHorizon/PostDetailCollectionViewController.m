//
//  PostDetailCollectionViewController.m
//  RooftopsHorizon
//
//  Created by Olivier Medina on 11/02/2015.
//  Copyright (c) 2015 Olivier Medina. All rights reserved.
//

#import "PostDetailCollectionViewController.h"
#import "CSStickyHeaderFlowLayout.h"

@interface PostDetailCollectionViewController ()

@end

@implementation PostDetailCollectionViewController

static NSString * const reuseIdentifier = @"postCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    // Locate your layout
    CSStickyHeaderFlowLayout *layout = (id)self.collectionViewLayout;
    if ([layout isKindOfClass:[CSStickyHeaderFlowLayout class]]) {
        
        UIDevice* thisDevice = [UIDevice currentDevice];
        if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
        {
            layout.parallaxHeaderReferenceSize = CGSizeMake(self.view.frame.size.width, 480);
        }
        else
        {
            layout.parallaxHeaderReferenceSize = CGSizeMake(self.view.frame.size.width, 240);
        }
    }
    
    [_postCollectionView setContentInset:UIEdgeInsetsMake(0, 0, 45, 0)];
    // Locate the nib and register it to your collection view
    UINib *headerNib = [UINib nibWithNibName:@"HomeHeader" bundle:nil];
    [self.collectionView registerNib:headerNib
          forSupplementaryViewOfKind:CSStickyHeaderParallaxHeader
                 withReuseIdentifier:@"header"];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSString* desc = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.";
   
    CGSize size = CGSizeMake(cell.frame.size.width - 20, MAXFLOAT);
    
    CGRect textRect = [desc boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18.0]}
                                         context:nil];
    
    size = textRect.size;
    
    UITextView* tv = [[UITextView alloc] initWithFrame:CGRectMake(10, 5, size.width, size.height)];
    
    [tv setText:desc];
    [tv setFont:[UIFont systemFontOfSize:18.0]];
    [tv setScrollEnabled:NO];
    
    [cell addSubview:tv];
    [cell setBackgroundColor:[UIColor blueColor]];
    
    [cell setFrame:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, size.height)];
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(self.view.frame.size.width, MAXFLOAT);
//}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    // Check the kind if it's CSStickyHeaderParallaxHeader
    if ([kind isEqualToString:CSStickyHeaderParallaxHeader]) {
        
        UICollectionReusableView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                            withReuseIdentifier:@"header"
                                                                                   forIndexPath:indexPath];
        
//        
//        UIButton* bt = [[UIButton alloc] initWithFrame:cell.frame];
//        [bt addTarget:self action:@selector(didClickOnHomeHeader) forControlEvents:UIControlEventTouchUpInside];
//        bt.backgroundColor = [UIColor clearColor];
//        
//        [cell addSubview:bt];
        return cell;
        
    } else if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        // Your code to configure your section header...
    } else {
        // other custom supplementary views
    }
    return nil;
}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
