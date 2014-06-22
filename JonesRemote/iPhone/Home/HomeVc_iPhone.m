//
//  HomeVc_iPhone.m
//  JonesMediaCenter
//
//  Created by Chris Jones on 03/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeVc_iPhone.h"
#import "CommandCenter.h"
#import "AssignmentVc_iPhone.h"
#import "RemoteVc_iPhone.h"
#import "ScenesTvc_iPhone.h"


@implementation HomeVc_iPhone {
  UIView *_loadingView;
  UIActivityIndicatorView *_activityView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.navigationItem.title = @"Jones Remote";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Home"
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:nil
                                                                            action:nil];
  }

  return self;
}


#pragma mark - View lifecycle

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  [self hideLoadingView];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration {
  [super willRotateToInterfaceOrientation:toInterfaceOrientation
                                 duration:duration];
  if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
      toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
    RemoteVc_iPhone *remoteVc = [[RemoteVc_iPhone alloc] init];
    [remoteVc bindIRDevice:IRDeviceDVR];
    [self.navigationController pushViewController:remoteVc animated:NO];
  }
}

#pragma mark - Actions

- (IBAction)handleCenterTV:(id)sender {
  // DVR Channel
  [[CommandCenter singleton] sendQueableIRCommand:IRCommand7 toIRDevice:IRDeviceDVR];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommand1 toIRDevice:IRDeviceDVR];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommand1 toIRDevice:IRDeviceDVR];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommandSelect toIRDevice:IRDeviceDVR];

  [[CommandCenter singleton] setMatrixInput:InputDeviceDVR toOutput:OutputDeviceCenterTv];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceCenterTv];
  [[CommandCenter singleton] setMatrixInput:InputDeviceDVR toOutput:OutputDeviceAudioZone1];

  // Cleanup
  [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone2];
  [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone3];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceLeftTv];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceRightTv];

}

- (IBAction)handleAllTvs:(id)sender {
    ScenesTvc_iPhone *scenesTvc = [[ScenesTvc_iPhone alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:scenesTvc];
    [self presentViewController:nav
                       animated:YES
                     completion:nil];
}

- (void)handleAllTVs2222:(id)sender {
  
}


- (void)handleInputs:(id)sender {
  AssignmentVc_iPhone *assignmentVc = [[AssignmentVc_iPhone alloc] init];
  [self.navigationController pushViewController:assignmentVc animated:YES];
}

- (IBAction)handlePowerOn:(id)sender {
  [self showLoadingView];

  [[CommandCenter singleton] powerMatrixOn];

  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOnOff toIRDevice:IRDeviceDVR];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOnOff toIRDevice:IRDeviceCableA];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOnOff toIRDevice:IRDeviceCableB];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceBluRay];

  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:IRDeviceMarantz];

  [self performSelector:@selector(handleCenterTV:) withObject:nil afterDelay:25.0];
  [self performSelector:@selector(hideLoadingView) withObject:nil afterDelay:34.0];
}

- (IBAction)handlePowerOff:(id)sender {
  [self showLoadingView];

  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceMarantz];

  [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone1];
  [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone2];
  [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceAudioZone3];

  [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceCenterTv];
  [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceLeftTv];
  [[CommandCenter singleton] setMatrixInput:InputDeviceNone toOutput:OutputDeviceRightTv];

  [[CommandCenter singleton] powerMatrixOff];

  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceLeftTv];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceCenterTv];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceRightTv];

  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOnOff toIRDevice:IRDeviceDVR];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOnOff toIRDevice:IRDeviceCableA];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOnOff toIRDevice:IRDeviceCableB];
  [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:IRDeviceBluRay];

  [self performSelector:@selector(hideLoadingView) withObject:nil afterDelay:15.0];

}

#pragma mark - Helpers

- (void)showLoadingView {

  _loadingView = [[UIView alloc] initWithFrame:self.view.bounds];
  _loadingView.backgroundColor = [UIColor blackColor];
  _loadingView.alpha = 0.0;
  [self.view addSubview:_loadingView];

  _activityView = [[UIActivityIndicatorView alloc]
                                            initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
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

- (void)hideLoadingView {
  if (_loadingView && ![_loadingView isHidden]) {
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
      _loadingView.alpha = 0.0;
      _activityView.alpha = 0.0;
    }                completion:^(BOOL completed) {
      [_loadingView removeFromSuperview];
      _loadingView = nil;
      [_activityView removeFromSuperview];
      _activityView = nil;
    }];
  }
}

#pragma mark - Delegate methods


@end
