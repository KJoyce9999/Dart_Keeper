//
//  ViewController.m
//  Dart Scoreboard (X01)
//
//  Created by Stephen Joyce on 1/17/17.
//  Copyright © 2017 Keenan Joyce. All rights reserved.
//

#import "X01ViewController.h"
#import "CricketViewController.h"


@interface X01ViewController ()


@end

@implementation X01ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  UIGraphicsBeginImageContext(self.view.frame.size); // re-size image to fit view
  [[UIImage imageNamed:@"blackboardBackground.png"] drawInRect:self.view.bounds];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  self.view.backgroundColor = [UIColor colorWithPatternImage:image];

  TeamALabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamBLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamCLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamDLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  RoundScore.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamACurrentScore.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamBCurrentScore.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamCCurrentScore.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  TeamDCurrentScore.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
 
  SubmitButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  HomeButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  UndoButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  NewGameButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blueBackground.png"]];
  
  fadedBlue = [UIColor colorWithRed:0.20 green:0.45 blue:0.45 alpha:0.36];
  sameGray = [UIColor colorWithRed:0.70 green:0.70 blue:0.71 alpha:0.36];

  [RoundScore setKeyboardType:UIKeyboardTypeNumberPad];
  TeamACurrentScore.enabled = NO;
  TeamBCurrentScore.enabled = NO;
  TeamCCurrentScore.enabled = NO;
  TeamDCurrentScore.enabled = NO;
  X01Label.enabled = NO;
}

-(void)viewWillAppear:(BOOL)animated
{
  isTeamASelected = false;
  isTeamBSelected = false;
  isTeamCSelected = false;
  isTeamDSelected = false;
  gameLengthState = true;
  [self newGameF];
  activeTeam = 0;
  RoundScore.text = @"";
  
  [self loadScoreData];

  if((playerAmount < 2) || (playerAmount > 4))
  {playerAmount = 4;}
  
  [self refreshTeamAScores];
  [self refreshTeamBScores];
  [self refreshTeamCScores];
  [self refreshTeamDScores];
  
  [self rotateToPrevTeam];
  [self rotateToNextTeam];
  
  if(!gameLengthState)
  {[gameLengthSwitch setOn:YES animated:YES];}
  
  if((teamAArrayIndex <= 1) && (teamBArrayIndex <=1) && (teamCArrayIndex <=1) && (teamDArrayIndex <=1))
  {[self newGameF];}
 
}

-(void)viewDidAppear:(BOOL)animated
{
  PlayerAmountSlider.value = playerAmount;
  [self changePlayerAmount];
}

- (void)showViewController:(UIViewController *)vc
                    sender:(id)sender{};


- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)changePlayerAmount
{
  if((PlayerAmountSlider.value >= 2) && (PlayerAmountSlider.value <= 2.6))
  {PlayerAmountSlider.value = 2; playerAmount = 2; [self changePlayerAmountUI: playerAmount];}
  else if((PlayerAmountSlider.value > 2.6) && (PlayerAmountSlider.value < 3.4))
  {PlayerAmountSlider.value = 3; playerAmount = 3; [self changePlayerAmountUI: playerAmount];}
  else if((PlayerAmountSlider.value >= 3.4) && (PlayerAmountSlider.value <= 4))
  {PlayerAmountSlider.value = 4; playerAmount = 4; [self changePlayerAmountUI: playerAmount];}
  [self saveScoreData];
}

