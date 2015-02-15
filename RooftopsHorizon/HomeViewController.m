//
//  HomeViewController.m
//  RooftopsHorizon
//
//  Created by Olivier Medina on 03/02/2015.
//  Copyright (c) 2015 Olivier Medina. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "SimpleImageFetcher.h"
#import "Media.h"
#import "MediaListModel.h"
#import "CastInstructionsViewController.h"

@interface HomeViewController ()
{
    __weak ChromecastDeviceController *_chromecastController;
}
@property(nonatomic, strong) MediaListModel *mediaList;

@end


@implementation HomeViewController
static NSString *cellId = @"homeCell";
static NSString *kCastSegueIdentifier = @"castMedia";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Store a reference to the chromecast controller.
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    _chromecastController = delegate.chromecastDeviceController;

    // Show stylized application title in the titleview.
//    self.navigationItem.titleView =
//    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_castvideos.png"]];
//    
    // Display cast icon in the right nav bar button, if we have devices.
    if (_chromecastController.deviceScanner.devices.count > 0) {
        [self showCastIcon];
    }
    
    // Asynchronously load the media json.
    delegate.mediaList = [[MediaListModel alloc] init];
    self.mediaList = delegate.mediaList;
    [self.mediaList loadMedia:^{
        self.title = self.mediaList.mediaTitle;
        [self.homeCollectionView reloadData];
    }];
    
    
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
    
    [_homeCollectionView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
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


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
// Show cast icon. If this is the first time the cast icon is appearing, show an overlay with
// instructions highlighting the cast icon.
- (void) showCastIcon {
    self.navigationItem.rightBarButtonItem = _chromecastController.chromecastBarButton;

    [CastInstructionsViewController showIfFirstTimeOverViewController:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Assign ourselves as delegate ONLY in viewWillAppear of a view controller.
    _chromecastController.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [_chromecastController updateToolbarForViewController:self];
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
        
        
        UIButton* bt = [[UIButton alloc] initWithFrame:cell.frame];
        [bt addTarget:self action:@selector(didClickOnHomeHeader) forControlEvents:UIControlEventTouchUpInside];
        bt.backgroundColor = [UIColor clearColor];
        
        [cell addSubview:bt];
        return cell;
        
    } else if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        // Your code to configure your section header...
    } else {
        // other custom supplementary views
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.frame.size.width, 100);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    SCAccount *account = [SCSoundCloud account];
//    if (account == nil) {
//        UIAlertView *alert = [[UIAlertView alloc]
//                              initWithTitle:@"Not Logged In"
//                              message:@"You must login first"
//                              delegate:nil
//                              cancelButtonTitle:@"OK"
//                              otherButtonTitles:nil];
//        [alert show];
//        return;
//    }
//    
//    SCRequestResponseHandler handler;
//    handler = ^(NSURLResponse *response, NSData *data, NSError *error) {
//        NSError *jsonError = nil;
//        NSJSONSerialization *jsonResponse = [NSJSONSerialization
//                                             JSONObjectWithData:data
//                                             options:0
//                                             error:&jsonError];
//        if (!jsonError && [jsonResponse isKindOfClass:[NSArray class]]) {
//            SingleTrackTableViewController *trackListVC;
//            trackListVC = [[SingleTrackTableViewController alloc]
//                           initWithNibName:@"SingleTrackTableViewController"
//                           bundle:nil];
//            trackListVC.tracks = (NSArray *)jsonResponse;
//            [self presentViewController:trackListVC
//                               animated:YES completion:nil];
//        }
//    };
//    
//    NSString *resourceURL = @"https://api.soundcloud.com/me/favorites.json";
//    [SCRequest performMethod:SCRequestMethodGET
//                  onResource:[NSURL URLWithString:resourceURL]
//             usingParameters:nil
//                 withAccount:account
//      sendingProgressHandler:nil
//             responseHandler:handler];
    
    NSLog(@"%ld", (long)indexPath.row);
    [self didClickOnHomeHeader];
//    [self performSegueWithIdentifier:@"cast" sender:self];

}

