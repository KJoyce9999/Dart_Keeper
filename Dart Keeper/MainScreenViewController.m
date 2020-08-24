//
//  MainScreenViewController.m
//  Dart Scoreboard (X01)
//
//  Created by Keenan Joyce on 4/10/18.
//  Copyright © 2018 Keenan Joyce. All rights reserved.
//

#import "MainScreenViewController.h"

@interface MainScreenViewController ()

@end

@implementation MainScreenViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  UIGraphicsBeginImageContext(self.view.frame.size); // re-size image to fit view
  [[UIImage imageNamed:@"blackboardBackground.png"] drawInRect:self.view.bounds];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  self.view.backgroundColor = [UIColor colorWithPatternImage:image];
  
  X01Button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  CricketButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
