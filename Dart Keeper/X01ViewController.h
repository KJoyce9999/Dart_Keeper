//
//  ViewController.h
//  Dart Scoreboard (X01)
//
//  Created by Stephen Joyce on 1/17/17.
//  Copyright © 2017 Keenan Joyce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface X01ViewController : UIViewController
{
  
  IBOutlet UILabel *GameLengthLabel;
  IBOutlet UILabel *GL301Label;
  IBOutlet UILabel *GL501Label;
  IBOutlet UILabel *PlayerAmountLabel;
  IBOutlet UILabel *RoundScoreLabel;
  
  IBOutlet UISlider *PlayerAmountSlider;
  
  IBOutlet UITextField *TeamALabel;
  IBOutlet UITextField *TeamBLabel;
  IBOutlet UITextField *TeamCLabel;
  IBOutlet UITextField *TeamDLabel;
  
  IBOutlet UISwitch *gameLengthSwitch;
  
  IBOutlet UITextField *TeamACurrentScore;
  IBOutlet UITextField *TeamBCurrentScore;
  IBOutlet UITextField *TeamCCurrentScore;
  IBOutlet UITextField *TeamDCurrentScore;
  IBOutlet UITextField *RoundScore;

  IBOutlet UIButton *UndoButton;
  IBOutlet UIButton *SubmitButton;
  IBOutlet UIButton *NewGameButton;
  IBOutlet UIButton *HomeButton;
  IBOutlet UIButton *X01Label;
  
  IBOutlet UILabel *TeamAPrev1;
  IBOutlet UILabel *TeamAPrev2;
  IBOutlet UILabel *TeamAPrev3;
  IBOutlet UILabel *TeamAPrev4;
  IBOutlet UILabel *TeamAPrev5;
  IBOutlet UILabel *TeamAPrev6;
  IBOutlet UILabel *TeamAPrev7;
  IBOutlet UILabel *TeamAPrev8;
  
  IBOutlet UILabel *TeamBPrev1;
  IBOutlet UILabel *TeamBPrev2;
  IBOutlet UILabel *TeamBPrev3;
  IBOutlet UILabel *TeamBPrev4;
  IBOutlet UILabel *TeamBPrev5;
  IBOutlet UILabel *TeamBPrev6;
  IBOutlet UILabel *TeamBPrev7;
  IBOutlet UILabel *TeamBPrev8;
  
  IBOutlet UILabel *TeamCPrev1;
  IBOutlet UILabel *TeamCPrev2;
  IBOutlet UILabel *TeamCPrev3;
  IBOutlet UILabel *TeamCPrev4;
  IBOutlet UILabel *TeamCPrev5;
  IBOutlet UILabel *TeamCPrev6;
  IBOutlet UILabel *TeamCPrev7;
  IBOutlet UILabel *TeamCPrev8;
  
  IBOutlet UILabel *TeamDPrev1;
  IBOutlet UILabel *TeamDPrev2;
  IBOutlet UILabel *TeamDPrev3;
  IBOutlet UILabel *TeamDPrev4;
  IBOutlet UILabel *TeamDPrev5;
  IBOutlet UILabel *TeamDPrev6;
  IBOutlet UILabel *TeamDPrev7;
  IBOutlet UILabel *TeamDPrev8;
  
  
  IBOutlet NSLayoutConstraint *cellWidthHalf;
  IBOutlet NSLayoutConstraint *cellWidthThird;
  IBOutlet NSLayoutConstraint *cellWidthQuarter;
  
  IBOutlet NSLayoutConstraint *scoreBoxAdjustment;
  
  BOOL isTeamASelected;
  BOOL isTeamBSelected;
  BOOL isTeamCSelected;
  BOOL isTeamDSelected;

  
  UIColor *fadedBlue;
  UIColor *sameGray;
  
  NSString *teamA;
  NSString *teamB;
  NSString *teamC;
  NSString *teamD;
  int turnScore;
  NSInteger teamAScoreArray[128];
  NSInteger teamAArrayIndex;
  NSInteger teamBScoreArray[128];
  NSInteger teamBArrayIndex;
  NSInteger teamCScoreArray[128];
  NSInteger teamCArrayIndex;
  NSInteger teamDScoreArray[128];
  NSInteger teamDArrayIndex;
  BOOL gameLengthState;
  NSInteger playerAmount;
  int activeTeam;
  
  UITextField *activeText;
  UILabel *activeLabel;
  
}
@end