-(void)changePlayerAmountUI:(NSInteger)amount
{
  if(amount == 2)
  {
    TeamCLabel.hidden = YES;
    TeamDLabel.hidden = YES;
    TeamCCurrentScore.hidden = YES;
    TeamDCurrentScore.hidden = YES;
    
    TeamCPrev1.hidden = YES;
    TeamCPrev2.hidden = YES;
    TeamCPrev3.hidden = YES;
    TeamCPrev4.hidden = YES;
    TeamCPrev5.hidden = YES;
    TeamCPrev6.hidden = YES;
    TeamCPrev7.hidden = YES;
    TeamCPrev8.hidden = YES;
    
    TeamDPrev1.hidden = YES;
    TeamDPrev2.hidden = YES;
    TeamDPrev3.hidden = YES;
    TeamDPrev4.hidden = YES;
    TeamDPrev5.hidden = YES;
    TeamDPrev6.hidden = YES;
    TeamDPrev7.hidden = YES;
    TeamDPrev8.hidden = YES;
    
    cellWidthQuarter.active = NO;
    cellWidthThird.active = NO;
    cellWidthHalf.active = YES;
  }
  else if(amount == 3)
  {
    TeamCLabel.hidden = NO;
    TeamDLabel.hidden = YES;
    TeamCCurrentScore.hidden = NO;
    TeamDCurrentScore.hidden = YES;
    
    TeamCPrev1.hidden = NO;
    TeamCPrev2.hidden = NO;
    TeamCPrev3.hidden = NO;
    TeamCPrev4.hidden = NO;
    TeamCPrev5.hidden = NO;
    TeamCPrev6.hidden = NO;
    TeamCPrev7.hidden = NO;
    TeamCPrev8.hidden = NO;
    
    TeamDPrev1.hidden = YES;
    TeamDPrev2.hidden = YES;
    TeamDPrev3.hidden = YES;
    TeamDPrev4.hidden = YES;
    TeamDPrev5.hidden = YES;
    TeamDPrev6.hidden = YES;
    TeamDPrev7.hidden = YES;
    TeamDPrev8.hidden = YES;
    
    cellWidthQuarter.active = NO;
    cellWidthHalf.active = NO;
    cellWidthThird.active = YES;
  }
  else if(amount == 4)
  {
    TeamCLabel.hidden = NO;
    TeamDLabel.hidden = NO;
    TeamCCurrentScore.hidden = NO;
    TeamDCurrentScore.hidden = NO;
    
    TeamCPrev1.hidden = NO;
    TeamCPrev2.hidden = NO;
    TeamCPrev3.hidden = NO;
    TeamCPrev4.hidden = NO;
    TeamCPrev5.hidden = NO;
    TeamCPrev6.hidden = NO;
    TeamCPrev7.hidden = NO;
    TeamCPrev8.hidden = NO;
    
    TeamDPrev1.hidden = NO;
    TeamDPrev2.hidden = NO;
    TeamDPrev3.hidden = NO;
    TeamDPrev4.hidden = NO;
    TeamDPrev5.hidden = NO;
    TeamDPrev6.hidden = NO;
    TeamDPrev7.hidden = NO;
    TeamDPrev8.hidden = NO;
    
    cellWidthHalf.active = NO;
    cellWidthThird.active = NO;
    cellWidthQuarter.active = YES;
  }
}

- (IBAction)switchGL
{
  if(gameLengthState)
  {gameLengthState = false;}
  else if(!gameLengthState)
  {gameLengthState = true;}
}

- (IBAction) keyboardShow:(id)sender
{
  scoreBoxAdjustment.constant = 180;
}

-(IBAction) textFieldDismissA:(id)sender
{
  [TeamALabel resignFirstResponder];
  teamA = TeamALabel.text;
  [[NSUserDefaults standardUserDefaults] setObject:(teamA) forKey:@"TeamALabel"];
}

-(IBAction) textFieldDismissB:(id)sender
{
  [TeamBLabel resignFirstResponder];
  teamB = TeamBLabel.text;
  [[NSUserDefaults standardUserDefaults] setObject:(teamB) forKey:@"TeamBLabel"];
}

-(IBAction) textFieldDismissC:(id)sender
{
  [TeamCLabel resignFirstResponder];
   teamC = TeamCLabel.text;
  [[NSUserDefaults standardUserDefaults] setObject:(teamC) forKey:@"TeamCLabel"];
}

-(IBAction) textFieldDismissD:(id)sender
{
  [TeamDLabel resignFirstResponder];
  teamD = TeamDLabel.text;
  [[NSUserDefaults standardUserDefaults] setObject:(teamD) forKey:@"TeamDLabel"];
}
-(IBAction) textFieldDismissR:(id)sender
{
  [RoundScoreLabel resignFirstResponder];
  scoreBoxAdjustment.constant = 0;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  [RoundScore resignFirstResponder];
  [TeamALabel resignFirstResponder];
  [TeamBLabel resignFirstResponder];
  [TeamCLabel resignFirstResponder];
  [TeamDLabel resignFirstResponder];
  scoreBoxAdjustment.constant = 0;
}