-(void)didClickOnHomeHeader{
    [self performSegueWithIdentifier:@"postDetails" sender:self];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Preparing seque");
}

//
//#pragma Sooundcloud API
//
//- (IBAction) login:(id) sender
//{
//    SCLoginViewControllerCompletionHandler handler = ^(NSError *error) {
//        if (SC_CANCELED(error)) {
//            NSLog(@"Canceled!");
//        } else if (error) {
//            NSLog(@"Error: %@", [error localizedDescription]);
//        } else {
//            NSLog(@"Done! : %@", [SCSoundCloud account] );
//            
//        }
//    };
//    
//    [SCSoundCloud requestAccessWithPreparedAuthorizationURLHandler:^(NSURL *preparedURL) {
//        SCLoginViewController *loginViewController;
//        
//        loginViewController = [SCLoginViewController
//                               loginViewControllerWithPreparedURL:preparedURL
//                               completionHandler:handler];
//        [self presentViewController:loginViewController animated:YES completion:nil];
//    }];
//}
//
//- (IBAction) getTracks:(id) sender
//{
//    SCAccount *account = [SCSoundCloud account];
//    if (account == nil) {
//        UIAlertView *alert = [[UIAlertView alloc]
//                              initWithTitle:@"Not Logged In"
//                              message:@"You must login first"
//                              delegate:nil
//                              cancelButtonTitle:@"OK"
//                              otherButtonTitles:nil];
//        [alert show];
//        return;
//    }
//    
//    SCRequestResponseHandler handler;
//    handler = ^(NSURLResponse *response, NSData *data, NSError *error) {
//        NSError *jsonError = nil;
//        NSJSONSerialization *jsonResponse = [NSJSONSerialization
//                                             JSONObjectWithData:data
//                                             options:0
//                                             error:&jsonError];
//        if (!jsonError && [jsonResponse isKindOfClass:[NSArray class]]) {
//            SingleTrackTableViewController *trackListVC;
//            trackListVC = [[SingleTrackTableViewController alloc]
//                           initWithNibName:@"SCTTrackListViewController"
//                           bundle:nil];
//            trackListVC.tracks = (NSArray *)jsonResponse;
//            [self presentViewController:trackListVC
//                               animated:YES completion:nil];
//        }
//    };
//    
//    NSString *resourceURL = @"https://api.soundcloud.com/me/tracks.json";
//    [SCRequest performMethod:SCRequestMethodGET
//                  onResource:[NSURL URLWithString:resourceURL]
//             usingParameters:nil
//                 withAccount:account
//      sendingProgressHandler:nil
//             responseHandler:handler];
//}
//

#pragma mark - ChromecastControllerDelegate

/**
 * Called when chromecast devices are discoverd on the network.
 */
- (void)didDiscoverDeviceOnNetwork {
    // Add the chromecast icon if not present.
    [self showCastIcon];
}

/**
 * Called when connection to the device was established.
 *
 * @param device The device to which the connection was established.
 */
- (void)didConnectToDevice:(GCKDevice *)device {
    [_chromecastController updateToolbarForViewController:self];
}

/**
 * Called when connection to the device was closed.
 */
- (void)didDisconnect {
    [_chromecastController updateToolbarForViewController:self];
}

/**
 * Called when the playback state of media on the device changes.
 */
- (void)didReceiveMediaStateChange {
    [_chromecastController updateToolbarForViewController:self];
}

/**
 * Called to display the modal device view controller from the cast icon.
 */
- (void)shouldDisplayModalDeviceController {
    [self performSegueWithIdentifier:@"listDevices" sender:self];
}

/**
 * Called to display the remote media playback view controller.
 */
- (void)shouldPresentPlaybackController {
    // Select the item being played in the table, so prepareForSegue can find the
    // associated Media object.
    NSString *title =
    [_chromecastController.mediaInformation.metadata stringForKey:kGCKMetadataKeyTitle];
    int index = [self.mediaList indexOfMediaByTitle:title];
    if (index >= 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        [self.homeCollectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
        [self performSegueWithIdentifier:@"castMedia" sender:self];
        
    }
}

@end
