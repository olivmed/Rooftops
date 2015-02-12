// Copyright 2014 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "CastInstructionsViewController.h"

@implementation CastInstructionsViewController

NSString *const kHasSeenChromecastOverlay = @"hasSeenChromecastOverlay";

+(void)showIfFirstTimeOverViewController:(UIViewController *)viewController {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  bool hasSeenChromecastOverlay = [defaults boolForKey:kHasSeenChromecastOverlay];

  // Only show it if we haven't seen it before
  if (!hasSeenChromecastOverlay) {
    CastInstructionsViewController *cvc = [[CastInstructionsViewController alloc] init];
    [viewController presentViewController:cvc animated:YES completion:^() {
      // once viewDidAppear is successfully called, mark this preference as viewed
      [defaults setBool:true forKey:kHasSeenChromecastOverlay];
      [defaults synchronize];
    }];
  }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:
                        [[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"]
                                                 bundle:[NSBundle mainBundle]];
    self = [sb instantiateViewControllerWithIdentifier:@"CastInstructions"];
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    // This style is iOS 8.0 only, so on earlier versions we take the overlay without transparency.
    self.modalPresentationStyle = UIModalPresentationOverFullScreen;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

-(IBAction)dismissOverlay:(id)sender {
  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