-(void) saveScoreData  // save scoreArrays values
{
  [[NSUserDefaults standardUserDefaults] setBool:(gameLengthState) forKey:@"gameLengthState"];
  [[NSUserDefaults standardUserDefaults] setInteger:(teamAArrayIndex) forKey:@"teamAArrayIndex"];
  [[NSUserDefaults standardUserDefaults] setInteger:(playerAmount) forKey:@"playerAmount"];
  [[NSUserDefaults standardUserDefaults] setInteger:(activeTeam) forKey:@"activeTeam"];
  for(long i = 0; i <= teamAArrayIndex+1; i++)
  {
    [[NSUserDefaults standardUserDefaults] setInteger:(teamAScoreArray[i]) forKey:[NSString stringWithFormat:@"teamA%ld", i]];
  }
  [[NSUserDefaults standardUserDefaults] setInteger:(teamBArrayIndex) forKey:@"teamBArrayIndex"];
  for(long i = 0; i <= teamBArrayIndex+1; i++)
  {
    [[NSUserDefaults standardUserDefaults] setInteger:(teamBScoreArray[i]) forKey:[NSString stringWithFormat:@"teamB%ld", i]];
  }
  [[NSUserDefaults standardUserDefaults] setInteger:(teamCArrayIndex) forKey:@"teamCArrayIndex"];
  for(long i = 0; i <= teamCArrayIndex+1; i++)
  {
    [[NSUserDefaults standardUserDefaults] setInteger:(teamCScoreArray[i]) forKey:[NSString stringWithFormat:@"teamC%ld", i]];
  }
  [[NSUserDefaults standardUserDefaults] setInteger:(teamDArrayIndex) forKey:@"teamDArrayIndex"];
  for(long i = 0; i <= teamDArrayIndex+1; i++)
  {
    [[NSUserDefaults standardUserDefaults] setInteger:(teamDScoreArray[i]) forKey:[NSString stringWithFormat:@"teamD%ld", i]];
  }
}

-(void) loadScoreData  // load saved scoreArray values
{
  gameLengthState = [[NSUserDefaults standardUserDefaults] boolForKey:@"gameLengthState"];
  teamAArrayIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamAArrayIndex"];
  playerAmount = [[NSUserDefaults standardUserDefaults] integerForKey:@"playerAmount"];
  activeTeam = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"activeTeam"];
  for(long i = 0; i <= teamAArrayIndex; i++)
  {
    teamAScoreArray[i] = [[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"teamA%ld", i]];
  }
  teamBArrayIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamBArrayIndex"];
  for(long i = 0; i <= teamBArrayIndex; i++)
  {
    teamBScoreArray[i] = [[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"teamB%ld", i]];
  }
  teamCArrayIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamCArrayIndex"];
  for(long i = 0; i <= teamCArrayIndex; i++)
  {
    teamCScoreArray[i] = [[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"teamC%ld", i]];
  }
  teamDArrayIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"teamDArrayIndex"];
  for(long i = 0; i <= teamDArrayIndex; i++)
  {
    teamDScoreArray[i] = [[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"teamD%ld", i]];
  }
  teamA = TeamALabel.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"TeamALabel"];
  teamB = TeamBLabel.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"TeamBLabel"];
  teamC = TeamCLabel.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"TeamCLabel"];
  teamD = TeamDLabel.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"TeamDLabel"];
  
  NSString *tempText = TeamALabel.text;
  if([tempText length] == 0)
  {teamA = TeamALabel.text = @"Team A";}
  tempText = TeamBLabel.text;
  if([tempText length] == 0)
  {teamB = TeamBLabel.text = @"Team B";}
  tempText = TeamCLabel.text;
  if([tempText length] == 0)
  {teamC = TeamCLabel.text = @"Team C";}
  tempText = TeamDLabel.text;
  if([tempText length] == 0)
  {teamD = TeamDLabel.text = @"Team D";}
}

