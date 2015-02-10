//
//  CCastViewController.m
//  RooftopsHorizon
//
//  Created by Olivier Medina on 09/02/2015.
//  Copyright (c) 2015 Olivier Medina. All rights reserved.
//

#import "CCastViewController.h"

@interface CCastViewController ()

@end

@implementation CCastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)initCCast:(id)sender {
    self.deviceScanner = [[GCKDeviceScanner alloc] init];
    
    GCKFilterCriteria *filterCriteria = [[GCKFilterCriteria alloc] init];
    filterCriteria = [GCKFilterCriteria criteriaForAvailableApplicationWithID:@"CD62B88B"];
    
    self.deviceScanner.filterCriteria = filterCriteria;
    
    [self.deviceScanner addListener:self];
    [self.deviceScanner startScan];
}

-(void)logToCast{
//    GCKDevice *selectedDevice = [[GCKDevice alloc] init];
//    
//    _deviceManager = [[GCKDeviceManager alloc] initWithDevice:selectedDevice clientPackageName:[info objectForKey:@"CFBundleIdentifier"]];
//    
//    _deviceManager.delegate = self;
//    [self.deviceManager connect];
}

#pragma mark - GCKDeviceScannerListener
- (void)deviceDidComeOnline:(GCKDevice *)device {
    NSLog(@"device found!!!");
    
    UIActionSheet *sheet = [[UIActionSheet alloc] init];
    
    for ( GCKDevice* device in _deviceScanner.devices ){
        UIButton* bt = [[UIButton alloc] init];
        [bt addTarget:self action:@selector(logToCast) forControlEvents:UIControlEventTouchUpInside];
        [bt setTitle:device.friendlyName forState:UIControlStateNormal];
        [sheet addSubview:bt];
    }
    
    [sheet showInView:_myView];
}

#pragma mark - GCKDeviceManagerDelegate
- (void)deviceManagerDidConnect:(GCKDeviceManager *)deviceManager {
    NSLog(@"connected!!");
    
    [self.deviceManager launchApplication:@"CD62B88B"];
}

- (void)deviceDidGoOffline:(GCKDevice *)device {
    NSLog(@"device disappeared!!!");
}
@end
