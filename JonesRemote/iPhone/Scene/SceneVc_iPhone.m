//
//  SceneVc_iPhone.m
//  JonesMediaCenter
//
//  Created by Chris Jones on 03/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SceneVc_iPhone.h"
#import "CommandCenter.h"
#import "AssignmentVc_iPhone.h"
#import "RemoteVc_iPhone.h"


@implementation SceneVc_iPhone {
    UIView *_loadingView;
    UIActivityIndicatorView *_activityView;
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" BACK"
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:nil
                                                                            action:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self hideLoadingView:NO];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];

    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        RemoteVc_iPhone *remoteVc = [[RemoteVc_iPhone alloc] init];
        [remoteVc bindIRDevice:IRDeviceDVR];
        [self.navigationController pushViewController:remoteVc animated:NO];
    }
}

#pragma mark - Bind

#pragma mark - Actions

- (IBAction)handleCenterTV:(id)sender {
    [[CommandCenter singleton] setMatrixInput:InputDeviceDVR toOutput:OutputDeviceCenterTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceCenterTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceDVR toOutput:OutputDeviceAudioZone1];
    
    // Cleanup
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone2];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone3];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceLeftTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceRightTv];

}

- (IBAction)handleSportsBar:(id)sender {  
    [[CommandCenter singleton] setMatrixInput:InputDeviceCableA toOutput:OutputDeviceLeftTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceDVR toOutput:OutputDeviceCenterTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceCableB toOutput:OutputDeviceRightTv];

    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceLeftTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceCenterTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceRightTv];

    [[CommandCenter singleton] setMatrixInput:InputDeviceDVR toOutput:OutputDeviceAudioZone1];
    
    // DVR Channel
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand7 toIRDevice:IRDeviceDVR];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand2 toIRDevice:IRDeviceDVR];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand9 toIRDevice:IRDeviceDVR];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandSelect toIRDevice:IRDeviceDVR];

    // Cable A Channel
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand3 toIRDevice:IRDeviceCableA];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand5 toIRDevice:IRDeviceCableA];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand5 toIRDevice:IRDeviceCableA];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandSelect toIRDevice:IRDeviceCableA];

    
    // Cable B Channel
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand8 toIRDevice:IRDeviceCableB];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand1 toIRDevice:IRDeviceCableB];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand9 toIRDevice:IRDeviceCableB];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandSelect toIRDevice:IRDeviceCableB];
    
    // Cleanup
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone2];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone3];
}

- (IBAction)handleRecording:(id)sender {
    
    // DVR Channel
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand1 toIRDevice:IRDeviceDVR];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand0 toIRDevice:IRDeviceDVR];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand0 toIRDevice:IRDeviceDVR];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand0 toIRDevice:IRDeviceDVR];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandSelect toIRDevice:IRDeviceDVR];
    
    // Recorded Shows
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandRecordedShows toIRDevice:IRDeviceDVR];
    
    // Matrix assignment
    [[CommandCenter singleton] setMatrixInput:InputDeviceDVR toOutput:OutputDeviceCenterTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceDVR toOutput:OutputDeviceAudioZone1];
    
    // Power TV On
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceCenterTv];
    
    // Cleanup
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone2];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone3];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceLeftTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceRightTv];    
}

- (IBAction)handleBluray:(id)sender {
    
    [[CommandCenter singleton] setMatrixInput:InputDeviceBluRay toOutput:OutputDeviceCenterTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceCenterTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceBluRay toOutput:OutputDeviceAudioZone1];

    // Cleanup
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone2];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone3];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceLeftTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceRightTv];
}

- (IBAction)handleAppleTV:(id)sender {
    [[CommandCenter singleton] setMatrixInput:InputDeviceAppleTv toOutput:OutputDeviceCenterTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceCenterTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceAppleTv toOutput:OutputDeviceAudioZone1];
    
    // Cleanup
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone2];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone3];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceLeftTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceRightTv];
    
    // Wait for assignments to finish then launch remote
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(handleTimer:) userInfo:nil repeats:NO];
}

- (void)handleTimer:(NSTimer *)timer {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"remote://"]];
}

- (IBAction)handleMacMini:(id)sender {
    [[CommandCenter singleton] setMatrixInput:InputDeviceMac toOutput:OutputDeviceCenterTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceCenterTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceMac toOutput:OutputDeviceAudioZone1];
    
    // Cleanup
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone2];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone3];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceLeftTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceRightTv];
}

- (IBAction)handleAllOff:(id)sender {
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceLeftTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceCenterTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceRightTv];

    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone1];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone2];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone3];

    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceLeftTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceCenterTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceRightTv];
}

- (IBAction)handleInputs:(id)sender {
    AssignmentVc_iPhone *assignmentVc = [[AssignmentVc_iPhone alloc] init];
    [self.navigationController pushViewController:assignmentVc animated:YES];
}

#pragma mark - Helpers

- (void)showLoadingView {
    _loadingView = [[UIView alloc] initWithFrame:self.view.bounds];
    _loadingView.backgroundColor = [UIColor blackColor];
    _loadingView.alpha = 0.0;
    [self.view addSubview:_loadingView];

    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect fr = _activityView.frame;
    fr.origin.x = self.view.bounds.size.width / 2 - fr.size.width / 2;
    fr.origin.y = self.view.bounds.size.height / 2 - fr.size.height / 2;
    _activityView.frame = fr;
    _activityView.alpha = 0.0;
    [self.view addSubview:_activityView];
    [_activityView startAnimating];

    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         _loadingView.alpha = 0.85;
                         _activityView.alpha = 1.0;
                     }
                     completion:nil];

}

- (void)hideLoadingView:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            _loadingView.alpha = 0.0;
            _activityView.alpha = 0.0;
        }                completion:^(BOOL completed) {
            [_loadingView removeFromSuperview];
            [_activityView removeFromSuperview];
        }];
    } else {
        [_loadingView removeFromSuperview];
        [_activityView removeFromSuperview];
    }
}

#pragma mark - Delegate methods

@end