- (IBAction)newGame
{
  UIAlertController *alertController = [UIAlertController
                                        alertControllerWithTitle:@"Are you sure you want to start a new game?"
                                        message:[NSString stringWithFormat:@"You will loose your current game data."]
                                        preferredStyle:UIAlertControllerStyleAlert];
  UIAlertAction *noButton = [UIAlertAction
                              actionWithTitle:NSLocalizedString(@"No",)
                              style:UIAlertActionStyleDefault
                              handler:^(UIAlertAction *yesButton)
                              {}];
  UIAlertAction *yesButton = [UIAlertAction
                             actionWithTitle:NSLocalizedString(@"Yes",)
                             style:UIAlertActionStyleCancel
                             handler:^(UIAlertAction *noButton)
                             {[self newGameF];  [self saveScoreData];}];
  
  [alertController addAction:yesButton];
  [alertController addAction:noButton];
  [self presentViewController:alertController animated:YES completion:nil];
}
- (void) newGameF
{
  if(gameLengthState) // check game length
  {
    teamAScoreArray[0] = 301;
    teamBScoreArray[0] = 301;
    teamCScoreArray[0] = 301;
    teamDScoreArray[0] = 301;
  }
  else if(!gameLengthState)
  {
    teamAScoreArray[0] = 501;
    teamBScoreArray[0] = 501;
    teamCScoreArray[0] = 501;
    teamDScoreArray[0] = 501;
  }
  for (int i = 1; i < 128; i++) // reset score arrays to zeros
  {
    teamAScoreArray[i] = 0;
    teamBScoreArray[i] = 0;
    teamCScoreArray[i] = 0;
    teamDScoreArray[i] = 0;
  }
  teamAArrayIndex = 1; // reset team A array index
  teamBArrayIndex = 1; // reset team B array index
  teamCArrayIndex = 1; // reset team C array index
  teamDArrayIndex = 1; // reset team D array index
  turnScore = 0; // reset turn score
  TeamACurrentScore.text = [NSString stringWithFormat:@"%ld", (long)teamAScoreArray[teamAArrayIndex-1]];
  TeamBCurrentScore.text = [NSString stringWithFormat:@"%ld", (long)teamBScoreArray[teamBArrayIndex-1]];
  TeamCCurrentScore.text = [NSString stringWithFormat:@"%ld", (long)teamCScoreArray[teamCArrayIndex-1]];
  TeamDCurrentScore.text = [NSString stringWithFormat:@"%ld", (long)teamDScoreArray[teamDArrayIndex-1]];
  
  [self refreshTeamAScores];
  [self refreshTeamBScores];
  [self refreshTeamCScores];
  [self refreshTeamDScores];
}
- (IBAction)submitTurn
{
  [RoundScoreLabel resignFirstResponder];
  scoreBoxAdjustment.constant = 0;
  [self.view endEditing:YES];
  turnScore = [RoundScore.text intValue];
  
  if(![self checkValidTeamSelected])
  {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Please Select a Valid Team"
                                          message:[NSString stringWithFormat:@"Tap anywhere on the team's score column."]
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Ok",)
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *yesButton)
                               {}];
    [alertController addAction:okButton];
    [self presentViewController:alertController animated:YES completion:nil];
    return;
  }
  else if(RoundScore.text.length == 0)
  {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Please Enter A Score"
                                          message:[NSString stringWithFormat:@"Tap the round score box to access the number pad."]
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Ok",)
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *yesButton)
                               {}];
    [alertController addAction:okButton];
    [self presentViewController:alertController animated:YES completion:nil];
    return;
  }
  
  if(turnScore <= 180)
  {
    if(activeTeam == 1)
    {
      teamAScoreArray[teamAArrayIndex] = (teamAScoreArray[teamAArrayIndex-1]-turnScore);
      TeamACurrentScore.text = [NSString stringWithFormat:@"%ld", (long)teamAScoreArray[teamAArrayIndex]];
      teamAArrayIndex++;
      [self refreshTeamAScores];

    }
    else if(activeTeam == 2)
    {
      teamBScoreArray[teamBArrayIndex] = (teamBScoreArray[teamBArrayIndex-1]-turnScore);
      TeamBCurrentScore.text = [NSString stringWithFormat:@"%ld", (long)teamBScoreArray[teamBArrayIndex]];
      teamBArrayIndex++;
      [self refreshTeamBScores];

    }
    else if(activeTeam == 3)
    {
      teamCScoreArray[teamCArrayIndex] = (teamCScoreArray[teamCArrayIndex-1]-turnScore);
      TeamCCurrentScore.text = [NSString stringWithFormat:@"%ld", (long)teamCScoreArray[teamCArrayIndex]];
      teamCArrayIndex++;
      [self refreshTeamCScores];

    }
    else if(activeTeam == 4)
    {
      teamDScoreArray[teamDArrayIndex] = (teamDScoreArray[teamDArrayIndex-1]-turnScore);
      TeamDCurrentScore.text = [NSString stringWithFormat:@"%ld", (long)teamDScoreArray[teamDArrayIndex]];
      teamDArrayIndex++;
      [self refreshTeamDScores];

    }
    turnScore = 0;
    RoundScore.text = @"";
    [self checkGameState];
    [self saveScoreData];
    [self rotateToNextTeam];
  }
  else
  {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Invalid Round Score"
                                          message:[NSString stringWithFormat:@"The maximum for a single turn is 180"]
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Ok",)
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *yesButton)
                               {}];
    [alertController addAction:okButton];
    [self presentViewController:alertController animated:YES completion:nil];
  }
}
- (IBAction)undoTurn
{
  if(![self checkValidTeamSelected])
  {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Please Select a Valid Team"
                                          message:[NSString stringWithFormat:@"Tap anywhere on the team's score column"]
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okButton = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Ok",)
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *yesButton)
                               {}];
    [alertController addAction:okButton];
    [self presentViewController:alertController animated:YES completion:nil];
    return;
  }
  
  if((activeTeam == 1) && (teamAArrayIndex > 1))
  {
    teamAArrayIndex--;
    teamAScoreArray[teamAArrayIndex] = 0;
    [self refreshTeamAScores];
  }
  else if((activeTeam == 2) && (teamBArrayIndex > 1))
  {
    teamBArrayIndex--;
    teamBScoreArray[teamBArrayIndex] = 0;
    [self refreshTeamBScores];
  }
  else if((activeTeam == 3) && (teamCArrayIndex > 1))
  {
    teamCArrayIndex--;
    teamCScoreArray[teamCArrayIndex] = 0;
    [self refreshTeamCScores];
  }
  else if((activeTeam == 4) && (teamDArrayIndex > 1))
  {
    teamDArrayIndex--;
    teamDScoreArray[teamDArrayIndex] = 0;
    [self refreshTeamDScores];
  }
  turnScore = 0;
  RoundScore.text = @"";
  [self checkGameState];
  [self saveScoreData];
}
-(bool) checkValidTeamSelected
{
  if((activeTeam == 1) || (activeTeam == 2))
  {return true;}
  else if((activeTeam == 3) && (playerAmount >= 3))
  {return true;}
  else if((activeTeam == 4) && (playerAmount == 4))
  {return true;}
  else
  {return false;}
}

