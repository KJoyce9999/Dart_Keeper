//
//  CricketStoryboardViewController.h
//  Dart Scoreboard (X01)
//
//  Created by Keenan Joyce on 3/27/18.
//  Copyright © 2018 Keenan Joyce. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CricketViewController : UIViewController
{
  
  IBOutlet UIButton *TeamA20Marks;
  IBOutlet UIButton *TeamA19Marks;
  IBOutlet UIButton *TeamA18Marks;
  IBOutlet UIButton *TeamA17Marks;
  IBOutlet UIButton *TeamA16Marks;
  IBOutlet UIButton *TeamA15Marks;
  IBOutlet UIButton *TeamABullMarks;
  IBOutlet UIButton *TeamB20Marks;
  IBOutlet UIButton *TeamB19Marks;
  IBOutlet UIButton *TeamB18Marks;
  IBOutlet UIButton *TeamB17Marks;
  IBOutlet UIButton *TeamB16Marks;
  IBOutlet UIButton *TeamB15Marks;
  IBOutlet UIButton *TeamBBullMarks;
  
  IBOutlet UITextField *TeamA20Score;
  IBOutlet UITextField *TeamA19Score;
  IBOutlet UITextField *TeamA18Score;
  IBOutlet UITextField *TeamA17Score;
  IBOutlet UITextField *TeamA16Score;
  IBOutlet UITextField *TeamA15Score;
  IBOutlet UITextField *TeamABullScore;
  IBOutlet UITextField *TeamATotalScore;
  IBOutlet UITextField *TeamB20Score;
  IBOutlet UITextField *TeamB19Score;
  IBOutlet UITextField *TeamB18Score;
  IBOutlet UITextField *TeamB17Score;
  IBOutlet UITextField *TeamB16Score;
  IBOutlet UITextField *TeamB15Score;
  IBOutlet UITextField *TeamBBullScore;
  IBOutlet UITextField *TeamBTotalScore;
  
  IBOutlet UITextField *TeamALabel;
  IBOutlet UITextField *TeamBLabel;
  IBOutlet UILabel *UI20Label;
  IBOutlet UILabel *UI19Label;
  IBOutlet UILabel *UI18Label;
  IBOutlet UILabel *UI17Label;
  IBOutlet UILabel *UI16Label;
  IBOutlet UILabel *UI15Label;
  IBOutlet UILabel *UIBullLabel;
  IBOutlet UILabel *TotalScoreLabel;
  
  IBOutlet UIButton *UndoButton;
  IBOutlet UIButton *NewGameButton;
  IBOutlet UIButton *HomeButton;
  IBOutlet UIButton *CricketLabel;

  enum cricketPlaceholderNames
  {
    twentyPlace = 1,
    nineteenPlace = 2,
    eighteenPlace = 3,
    seventeenPlace = 4,
    sixteenPlace = 5,
    fifteenPlace = 6,
    bullseyePlace = 7,
    totalPlace = 8,
    scoreArraySize = 9
  };
  
  NSInteger teamAScoreArray[scoreArraySize];
  NSInteger teamBScoreArray[scoreArraySize];

  UIButton* activeText;
  UIButton* previousActiveText;
  int activeScore;
  long teamATotal;
  long teamBTotal;
  int mupltiplier;
  NSInteger turnDatabase[256];
  NSInteger turnDataIndex;
  
}
- (IBAction)teamA20Click;
- (IBAction)teamA19Click;
- (IBAction)teamA18Click;
- (IBAction)teamA17Click;
- (IBAction)teamA16Click;
- (IBAction)teamA15Click;
- (IBAction)teamABullClick;

- (IBAction)teamB20Click;
- (IBAction)teamB19Click;
- (IBAction)teamB18Click;
- (IBAction)teamB17Click;
- (IBAction)teamB16Click;
- (IBAction)teamB15Click;
- (IBAction)teamBBullClick;

- (IBAction)minusClick;
- (IBAction)plusClick;
@end
