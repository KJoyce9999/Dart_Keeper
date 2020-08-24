//
//  CricketStoryboardViewController.m
//  Dart Scoreboard (X01)
//
//  Created by Keenan Joyce on 3/27/18.
//  Copyright © 2018 Keenan Joyce. All rights reserved.
//

#import "CricketViewController.h"


@interface CricketViewController ()

@end

@implementation CricketViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIGraphicsBeginImageContext(self.view.frame.size); // re-size image
  [[UIImage imageNamed:@"blackboardBackground.png"] drawInRect:self.view.bounds];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  self.view.backgroundColor = [UIColor colorWithPatternImage:image];  // set background image
  
  TeamA20Marks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamA19Marks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamA18Marks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamA17Marks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamA16Marks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamA15Marks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamABullMarks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamB20Marks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamB19Marks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamB18Marks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamB17Marks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamB16Marks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamB15Marks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamBBullMarks.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  
  TeamA20Score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamA19Score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamA18Score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamA17Score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamA16Score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamA15Score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamABullScore.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamATotalScore.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamB20Score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamB19Score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamB18Score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamB17Score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamB16Score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamB15Score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamBBullScore.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamBTotalScore.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  
  TeamALabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamBLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  UI20Label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  UI19Label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  UI18Label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  UI17Label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  UI16Label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  UI15Label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  UIBullLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TotalScoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  
  UndoButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  NewGameButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  HomeButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  
  TeamA20Score.enabled = NO;
  TeamA19Score.enabled = NO;
  TeamA18Score.enabled = NO;
  TeamA17Score.enabled = NO;
  TeamA16Score.enabled = NO;
  TeamA15Score.enabled = NO;
  TeamABullScore.enabled = NO;
  TeamB20Score.enabled = NO;
  TeamB19Score.enabled = NO;
  TeamB18Score.enabled = NO;
  TeamB17Score.enabled = NO;
  TeamB16Score.enabled = NO;
  TeamB15Score.enabled = NO;
  TeamBBullScore.enabled = NO;
  TeamATotalScore.enabled = NO;
  TeamBTotalScore.enabled = NO;
  CricketLabel.enabled = NO;
}
-(void)viewWillAppear:(BOOL)animated
{
  [self loadScoreData];
}