- (void) checkGameState
{
  //check for overscores
  if(teamAScoreArray[teamAArrayIndex-1] < 0 || teamAScoreArray[teamAArrayIndex-1] == 1)
  {teamAScoreArray[teamAArrayIndex-1] = teamAScoreArray[teamAArrayIndex-2]; [self refreshTeamAScores];}
  
  else if(teamBScoreArray[teamBArrayIndex-1] < 0|| teamBScoreArray[teamBArrayIndex-1] == 1)
  {teamBScoreArray[teamBArrayIndex-1] = teamBScoreArray[teamBArrayIndex-2]; [self refreshTeamBScores];}
  
  else if(teamCScoreArray[teamCArrayIndex-1] < 0|| teamCScoreArray[teamCArrayIndex-1] == 1)
  {teamCScoreArray[teamCArrayIndex-1] = teamCScoreArray[teamCArrayIndex-2]; [self refreshTeamCScores];}
  
  else if(teamDScoreArray[teamDArrayIndex-1] < 0|| teamDScoreArray[teamDArrayIndex-1] == 1)
  {teamDScoreArray[teamDArrayIndex-1] = teamDScoreArray[teamDArrayIndex-2]; [self refreshTeamDScores];}
  
  //check for game wins
  if(teamAScoreArray[teamAArrayIndex-1] == 0)
  {[self gameEndPopup:teamA];}
  
  else if(teamBScoreArray[teamBArrayIndex-1] == 0)
  {[self gameEndPopup:teamB];}
  
  else if(teamCScoreArray[teamCArrayIndex-1] == 0)
  {[self gameEndPopup:teamC];}
  
  else if(teamDScoreArray[teamDArrayIndex-1] == 0)
  {[self gameEndPopup:teamD];}
}

- (void) gameEndPopup: (NSString *) teamName
{
  UIAlertController *alertController = [UIAlertController
                                        alertControllerWithTitle:[NSString stringWithFormat:@"%@ Won!", teamName]
                                        message:[NSString stringWithFormat:@"Do you want to go back?"]
                                        preferredStyle:UIAlertControllerStyleAlert];
  UIAlertAction *backButton = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"Go Back",)
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *yesButton)
                               {[self rotateToPrevTeam]; [self undoTurn];}];
  UIAlertAction *newGameButton = [UIAlertAction
                                  actionWithTitle:NSLocalizedString(@"New Game",)
                                  style:UIAlertActionStyleCancel
                                  handler:^(UIAlertAction *noButton)
                                  {[self newGameF]; [self saveScoreData];}];
  
  [alertController addAction:backButton];
  [alertController addAction:newGameButton];
  [self presentViewController:alertController animated:YES completion:nil];
}



