//
//  ViewController.m
//  StopWatchTableView
//
//  Created by Nathan Cope on 8/18/14.
//  Copyright (c) 2014 Nathan Cope. All rights reserved.
//

#import "ViewController.h"
#import "StopWatchTableViewCell.h"
#import "StopWatch.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) StopWatchTableViewCell *stopWatchCell;

@end

@implementation ViewController{
    NSMutableArray *_stopWatchArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _stopWatchArray = [@[] mutableCopy];
    
    StopWatch *stopWatch = [[StopWatch alloc]init];
    
    [_stopWatchArray addObject:stopWatch];
    
    // UINib servers as an object wrapper for nib (or xib) files. It's used
    // for caching of nib files for performance
    UINib *stopWatchNib = [UINib nibWithNibName:@"StopWatchTableViewCell" bundle:nil];
    
    // Registers a nib object with an identifier
    [self.tableView registerNib:stopWatchNib forCellReuseIdentifier:@"StopWatchTableViewCell"];
    
    // Instantiates nib, and assigns it to self.stopwatchcell
    self.stopWatchCell = [[stopWatchNib instantiateWithOwner:nil options:nil] firstObject];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [_stopWatchArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    // dequeue means re-using cells that are no longer needed (cells
    // that have fallen off the screen)
    StopWatchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StopWatchTableViewCell"];
    
    StopWatch *stopWatch = _stopWatchArray[indexPath.row];
    
    cell.stopWatch = stopWatch;
    stopWatch.delegate = cell;
    
    // Wrapping an object using the @ symbol allows you to
    // perform methods on it for conversion, such as integerValue or stringValue
    // cell.textLabel.text = [@(indexPath.row + 1) stringValue];
    
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    StopWatch *stopWatch = _stopWatchArray[indexPath.row];
    stopWatch.delegate = nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //configure cell for current row index
    
    //force layout. tells app to layout cells before display
    [self.stopWatchCell layoutIfNeeded];
    
    //returns size of view that satisfies constraints that it holds, using
    //the smallest possible size
    CGSize size = [self.stopWatchCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    //The seperatpr could be calculated, but we'll hardcode it for now.
    CGFloat seperatorHeight = 1;
    
    return size.height + seperatorHeight;
}
- (IBAction)addButtonPressed:(id)sender {
    
    StopWatch *stopWatch = [[StopWatch alloc]init];
    
    [_stopWatchArray addObject:stopWatch];
    
    [self.tableView reloadData];
}

@end
