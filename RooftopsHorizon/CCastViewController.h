//
//  CCastViewController.h
//  RooftopsHorizon
//
//  Created by Olivier Medina on 09/02/2015.
//  Copyright (c) 2015 Olivier Medina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleCast/GCKFilterCriteria.h>
#import <GoogleCast/GCKDeviceScanner.h>
#import <GoogleCast/GCKDevice.h>
#import <GoogleCast/GCKDeviceManager.h>

@interface CCastViewController : UIViewController <GCKDeviceScannerListener, GCKDeviceManagerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *bt_cast;

@property (weak, nonatomic) IBOutlet UIView *myView;
@property (retain, nonatomic) GCKDeviceScanner *deviceScanner;
@property (retain, nonatomic) GCKDeviceManager *deviceManager;
- (IBAction)initCCast:(id)sender;

@end