-(void) rotateToNextTeam
{
  isTeamASelected = false;
  isTeamBSelected = false;
  isTeamCSelected = false;
  isTeamDSelected = false;
  if(playerAmount == 2)
  {
    if(activeTeam == 1)
    {[self selectTeamB];}
    else if(activeTeam == 2)
    {[self selectTeamA];}
  }
  else if(playerAmount == 3)
  {switch(activeTeam)
    {
      case 0:
        break;
      case 1:
        [self selectTeamB];
        break;
      case 2:
        [self selectTeamC];
        break;
      case 3:
        [self selectTeamA];
        break;
      case 4:
        [self selectTeamA];
        break;
    }}
  else if(playerAmount == 4)
  {
    switch(activeTeam)
    {
      case 0:
        break;
      case 1:
        [self selectTeamB];
        break;
      case 2:
        [self selectTeamC];
        break;
      case 3:
        [self selectTeamD];
        break;
      case 4:
        [self selectTeamA];
        break;
    }
  }
}
-(void) rotateToPrevTeam
{
  isTeamASelected = false;
  isTeamBSelected = false;
  isTeamCSelected = false;
  isTeamDSelected = false;
  if(playerAmount == 2)
  {
    if(activeTeam == 1)
    {[self selectTeamB];}
    else if(activeTeam == 2)
    {[self selectTeamA];}
  }
  else if(playerAmount == 3)
  {switch(activeTeam)
    {
      case 0:
        break;
      case 1:
        [self selectTeamC];
        break;
      case 2:
        [self selectTeamA];
        break;
      case 3:
        [self selectTeamB];
        break;
      case 4:
        [self selectTeamC];
        break;
    }}
  else if(playerAmount == 4)
  {
    switch(activeTeam)
    {
      case 0:
        break;
      case 1:
        [self selectTeamD];
        break;
      case 2:
        [self selectTeamA];
        break;
      case 3:
        [self selectTeamB];
        break;
      case 4:
        [self selectTeamC];
        break;
    }
  }
}
-(IBAction)selectTeamA
{
  activeTeam = 1;
  [self turnOffHighlights];
  if(isTeamASelected)
  {isTeamASelected = false; [self saveScoreData]; activeTeam = 0; return;}
  isTeamASelected = true;
  TeamAPrev1.backgroundColor = fadedBlue;
  TeamAPrev2.backgroundColor = fadedBlue;
  TeamAPrev3.backgroundColor = fadedBlue;
  TeamAPrev4.backgroundColor = fadedBlue;
  TeamAPrev5.backgroundColor = fadedBlue;
  TeamAPrev6.backgroundColor = fadedBlue;
  TeamAPrev7.backgroundColor = fadedBlue;
  TeamAPrev8.backgroundColor = fadedBlue;
  
  [RoundScoreLabel resignFirstResponder];
  scoreBoxAdjustment.constant = 0;
  [self.view endEditing:YES];
  [self saveScoreData];
}
-(IBAction)selectTeamB
{
  activeTeam = 2;
  [self turnOffHighlights];
  if(isTeamBSelected)
  {isTeamBSelected = false; activeTeam = 0; [self saveScoreData]; return;}
  isTeamBSelected = true;
  TeamBPrev1.backgroundColor = fadedBlue;
  TeamBPrev2.backgroundColor = fadedBlue;
  TeamBPrev3.backgroundColor = fadedBlue;
  TeamBPrev4.backgroundColor = fadedBlue;
  TeamBPrev5.backgroundColor = fadedBlue;
  TeamBPrev6.backgroundColor = fadedBlue;
  TeamBPrev7.backgroundColor = fadedBlue;
  TeamBPrev8.backgroundColor = fadedBlue;
  
  [RoundScoreLabel resignFirstResponder];
  scoreBoxAdjustment.constant = 0;
  [self.view endEditing:YES];
  [self saveScoreData];
}
-(IBAction)selectTeamC
{
  activeTeam = 3;
  [self turnOffHighlights];
  if(isTeamCSelected)
  {isTeamCSelected = false; activeTeam = 0; [self saveScoreData]; return;}
  isTeamCSelected = true;
  TeamCPrev1.backgroundColor = fadedBlue;
  TeamCPrev2.backgroundColor = fadedBlue;
  TeamCPrev3.backgroundColor = fadedBlue;
  TeamCPrev4.backgroundColor = fadedBlue;
  TeamCPrev5.backgroundColor = fadedBlue;
  TeamCPrev6.backgroundColor = fadedBlue;
  TeamCPrev7.backgroundColor = fadedBlue;
  TeamCPrev8.backgroundColor = fadedBlue;
  
  [RoundScoreLabel resignFirstResponder];
  scoreBoxAdjustment.constant = 0;
  [self.view endEditing:YES];
  [self saveScoreData];
}
-(IBAction)selectTeamD
{
  activeTeam = 4;
  [self turnOffHighlights];
  if(isTeamDSelected)
  {isTeamDSelected = false; activeTeam = 0; [self saveScoreData]; return;}
  isTeamDSelected = true;
  TeamDPrev1.backgroundColor = fadedBlue;
  TeamDPrev2.backgroundColor = fadedBlue;
  TeamDPrev3.backgroundColor = fadedBlue;
  TeamDPrev4.backgroundColor = fadedBlue;
  TeamDPrev5.backgroundColor = fadedBlue;
  TeamDPrev6.backgroundColor = fadedBlue;
  TeamDPrev7.backgroundColor = fadedBlue;
  TeamDPrev8.backgroundColor = fadedBlue;
  
  [RoundScoreLabel resignFirstResponder];
  scoreBoxAdjustment.constant = 0;
  [self.view endEditing:YES];
  [self saveScoreData];
}

