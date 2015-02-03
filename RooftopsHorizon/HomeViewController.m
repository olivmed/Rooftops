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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    [_homeTableView addParallaxWithView:_homeHeaderView andHeight:_homeHeaderView.frame.size.height];
    [_homeTableView.parallaxView setDelegate:self];
     
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"homeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];

        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"DATHAN // WAVES #%ld#", (long)indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Last release from the well known Dathan, enjoy! #%ld#", (long)indexPath.row];
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.png", (long)indexPath.row]];
    return cell;
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
