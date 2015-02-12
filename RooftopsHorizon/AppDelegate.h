//
//  AppDelegate.h
//  RooftopsHorizon
//
//  Created by Olivier Medina on 10/10/2014.
//  Copyright (c) 2014 Olivier Medina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleCast/GoogleCast.h>
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import "SCUI.h"
#import "MediaListModel.h"

#import "ChromecastDeviceController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate, GCKLoggerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic) ChromecastDeviceController* chromecastDeviceController;
@property(nonatomic,strong) MediaListModel *mediaList;

@end