-(void) viewWillDisappear:(BOOL)animated
{
  [self saveScoreData];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(IBAction) textFieldDismissA:(id)sender
{
  [TeamALabel resignFirstResponder];
  NSString *teamAText = TeamALabel.text;
  [[NSUserDefaults standardUserDefaults] setObject:(teamAText) forKey:@"TeamALabel"];
}

-(IBAction) textFieldDismissB:(id)sender
{
  [TeamBLabel resignFirstResponder];
  NSString *teamBText = TeamBLabel.text;
  [[NSUserDefaults standardUserDefaults] setObject:(teamBText) forKey:@"TeamBLabel"];
}

-(void) saveScoreData  // save scoreArrays values
{
  [[NSUserDefaults standardUserDefaults] setInteger:(teamAScoreArray[twentyPlace]) forKey:@"teamATwentiesPlace"];
  [[NSUserDefaults standardUserDefaults] setInteger:(teamAScoreArray[nineteenPlace]) forKey:@"teamANinteensPlace"];
  [[NSUserDefaults standardUserDefaults] setInteger:(teamAScoreArray[eighteenPlace]) forKey:@"teamAEighteensPlace"];
  [[NSUserDefaults standardUserDefaults] setInteger:(teamAScoreArray[seventeenPlace]) forKey:@"teamASeventeensPlace"];
  [[NSUserDefaults standardUserDefaults] setInteger:(teamAScoreArray[sixteenPlace]) forKey:@"teamASixteensPlace"];
  [[NSUserDefaults standardUserDefaults] setInteger:(teamAScoreArray[fifteenPlace]) forKey:@"teamAFifteensPlace"];
  [[NSUserDefaults standardUserDefaults] setInteger:(teamAScoreArray[bullseyePlace]) forKey:@"teamABullseyesPlace"];
  
  [[NSUserDefaults standardUserDefaults] setInteger:(teamBScoreArray[twentyPlace]) forKey:@"teamBTwentiesPlace"];
  [[NSUserDefaults standardUserDefaults] setInteger:(teamBScoreArray[nineteenPlace]) forKey:@"teamBNinteensPlace"];
  [[NSUserDefaults standardUserDefaults] setInteger:(teamBScoreArray[eighteenPlace]) forKey:@"teamBEighteensPlace"];
  [[NSUserDefaults standardUserDefaults] setInteger:(teamBScoreArray[seventeenPlace]) forKey:@"teamBSeventeensPlace"];
  [[NSUserDefaults standardUserDefaults] setInteger:(teamBScoreArray[sixteenPlace]) forKey:@"teamBSixteensPlace"];
  [[NSUserDefaults standardUserDefaults] setInteger:(teamBScoreArray[fifteenPlace]) forKey:@"teamBFifteensPlace"];
  [[NSUserDefaults standardUserDefaults] setInteger:(teamBScoreArray[bullseyePlace]) forKey:@"teamBBullseyesPlace"];
  
  [[NSUserDefaults standardUserDefaults] setInteger:(turnDataIndex) forKey:@"turnDataIndex"];
  for(long i = 0; i <= turnDataIndex+1; i++)
  {
    [[NSUserDefaults standardUserDefaults] setInteger:(turnDatabase[i]) forKey:[NSString stringWithFormat:@"turnData%ld", i]];
  }
}

-(void) loadScoreData  // load saved scoreArray values
{
  teamAScoreArray[twentyPlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamATwentiesPlace"];
  teamAScoreArray[nineteenPlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamANinteensPlace"];
  teamAScoreArray[eighteenPlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamAEighteensPlace"];
  teamAScoreArray[seventeenPlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamASeventeensPlace"];
  teamAScoreArray[sixteenPlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamASixteensPlace"];
  teamAScoreArray[fifteenPlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamAFifteensPlace"];
  teamAScoreArray[bullseyePlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamABullseyesPlace"];
  
  teamBScoreArray[twentyPlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamBTwentiesPlace"];
  teamBScoreArray[nineteenPlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamBNinteensPlace"];
  teamBScoreArray[eighteenPlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamBEighteensPlace"];
  teamBScoreArray[seventeenPlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamBSeventeensPlace"];
  teamBScoreArray[sixteenPlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamBSixteensPlace"];
  teamBScoreArray[fifteenPlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamBFifteensPlace"];
  teamBScoreArray[bullseyePlace] = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamBBullseyesPlace"];
  
  TeamALabel.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"TeamALabel"];
  TeamBLabel.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"TeamBLabel"];
  
  turnDataIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"turnDataIndex"];
  for(long i = 0; i <= turnDataIndex; i++)
  {
    turnDatabase[i] = [[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"turnData%ld", i]];
  }
  
  NSString *tempText = TeamALabel.text;
  if([tempText length] == 0)
  {TeamALabel.text = @"Team A";}
  tempText = TeamBLabel.text;
  if([tempText length] == 0)
  {TeamBLabel.text = @"Team B";}
  
  for(activeScore = 0; activeScore < 18; activeScore++)
  {[self updateScoreDisplayValues];}
}

- (void)newGame
{
  for(int i = 0; i < scoreArraySize; i++)
  {
    teamAScoreArray[i] = 0;
    teamBScoreArray[i] = 0;
  }
  for(int i = 0; i <= turnDataIndex; i++)
  {
    turnDatabase[i] = 0;
    
  }
  [self clearUI];
  activeScore = 0;
  activeText = 0;
  turnDataIndex = 0;
}

-(IBAction) newGameButton
{
  UIAlertController *alertController = [UIAlertController
                                        alertControllerWithTitle:@"Are you sure you want to start a new game?"
                                        message:[NSString stringWithFormat:@"You will loose your current game data."]
                                        preferredStyle:UIAlertControllerStyleAlert];
  UIAlertAction *noButton = [UIAlertAction
                             actionWithTitle:NSLocalizedString(@"No",)
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction *yesButton)
                             {NSLog(@"No");
                               
                             }];
  UIAlertAction *yesButton = [UIAlertAction
                              actionWithTitle:NSLocalizedString(@"Yes",)
                              style:UIAlertActionStyleCancel
                              handler:^(UIAlertAction *noButton)
                              {NSLog(@"Yes");
                                [self newGame];
                              }];
  [alertController addAction:yesButton];
  [alertController addAction:noButton];
  
  [self presentViewController:alertController animated:YES completion:nil];
}

- (void) checkGameStatus
{
  if ((teamAScoreArray[twentyPlace] >= 3) && (teamAScoreArray[nineteenPlace] >= 3) && (teamAScoreArray[eighteenPlace] >= 3) && (teamAScoreArray[seventeenPlace] >= 3) && (teamAScoreArray[sixteenPlace] >= 3) && (teamAScoreArray[fifteenPlace] >= 3) && (teamAScoreArray[bullseyePlace] >= 3) && (teamATotal > teamBTotal))
  {    UIAlertController *alertController = [UIAlertController
                                             alertControllerWithTitle:[NSString stringWithFormat:@"%@ Won!", TeamALabel.text]
                                             message:[NSString stringWithFormat:@"Do you want to go back?"]
                                             preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *backButton = [UIAlertAction
                                actionWithTitle:NSLocalizedString(@"Go Back",)
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction *yesButton)
                                {}];
    UIAlertAction *newGameButton = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"New Game",)
                               style:UIAlertActionStyleCancel
                               handler:^(UIAlertAction *noButton)
                               {[self newGame];}];
    
    [alertController addAction:backButton];
    [alertController addAction:newGameButton];
    [self presentViewController:alertController animated:YES completion:nil];
  }
  
  else if ((teamBScoreArray[twentyPlace] >= 3) && (teamBScoreArray[nineteenPlace] >= 3) && (teamBScoreArray[eighteenPlace] >= 3) && (teamBScoreArray[seventeenPlace] >= 3) && (teamBScoreArray[sixteenPlace] >= 3) && (teamBScoreArray[fifteenPlace] >= 3) && (teamBScoreArray[bullseyePlace] >= 3) && (teamBTotal > teamATotal))
  {    UIAlertController *alertController = [UIAlertController
                                             alertControllerWithTitle:[NSString stringWithFormat:@"%@ Won!", TeamBLabel.text]
                                             message:[NSString stringWithFormat:@"Do you want to go back?"]
                                             preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *backButton = [UIAlertAction
                                 actionWithTitle:NSLocalizedString(@"Go Back",)
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction *yesButton)
                                 {}];
    UIAlertAction *newGameButton = [UIAlertAction
                                    actionWithTitle:NSLocalizedString(@"New Game",)
                                    style:UIAlertActionStyleCancel
                                    handler:^(UIAlertAction *noButton)
                                    {[self newGame];}];
    
    [alertController addAction:backButton];
    [alertController addAction:newGameButton];
  [self presentViewController:alertController animated:YES completion:nil];
  }
}

-(void) updateScoreDisplayValues
{
  switch(activeScore)
  {
    case 1:
      if(teamAScoreArray[twentyPlace] == 0)
      {[TeamA20Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamAScoreArray[twentyPlace] == 1)
      {[TeamA20Marks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[twentyPlace] == 2)
      {[TeamA20Marks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[twentyPlace] >= 3)
      {[TeamA20Marks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamAScoreArray[twentyPlace] > 3) && (teamBScoreArray[twentyPlace] < 3))
      {TeamA20Score.text = [NSString stringWithFormat:@"%ld", ((teamAScoreArray[twentyPlace]-3)*20)];}
      else if(teamAScoreArray[twentyPlace] < 4)
      {TeamA20Score.text = [NSString stringWithFormat:@""];}
      break;
    case 2:
      if(teamAScoreArray[nineteenPlace] == 0)
      {[TeamA19Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamAScoreArray[nineteenPlace] == 1)
      {[TeamA19Marks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[nineteenPlace] == 2)
      {[TeamA19Marks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[nineteenPlace] >= 3)
      {[TeamA19Marks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamAScoreArray[nineteenPlace] > 3) && (teamBScoreArray[nineteenPlace] < 3))
      {TeamA19Score.text = [NSString stringWithFormat:@"%ld", ((teamAScoreArray[nineteenPlace]-3)*19)];}
      else if(teamAScoreArray[nineteenPlace] < 4)
      {TeamA19Score.text = [NSString stringWithFormat:@""];}
      break;
    case 3:
      if(teamAScoreArray[eighteenPlace] == 0)
      {[TeamA18Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamAScoreArray[eighteenPlace] == 1)
      {[TeamA18Marks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[eighteenPlace] == 2)
      {[TeamA18Marks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[eighteenPlace] >= 3)
      {[TeamA18Marks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamAScoreArray[eighteenPlace] > 3) && (teamBScoreArray[eighteenPlace] < 3))
      {TeamA18Score.text = [NSString stringWithFormat:@"%ld", ((teamAScoreArray[eighteenPlace]-3)*18)];}
      else if(teamAScoreArray[eighteenPlace] < 4)
      {TeamA18Score.text = [NSString stringWithFormat:@""];}
      break;
    case 4:
      if(teamAScoreArray[seventeenPlace] == 0)
      {[TeamA17Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamAScoreArray[seventeenPlace] == 1)
      {[TeamA17Marks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[seventeenPlace] == 2)
      {[TeamA17Marks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[seventeenPlace] >= 3)
      {[TeamA17Marks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamAScoreArray[seventeenPlace] > 3) && (teamBScoreArray[seventeenPlace] < 3))
      {TeamA17Score.text = [NSString stringWithFormat:@"%ld", ((teamAScoreArray[seventeenPlace]-3)*17)];}
      else if(teamAScoreArray[seventeenPlace] < 4)
      {TeamA17Score.text = [NSString stringWithFormat:@""];}
      break;
    case 5:
      if(teamAScoreArray[sixteenPlace] == 0)
      {[TeamA16Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamAScoreArray[sixteenPlace] == 1)
      {[TeamA16Marks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[sixteenPlace] == 2)
      {[TeamA16Marks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[sixteenPlace] >= 3)
      {[TeamA16Marks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamAScoreArray[sixteenPlace] > 3) && (teamBScoreArray[sixteenPlace] < 3))
      {TeamA16Score.text = [NSString stringWithFormat:@"%ld", ((teamAScoreArray[sixteenPlace]-3)*16)];}
      else if(teamAScoreArray[sixteenPlace] < 4)
      {TeamA16Score.text = [NSString stringWithFormat:@""];}
      break;
    case 6:
      if(teamAScoreArray[fifteenPlace] == 0)
      {[TeamA15Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamAScoreArray[fifteenPlace] == 1)
      {[TeamA15Marks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[fifteenPlace] == 2)
      {[TeamA15Marks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[fifteenPlace] >= 3)
      {[TeamA15Marks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamAScoreArray[fifteenPlace] > 3) && (teamBScoreArray[fifteenPlace] < 3))
      {TeamA15Score.text = [NSString stringWithFormat:@"%ld", ((teamAScoreArray[fifteenPlace]-3)*15)];}
      else if(teamAScoreArray[fifteenPlace] < 4)
      {TeamA15Score.text = [NSString stringWithFormat:@""];}
      break;
    case 7:
      if(teamAScoreArray[bullseyePlace] == 0)
      {[TeamABullMarks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamAScoreArray[bullseyePlace] == 1)
      {[TeamABullMarks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[bullseyePlace] == 2)
      {[TeamABullMarks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamAScoreArray[bullseyePlace] >= 3)
      {[TeamABullMarks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamAScoreArray[bullseyePlace] > 3) && (teamBScoreArray[bullseyePlace] < 3))
      {TeamABullScore.text = [NSString stringWithFormat:@"%ld", ((teamAScoreArray[bullseyePlace]-3)*25)];}
      else if(teamAScoreArray[bullseyePlace] < 4)
      {TeamABullScore.text = [NSString stringWithFormat:@""];}
      break;
    case 11:
      if(teamBScoreArray[twentyPlace] == 0)
      {[TeamB20Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamBScoreArray[twentyPlace] == 1)
      {[TeamB20Marks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[twentyPlace] == 2)
      {[TeamB20Marks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[twentyPlace] >= 3)
      {[TeamB20Marks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamBScoreArray[twentyPlace] > 3) && (teamAScoreArray[twentyPlace] < 3))
      {TeamB20Score.text = [NSString stringWithFormat:@"%ld", ((teamBScoreArray[twentyPlace]-3)*20)];}
      else if(teamBScoreArray[twentyPlace] < 4)
      {TeamB20Score.text = [NSString stringWithFormat:@""];}
      break;
    case 12:
      if(teamBScoreArray[nineteenPlace] == 0)
      {[TeamB19Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamBScoreArray[nineteenPlace] == 1)
      {[TeamB19Marks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[nineteenPlace] == 2)
      {[TeamB19Marks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[nineteenPlace] >= 3)
      {[TeamB19Marks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamBScoreArray[nineteenPlace] > 3) && (teamAScoreArray[nineteenPlace] < 3))
      {TeamB19Score.text = [NSString stringWithFormat:@"%ld", ((teamBScoreArray[nineteenPlace]-3)*19)];}
      else if(teamBScoreArray[nineteenPlace] < 4)
      {TeamB19Score.text = [NSString stringWithFormat:@""];}
      break;
    case 13:
      if(teamBScoreArray[eighteenPlace] == 0)
      {[TeamB18Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamBScoreArray[eighteenPlace] == 1)
      {[TeamB18Marks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[eighteenPlace] == 2)
      {[TeamB18Marks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[eighteenPlace] >= 3)
      {[TeamB18Marks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamBScoreArray[eighteenPlace] > 3) && (teamAScoreArray[eighteenPlace] < 3))
      {TeamB18Score.text = [NSString stringWithFormat:@"%ld", ((teamBScoreArray[eighteenPlace]-3)*18)];}
      else if(teamBScoreArray[eighteenPlace] < 4)
      {TeamB18Score.text = [NSString stringWithFormat:@""];}
      break;
    case 14:
      if(teamBScoreArray[seventeenPlace] == 0)
      {[TeamB17Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamBScoreArray[seventeenPlace] == 1)
      {[TeamB17Marks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[seventeenPlace] == 2)
      {[TeamB17Marks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[seventeenPlace] >= 3)
      {[TeamB17Marks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamBScoreArray[seventeenPlace] > 3) && (teamAScoreArray[seventeenPlace] < 3))
      {TeamB17Score.text = [NSString stringWithFormat:@"%ld", ((teamBScoreArray[seventeenPlace]-3)*17)];}
      else if(teamBScoreArray[seventeenPlace] < 4)
      {TeamB17Score.text = [NSString stringWithFormat:@""];}
      break;
    case 15:
      if(teamBScoreArray[sixteenPlace] == 0)
      {[TeamB16Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamBScoreArray[sixteenPlace] == 1)
      {[TeamB16Marks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[sixteenPlace] == 2)
      {[TeamB16Marks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[sixteenPlace] >= 3)
      {[TeamB16Marks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamBScoreArray[sixteenPlace] > 3) && (teamAScoreArray[sixteenPlace] < 3))
      {TeamB16Score.text = [NSString stringWithFormat:@"%ld", ((teamBScoreArray[sixteenPlace]-3)*16)];}
      else if(teamBScoreArray[sixteenPlace] < 4)
      {TeamB16Score.text = [NSString stringWithFormat:@""];}
      break;
    case 16:
      if(teamBScoreArray[fifteenPlace] == 0)
      {[TeamB15Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamBScoreArray[fifteenPlace] == 1)
      {[TeamB15Marks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[fifteenPlace] == 2)
      {[TeamB15Marks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[fifteenPlace] >= 3)
      {[TeamB15Marks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamBScoreArray[fifteenPlace] > 3) && (teamAScoreArray[fifteenPlace] < 3))
      {TeamB15Score.text = [NSString stringWithFormat:@"%ld", ((teamBScoreArray[fifteenPlace]-3)*15)];}
      else if(teamBScoreArray[fifteenPlace] < 4)
      {TeamB15Score.text = [NSString stringWithFormat:@""];}
      break;
    case 17:
      if(teamBScoreArray[bullseyePlace] == 0)
      {[TeamBBullMarks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];}
      else if(teamBScoreArray[bullseyePlace] == 1)
      {[TeamBBullMarks setBackgroundImage:[UIImage imageNamed:@"cricketOneLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[bullseyePlace] == 2)
      {[TeamBBullMarks setBackgroundImage:[UIImage imageNamed:@"cricketDoubleLine"] forState:UIControlStateNormal];}
      else if(teamBScoreArray[bullseyePlace] >= 3)
      {[TeamBBullMarks setBackgroundImage:[UIImage imageNamed:@"cricketCircleDoubleLine"] forState:UIControlStateNormal];}
      if((teamBScoreArray[bullseyePlace] > 3) && (teamAScoreArray[bullseyePlace] < 3))
      {TeamBBullScore.text = [NSString stringWithFormat:@"%ld", ((teamBScoreArray[bullseyePlace]-3)*25)];}
      else if(teamBScoreArray[bullseyePlace] < 4)
      {TeamBBullScore.text = [NSString stringWithFormat:@""];}
      break;
  }
  teamATotal = 0;
  teamBTotal = 0;
  mupltiplier = 20;
  
  for(int i = 1; i < scoreArraySize; i++)
  {
    if (mupltiplier == 14)
    {mupltiplier = 25;}
    if(teamAScoreArray[i] > 3)
    {teamATotal = teamATotal + ((teamAScoreArray[i]-3) * mupltiplier);}
    if(teamBScoreArray[i] > 3)
    {teamBTotal = teamBTotal + ((teamBScoreArray[i]-3) * mupltiplier);}
    mupltiplier--;
  }
  if(teamATotal > 0)
  {TeamATotalScore.text = [NSString stringWithFormat:@"%ld", teamATotal];}
  else
  {TeamATotalScore.text = [NSString stringWithFormat:@""];}
  
  if(teamBTotal > 0)
  {TeamBTotalScore.text = [NSString stringWithFormat:@"%ld", teamBTotal];}
  else
  {TeamBTotalScore.text = [NSString stringWithFormat:@""];}
  
  [self saveScoreData];
}

- (IBAction)teamA20Click
{previousActiveText = activeText; activeText = TeamA20Marks; activeScore = 1; [self plusClick];}

- (IBAction)teamA19Click
{previousActiveText = activeText; activeText = TeamA19Marks; activeScore = 2; [self plusClick];}

- (IBAction)teamA18Click
{previousActiveText = activeText; activeText = TeamA18Marks; activeScore = 3; [self plusClick];}

- (IBAction)teamA17Click
{previousActiveText = activeText; activeText = TeamA17Marks; activeScore = 4; [self plusClick];}

- (IBAction)teamA16Click
{previousActiveText = activeText; activeText = TeamA16Marks; activeScore = 5; [self plusClick];}

- (IBAction)teamA15Click
{previousActiveText = activeText; activeText = TeamA15Marks; activeScore = 6; [self plusClick];}

- (IBAction)teamABullClick
{previousActiveText = activeText; activeText = TeamABullMarks; activeScore = 7; [self plusClick];}

- (IBAction)teamB20Click
{previousActiveText = activeText; activeText = TeamB20Marks; activeScore = 11; [self plusClick];}

- (IBAction)teamB19Click
{previousActiveText = activeText; activeText = TeamB19Marks; activeScore = 12; [self plusClick];}

- (IBAction)teamB18Click
{previousActiveText = activeText; activeText = TeamB18Marks; activeScore = 13; [self plusClick];}

- (IBAction)teamB17Click
{previousActiveText = activeText; activeText = TeamB17Marks; activeScore = 14; [self plusClick];}

- (IBAction)teamB16Click
{previousActiveText = activeText; activeText = TeamB16Marks; activeScore = 15; [self plusClick];}

- (IBAction)teamB15Click
{previousActiveText = activeText; activeText = TeamB15Marks; activeScore = 16; [self plusClick];}

- (IBAction)teamBBullClick
{previousActiveText = activeText; activeText = TeamBBullMarks; activeScore = 17; [self plusClick];}


- (IBAction)minusClick
{
  if((activeScore > 0) && (activeScore < 8))
  {
    teamAScoreArray[activeScore]--;
  }
  else if((activeScore > 10) && (activeScore < 18))
  {
    teamBScoreArray[activeScore-10]--;
  }
  [self updateScoreDisplayValues];
}

- (IBAction)plusClick
{
  if((activeScore > 0) && (activeScore < 8))
  {
    if(teamBScoreArray[activeScore] < 3 || teamAScoreArray[activeScore] < 3)
    {
      teamAScoreArray[activeScore]++;
      turnDatabase[turnDataIndex++] = activeScore;
    }
  }
  else if((activeScore > 10) && (activeScore < 18))
  {
    if(teamAScoreArray[activeScore-10] < 3 || teamBScoreArray[activeScore-10] < 3)
    {
      teamBScoreArray[activeScore-10]++;
      turnDatabase[turnDataIndex++] = activeScore;
    }
  }
  
  [self updateScoreDisplayValues];
  [self checkGameStatus];
}

- (IBAction) undoButton
{
  if(turnDataIndex > 0)
  {
    turnDataIndex--;
    activeScore = (int)turnDatabase[turnDataIndex];
    turnDatabase[turnDataIndex] = 0;
    [self minusClick];
  }
}

-(void) clearUI
{
  [TeamA20Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  [TeamA19Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  [TeamA18Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  [TeamA17Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  [TeamA16Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  [TeamA15Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  [TeamABullMarks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  [TeamB20Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  [TeamB19Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  [TeamB18Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  [TeamB17Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  [TeamB16Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  [TeamB15Marks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  [TeamBBullMarks setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
  
  TeamATotalScore.text = [NSString stringWithFormat:@""];
  TeamBTotalScore.text = [NSString stringWithFormat:@""];
  TeamA20Score.text = [NSString stringWithFormat:@""];
  TeamA19Score.text = [NSString stringWithFormat:@""];
  TeamA18Score.text = [NSString stringWithFormat:@""];
  TeamA17Score.text = [NSString stringWithFormat:@""];
  TeamA16Score.text = [NSString stringWithFormat:@""];
  TeamA15Score.text = [NSString stringWithFormat:@""];
  TeamABullScore.text = [NSString stringWithFormat:@""];
  TeamB20Score.text = [NSString stringWithFormat:@""];
  TeamB19Score.text = [NSString stringWithFormat:@""];
  TeamB18Score.text = [NSString stringWithFormat:@""];
  TeamB17Score.text = [NSString stringWithFormat:@""];
  TeamB16Score.text = [NSString stringWithFormat:@""];
  TeamB15Score.text = [NSString stringWithFormat:@""];
  TeamBBullScore.text = [NSString stringWithFormat:@""];
}

@end
