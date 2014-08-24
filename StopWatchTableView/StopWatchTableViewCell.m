//
//  StopWatchTableViewCell.m
//  StopWatchTableView
//
//  Created by Nathan Cope on 8/18/14.
//  Copyright (c) 2014 Nathan Cope. All rights reserved.
//

#import "StopWatchTableViewCell.h"

@implementation StopWatchTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    
    // iOS 7 fix - stop UISCrollView from delaying input
    
    for(UIView *subview in self.subviews){
        if([subview isKindOfClass:[UIScrollView class]]){
            UIScrollView *scrollView = (UIScrollView *)subview;
            [scrollView setDelaysContentTouches:NO];
            break;
        }
    }
    
}

- (void)setStopWatch:(StopWatch *)stopWatch{
    
    //default behavior of auto-set-get
    _stopWatch = stopWatch;
    
    //get current time
    NSTimeInterval duration = [_stopWatch duration];
    self.timeLabel.text = [_stopWatch formatTimeInterval:duration];
    
    //custom behavior
    if(_stopWatch.didStart){
        self.iconImage.image = [UIImage imageNamed:@"StopButton.png"];
        [self.startStopButton setTitle:@"Stop" forState:UIControlStateNormal];
    }else {
        self.iconImage.image = [UIImage imageNamed:@"StartButton.png"];
        [self.startStopButton setTitle:@"Start" forState:UIControlStateNormal];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)startStopButtonPressed:(id)sender {
    
    NSLog(@"%@.%@(): startStop pressed ", NSStringFromClass([self class]), NSStringFromSelector(_cmd)  );
    
    if(self.stopWatch.didStart){
        [self.stopWatch stopTimer];
        
        self.iconImage.image = [UIImage imageNamed:@"StartButton.png"];
        [self.startStopButton setTitle:@"Start" forState:UIControlStateNormal];
    } else {
        [self.stopWatch startTimer];
        
        self.iconImage.image = [UIImage imageNamed:@"StopButton.png"];
        [self.startStopButton setTitle:@"Stop" forState:UIControlStateNormal];
    }
   
    
}

- (IBAction)resetButtonPressed:(id)sender {
    
    NSLog(@"%@.%@(): reset pressed ", NSStringFromClass([self class]), NSStringFromSelector(_cmd)  );
    
    [self.stopWatch stopTimer];
    [self.stopWatch resetTimer];
    
    self.iconImage.image = [UIImage imageNamed:@"StartButton.png"];
    [self.startStopButton setTitle:@"Start" forState:UIControlStateNormal];
}


#pragma mark - StopWatchDelegate

- (void)timeUpdated:(StopWatch *)stopWatch{
  
    NSTimeInterval duration = stopWatch.duration;
    
    self.timeLabel.text = [stopWatch formatTimeInterval:duration];
    
}

@end
