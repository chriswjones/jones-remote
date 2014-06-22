//
//  BluRayVc_iPhone.m
//  JonesRemote
//
//  Created by Chris Jones on 03/02/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//


#import "BluRayVc_iPhone.h"
#import "CommandCenter.h"
#import "IREnum.h"


@implementation BluRayVc_iPhone

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 568;
    CGFloat height = 261;
    
    self.scrollView.contentSize = CGSizeMake(width * 2, 261);
    
    self.showControlView.frame = CGRectMake(0, 0, width, height);
    [self.scrollView addSubview:self.showControlView];
    
    self.navView.frame = CGRectMake(width, 0, width, height);
    [self.scrollView addSubview:self.navView];
}

#pragma mark - Actions

- (IBAction)handleUp:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandUp toIRDevice:IRDeviceBluRay];
}

- (IBAction)handleDown:(id)sender{
[[CommandCenter singleton] sendIRCommand:IRCommandDown toIRDevice:IRDeviceBluRay];
}

- (IBAction)handleLeft:(id)sender{
[[CommandCenter singleton] sendIRCommand:IRCommandLeft toIRDevice:IRDeviceBluRay];
}

- (IBAction)handleRight:(id)sender{
[[CommandCenter singleton] sendIRCommand:IRCommandRight toIRDevice:IRDeviceBluRay];
}

- (IBAction)handleSelect:(id)sender{
[[CommandCenter singleton] sendIRCommand:IRCommandSelect toIRDevice:IRDeviceBluRay];
}

- (IBAction)handleDiscreteOn:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandPowerOn toIRDevice:IRDeviceBluRay];
}

- (IBAction)handleDiscreteOff:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandPowerOff toIRDevice:IRDeviceBluRay];
}

- (IBAction)handleBack:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandBack toIRDevice:IRDeviceBluRay];
}

@end
