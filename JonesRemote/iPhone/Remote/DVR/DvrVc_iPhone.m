//
//  DvrVc_iPhone.m
//  JonesRemote
//
//  Created by Chris Jones on 07/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import "DvrVc_iPhone.h"
#import "CommandCenter.h"

@implementation DvrVc_iPhone {
    IRDevice _irDevice;
}
@synthesize scrollView;
@synthesize part1;
@synthesize part2;
@synthesize part3;

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView.contentSize = CGSizeMake(1440, 261);
    [self.scrollView addSubview:self.part1];

    self.part2.frame = CGRectMake(481, 0, self.part2.frame.size.width, self.part2.frame.size.height);
    [self.scrollView addSubview:self.part2];
    
    self.part3.frame = CGRectMake(961, 0, self.part3.frame.size.width, self.part3.frame.size.height);
    [self.scrollView addSubview:self.part3];
}


- (void)viewDidUnload {
    [self setPart1:nil];
    [self setPart2:nil];
    [self setScrollView:nil];
    [self setPart3:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark - Bind

- (void)bindIRDevice:(IRDevice)irDevice {
    _irDevice = irDevice;
}

#pragma mark - Actions

- (IBAction)handlePlay:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandPlay toIRDevice:_irDevice];
}

- (IBAction)handleFastForward:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandFastForward toIRDevice:_irDevice];
}

- (IBAction)handleRewind:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandRewind toIRDevice:_irDevice];
}

- (IBAction)handlePause:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandPause toIRDevice:_irDevice];
}

- (IBAction)handleStop:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandStop toIRDevice:_irDevice];
}

- (IBAction)handleGuide:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandGuide toIRDevice:_irDevice];
}

- (IBAction)handleUp:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandUp toIRDevice:_irDevice];
}

- (IBAction)handleRecordings:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandRecordedShows toIRDevice:_irDevice];
}

- (IBAction)handleRight:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandRight toIRDevice:_irDevice];
}

- (IBAction)handleSelect:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandSelect toIRDevice:_irDevice];
}

- (IBAction)handleLeft:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandLeft toIRDevice:_irDevice];
}

- (IBAction)handleDown:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandDown toIRDevice:_irDevice];
}

- (IBAction)handleRecord:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandRecord toIRDevice:_irDevice];
}

- (IBAction)handleA:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandA toIRDevice:_irDevice];
}

- (IBAction)handle1:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommand1 toIRDevice:_irDevice];
}

- (IBAction)handle2:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommand2 toIRDevice:_irDevice];
}

- (IBAction)handle3:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommand3 toIRDevice:_irDevice];
}

- (IBAction)handle4:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommand4 toIRDevice:_irDevice];
}

- (IBAction)handle5:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommand5 toIRDevice:_irDevice];
}

- (IBAction)handle6:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommand6 toIRDevice:_irDevice];
}

- (IBAction)handle7:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommand7 toIRDevice:_irDevice];
}

- (IBAction)handle8:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommand8 toIRDevice:_irDevice];
}

- (IBAction)handle9:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommand9 toIRDevice:_irDevice];
}

- (IBAction)handle0:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommand0 toIRDevice:_irDevice];
}

- (IBAction)handleC:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandC toIRDevice:_irDevice];
}

#pragma mark - Helpers

#pragma mark - Delegate Methods

@end
