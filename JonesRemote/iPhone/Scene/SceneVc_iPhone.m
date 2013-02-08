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

- (IBAction)handleWatchTv:(id)sender {
    /*[self showLoadingView];
    [self matrixOn];

    CommandCenter *commandCenter = [CommandCenter singleton];

    [commandCenter sendCommand:[Command commandForDevice:kLeftTv command:kPowerOff queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kRightTv command:kPowerOff queueable:YES]];

    MatrixCommand *matrixCommand = [MatrixCommand matrixCommandAssignInput:kDVR toOutput:kCenterTv];
    [commandCenter sendCommand:matrixCommand];

    MatrixCommand *matrixCommand2 = [MatrixCommand matrixCommandAssignInput:kDVR toOutput:kAudioZone1];
    [commandCenter sendCommand:matrixCommand2];

    [commandCenter sendCommand:[Command commandForDevice:kDVR command:k7 queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kDVR command:k2 queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kDVR command:k9 queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kDVR command:kSelect queueable:YES]];

    Command *tvOn = [Command commandForDevice:kCenterTv command:kPowerOn queueable:YES];
    tvOn.delegate = self;
    tvOn.tag = kWatchTv;
    [commandCenter sendCommand:tvOn];*/
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
    /*[self showLoadingView];
    [self matrixOn];

    CommandCenter *commandCenter = [CommandCenter singleton];

    MatrixCommand *matrixCommand1 = [MatrixCommand matrixCommandAssignInput:kCableA toOutput:kLeftTv];
    [commandCenter sendCommand:matrixCommand1];

    MatrixCommand *matrixCommand2 = [MatrixCommand matrixCommandAssignInput:kDVR toOutput:kCenterTv];
    [commandCenter sendCommand:matrixCommand2];

    MatrixCommand *matrixCommand2b = [MatrixCommand matrixCommandAssignInput:kDVR toOutput:kAudioZone1];
    [commandCenter sendCommand:matrixCommand2b];

    MatrixCommand *matrixCommand3 = [MatrixCommand matrixCommandAssignInput:kCableB toOutput:kRightTv];
    [commandCenter sendCommand:matrixCommand3];

    // ESPN2
    [commandCenter sendCommand:[Command commandForDevice:kCableA command:k7 queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kCableA command:k3 queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kCableA command:k0 queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kCableA command:kSelect queueable:YES]];

    // ESPNNEWS
    [commandCenter sendCommand:[Command commandForDevice:kCableB command:k7 queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kCableB command:k3 queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kCableB command:k1 queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kCableB command:kSelect queueable:YES]];

    // ESPN
    [commandCenter sendCommand:[Command commandForDevice:kDVR command:k7 queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kDVR command:k2 queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kDVR command:k9 queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kDVR command:kSelect queueable:YES]];

    // TV POWER
    [commandCenter sendCommand:[Command commandForDevice:kLeftTv command:kPowerOn queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kRightTv command:kPowerOn queueable:YES]];

    Command *cmd = [Command commandForDevice:kCenterTv command:kPowerOn queueable:YES];
    cmd.delegate = self;
    cmd.tag = kSportsBar;
    [commandCenter sendCommand:cmd];*/    
    
    [[CommandCenter singleton] setMatrixInput:InputDeviceCableA toOutput:OutputDeviceLeftTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceDVR toOutput:OutputDeviceCenterTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceCableB toOutput:OutputDeviceRightTv];

    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceLeftTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceCenterTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceRightTv];

    [[CommandCenter singleton] setMatrixInput:InputDeviceDVR toOutput:OutputDeviceAudioZone1];
    
    // ESPN
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand7 toIRDevice:IRDeviceDVR];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand2 toIRDevice:IRDeviceDVR];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand9 toIRDevice:IRDeviceDVR];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandSelect toIRDevice:IRDeviceDVR];

    // todo ESPN2 and ESPNNEWS
    
    // Cleanup

    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone2];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone3];
}

