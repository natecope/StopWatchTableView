//
//  StopWatchTableViewCell.h
//  StopWatchTableView
//
//  Created by Nathan Cope on 8/18/14.
//  Copyright (c) 2014 Nathan Cope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StopWatch.h"

@interface StopWatchTableViewCell : UITableViewCell<StopWatchDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *startStopButton;
- (IBAction)startStopButtonPressed:(id)sender;
- (IBAction)resetButtonPressed:(id)sender;

@property (weak, nonatomic) StopWatch *stopWatch;
@end