-(void) turnOffHighlights
{
  TeamAPrev1.backgroundColor = sameGray;
  TeamAPrev2.backgroundColor = sameGray;
  TeamAPrev3.backgroundColor = sameGray;
  TeamAPrev4.backgroundColor = sameGray;
  TeamAPrev5.backgroundColor = sameGray;
  TeamAPrev6.backgroundColor = sameGray;
  TeamAPrev7.backgroundColor = sameGray;
  TeamAPrev8.backgroundColor = sameGray;
  
  TeamBPrev1.backgroundColor = sameGray;
  TeamBPrev2.backgroundColor = sameGray;
  TeamBPrev3.backgroundColor = sameGray;
  TeamBPrev4.backgroundColor = sameGray;
  TeamBPrev5.backgroundColor = sameGray;
  TeamBPrev6.backgroundColor = sameGray;
  TeamBPrev7.backgroundColor = sameGray;
  TeamBPrev8.backgroundColor = sameGray;
  
  TeamCPrev1.backgroundColor = sameGray;
  TeamCPrev2.backgroundColor = sameGray;
  TeamCPrev3.backgroundColor = sameGray;
  TeamCPrev4.backgroundColor = sameGray;
  TeamCPrev5.backgroundColor = sameGray;
  TeamCPrev6.backgroundColor = sameGray;
  TeamCPrev7.backgroundColor = sameGray;
  TeamCPrev8.backgroundColor = sameGray;
  
  TeamDPrev1.backgroundColor = sameGray;
  TeamDPrev2.backgroundColor = sameGray;
  TeamDPrev3.backgroundColor = sameGray;
  TeamDPrev4.backgroundColor = sameGray;
  TeamDPrev5.backgroundColor = sameGray;
  TeamDPrev6.backgroundColor = sameGray;
  TeamDPrev7.backgroundColor = sameGray;
  TeamDPrev8.backgroundColor = sameGray;
}