- (IBAction)handleBluray:(id)sender {
    /*[self showLoadingView];
    [self matrixOn];

    CommandCenter *commandCenter = [CommandCenter singleton];

    [commandCenter sendCommand:[Command commandForDevice:kLeftTv command:kPowerOff queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kRightTv command:kPowerOff queueable:YES]];

    MatrixCommand *matrixCommand = [MatrixCommand matrixCommandAssignInput:kBluRay toOutput:kCenterTv];
    [commandCenter sendCommand:matrixCommand];

    MatrixCommand *matrixCommand2 = [MatrixCommand matrixCommandAssignInput:kBluRay toOutput:kAudioZone1];
    [commandCenter sendCommand:matrixCommand2];

    Command *cmd = [Command commandForDevice:kCenterTv command:kPowerOn queueable:YES];
    cmd.delegate = self;
    cmd.tag = kBluray;
    [commandCenter sendCommand:cmd];*/
    [[CommandCenter singleton] setMatrixInput:InputDeviceBluRay toOutput:OutputDeviceCenterTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceCenterTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceBluRay toOutput:OutputDeviceAudioZone1];

    // Cleanup
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone2];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone3];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceLeftTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceRightTv];
}

- (IBAction)handleComputer:(id)sender {
    /*[self showLoadingView];
    [self matrixOn];

    CommandCenter *commandCenter = [CommandCenter singleton];

    [commandCenter sendCommand:[Command commandForDevice:kLeftTv command:kPowerOff queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kRightTv command:kPowerOff queueable:YES]];

    MatrixCommand *matrixCommand = [MatrixCommand matrixCommandAssignInput:kMac toOutput:kCenterTv];
    [commandCenter sendCommand:matrixCommand];

    MatrixCommand *matrixCommand2 = [MatrixCommand matrixCommandAssignInput:kMac toOutput:kAudioZone1];
    [commandCenter sendCommand:matrixCommand2];

    Command *cmd = [Command commandForDevice:kCenterTv command:kPowerOn queueable:YES];
    cmd.delegate = self;
    cmd.tag = kComputer;
    [commandCenter sendCommand:cmd];*/

    [[CommandCenter singleton] setMatrixInput:InputDeviceMac toOutput:OutputDeviceCenterTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceCenterTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceMac toOutput:OutputDeviceAudioZone1];

    // Cleanup
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone2];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone3];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceLeftTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceRightTv];

    // todo wait then launch remote
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"remote://"]];
}

- (IBAction)handleWii:(id)sender {
    /*[self showLoadingView];
    [self matrixOn];

    CommandCenter *commandCenter = [CommandCenter singleton];

    [commandCenter sendCommand:[Command commandForDevice:kLeftTv command:kPowerOff queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kRightTv command:kPowerOff queueable:YES]];

    MatrixCommand *matrixCommand = [MatrixCommand matrixCommandAssignInput:kWii toOutput:kCenterTv];
    [commandCenter sendCommand:matrixCommand];

    MatrixCommand *matrixCommand2 = [MatrixCommand matrixCommandAssignInput:kWii toOutput:kAudioZone1];
    [commandCenter sendCommand:matrixCommand2];

    Command *cmd = [Command commandForDevice:kCenterTv command:kPowerOn queueable:YES];
    cmd.delegate = self;
    cmd.tag = kPlayWii;
    [commandCenter sendCommand:cmd];*/
    [[CommandCenter singleton] setMatrixInput:InputDeviceWii toOutput:OutputDeviceCenterTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceCenterTv];
    [[CommandCenter singleton] setMatrixInput:InputDeviceWii toOutput:OutputDeviceAudioZone1];

    // Cleanup
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone2];
    [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone3];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceLeftTv];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceRightTv];
}

- (IBAction)handleAllOff:(id)sender {
    /*[self showLoadingView];

    CommandCenter *commandCenter = [CommandCenter singleton];

    [commandCenter sendCommand:[Command commandForDevice:kLeftTv command:kPowerOff queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kRightTv command:kPowerOff queueable:YES]];
    [commandCenter sendCommand:[Command commandForDevice:kCenterTv command:kPowerOff queueable:YES]];

    MatrixCommand *matrixCommand = [[MatrixCommand alloc] init];
    matrixCommand.command = kPowerOff;
    matrixCommand.delegate = self;
    matrixCommand.tag = kAllOff;
    [commandCenter sendCommand:matrixCommand];*/

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

- (IBAction)handleRemote:(id)sender {
    //AssignmentTvc_iPhone *assignmentTvc = [[AssignmentTvc_iPhone alloc] init];
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