- (void) refreshTeamAScores
{
  TeamAPrev1.text = @"";
  TeamAPrev2.text = @"";
  TeamAPrev3.text = @"";
  TeamAPrev4.text = @"";
  TeamAPrev5.text = @"";
  TeamAPrev6.text = @"";
  TeamAPrev7.text = @"";
  TeamAPrev8.text = @"";
  
  TeamACurrentScore.text = [NSString stringWithFormat:@"%ld", (long)teamAScoreArray[teamAArrayIndex-1]];
  for(int i = 1; ((i < teamAArrayIndex) && (i <= 9)); i++)
  {
    switch(i)
    {
      case 1:
        TeamAPrev1.text = [NSString stringWithFormat:@"%ld", (long)teamAScoreArray[teamAArrayIndex-2]];
        break;
      case 2:
        TeamAPrev2.text = [NSString stringWithFormat:@"%ld", (long)teamAScoreArray[teamAArrayIndex-3]];
        break;
      case 3:
        TeamAPrev3.text = [NSString stringWithFormat:@"%ld", (long)teamAScoreArray[teamAArrayIndex-4]];
        break;
      case 4:
        TeamAPrev4.text = [NSString stringWithFormat:@"%ld", (long)teamAScoreArray[teamAArrayIndex-5]];
        break;
      case 5:
        TeamAPrev5.text = [NSString stringWithFormat:@"%ld", (long)teamAScoreArray[teamAArrayIndex-6]];
        break;
      case 6:
        TeamAPrev6.text = [NSString stringWithFormat:@"%ld", (long)teamAScoreArray[teamAArrayIndex-7]];
        break;
      case 7:
        TeamAPrev7.text = [NSString stringWithFormat:@"%ld", (long)teamAScoreArray[teamAArrayIndex-8]];
        break;
      case 8:
        TeamAPrev8.text = [NSString stringWithFormat:@"%ld", (long)teamAScoreArray[teamAArrayIndex-9]];
        break;
    }
  }
}
- (void) refreshTeamBScores
{
  TeamBPrev1.text = @"";
  TeamBPrev2.text = @"";
  TeamBPrev3.text = @"";
  TeamBPrev4.text = @"";
  TeamBPrev5.text = @"";
  TeamBPrev6.text = @"";
  TeamBPrev7.text = @"";
  TeamBPrev8.text = @"";
  
  TeamBCurrentScore.text = [NSString stringWithFormat:@"%ld", (long)teamBScoreArray[teamBArrayIndex-1]];
  for(int i = 1; ((i < teamBArrayIndex) && (i <= 9)); i++)
  {
    switch(i)
    {
      case 1:
        TeamBPrev1.text = [NSString stringWithFormat:@"%ld", (long)teamBScoreArray[teamBArrayIndex-2]];
        break;
      case 2:
        TeamBPrev2.text = [NSString stringWithFormat:@"%ld", (long)teamBScoreArray[teamBArrayIndex-3]];
        break;
      case 3:
        TeamBPrev3.text = [NSString stringWithFormat:@"%ld", (long)teamBScoreArray[teamBArrayIndex-4]];
        break;
      case 4:
        TeamBPrev4.text = [NSString stringWithFormat:@"%ld", (long)teamBScoreArray[teamBArrayIndex-5]];
        break;
      case 5:
        TeamBPrev5.text = [NSString stringWithFormat:@"%ld", (long)teamBScoreArray[teamBArrayIndex-6]];
        break;
      case 6:
        TeamBPrev6.text = [NSString stringWithFormat:@"%ld", (long)teamBScoreArray[teamBArrayIndex-7]];
        break;
      case 7:
        TeamBPrev7.text = [NSString stringWithFormat:@"%ld", (long)teamBScoreArray[teamBArrayIndex-8]];
        break;
      case 8:
        TeamBPrev8.text = [NSString stringWithFormat:@"%ld", (long)teamBScoreArray[teamBArrayIndex-9]];
        break;
    }
  }
}
- (void) refreshTeamCScores
{
  TeamCPrev1.text = @"";
  TeamCPrev2.text = @"";
  TeamCPrev3.text = @"";
  TeamCPrev4.text = @"";
  TeamCPrev5.text = @"";
  TeamCPrev6.text = @"";
  TeamCPrev7.text = @"";
  TeamCPrev8.text = @"";
  
  TeamCCurrentScore.text = [NSString stringWithFormat:@"%ld", (long)teamCScoreArray[teamCArrayIndex-1]];
  for(int i = 1; ((i < teamCArrayIndex) && (i <= 9)); i++)
  {
    switch(i)
    {
      case 1:
        TeamCPrev1.text = [NSString stringWithFormat:@"%ld", (long)teamCScoreArray[teamCArrayIndex-2]];
        break;
      case 2:
        TeamCPrev2.text = [NSString stringWithFormat:@"%ld", (long)teamCScoreArray[teamCArrayIndex-3]];
        break;
      case 3:
        TeamCPrev3.text = [NSString stringWithFormat:@"%ld", (long)teamCScoreArray[teamCArrayIndex-4]];
        break;
      case 4:
        TeamCPrev4.text = [NSString stringWithFormat:@"%ld", (long)teamCScoreArray[teamCArrayIndex-5]];
        break;
      case 5:
        TeamCPrev5.text = [NSString stringWithFormat:@"%ld", (long)teamCScoreArray[teamCArrayIndex-6]];
        break;
      case 6:
        TeamCPrev6.text = [NSString stringWithFormat:@"%ld", (long)teamCScoreArray[teamCArrayIndex-7]];
        break;
      case 7:
        TeamCPrev7.text = [NSString stringWithFormat:@"%ld", (long)teamCScoreArray[teamCArrayIndex-8]];
        break;
      case 8:
        TeamCPrev8.text = [NSString stringWithFormat:@"%ld", (long)teamCScoreArray[teamCArrayIndex-9]];
        break;
    }
  }
}
- (void) refreshTeamDScores
{
  TeamDPrev1.text = @"";
  TeamDPrev2.text = @"";
  TeamDPrev3.text = @"";
  TeamDPrev4.text = @"";
  TeamDPrev5.text = @"";
  TeamDPrev6.text = @"";
  TeamDPrev7.text = @"";
  TeamDPrev8.text = @"";
  
  TeamDCurrentScore.text = [NSString stringWithFormat:@"%ld", (long)teamDScoreArray[teamDArrayIndex-1]];
  for(int i = 1; ((i < teamDArrayIndex) && (i <= 9)); i++)
  {
    switch(i)
    {
      case 1:
        TeamDPrev1.text = [NSString stringWithFormat:@"%ld", (long)teamDScoreArray[teamDArrayIndex-2]];
        break;
      case 2:
        TeamDPrev2.text = [NSString stringWithFormat:@"%ld", (long)teamDScoreArray[teamDArrayIndex-3]];
        break;
      case 3:
        TeamDPrev3.text = [NSString stringWithFormat:@"%ld", (long)teamDScoreArray[teamDArrayIndex-4]];
        break;
      case 4:
        TeamDPrev4.text = [NSString stringWithFormat:@"%ld", (long)teamDScoreArray[teamDArrayIndex-5]];
        break;
      case 5:
        TeamDPrev5.text = [NSString stringWithFormat:@"%ld", (long)teamDScoreArray[teamDArrayIndex-6]];
        break;
      case 6:
        TeamDPrev6.text = [NSString stringWithFormat:@"%ld", (long)teamDScoreArray[teamDArrayIndex-7]];
        break;
      case 7:
        TeamDPrev7.text = [NSString stringWithFormat:@"%ld", (long)teamDScoreArray[teamDArrayIndex-8]];
        break;
      case 8:
        TeamDPrev8.text = [NSString stringWithFormat:@"%ld", (long)teamDScoreArray[teamDArrayIndex-9]];
        break;
    }
  }
}

@end
