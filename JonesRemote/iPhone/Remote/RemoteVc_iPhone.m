//
//  RemoteVc_iPhone.m
//  JonesRemote
//
//  Created by Chris Jones on 07/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RemoteVc_iPhone.h"
#import "DvrVc_iPhone.h"

@implementation RemoteVc_iPhone {
    IRDevice _irDevice;
    UIViewController *_remoteVc;
}
@synthesize selectorContainer = _selectorContainer;
@synthesize remoteContainer = _remoteContainer;
@synthesize irDeviceLabel = _irDeviceLabel;

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    _selectorContainer.layer.shadowColor = [[UIColor blackColor] CGColor];
    _selectorContainer.layer.shadowOffset = CGSizeMake(0, -3.0);
    _selectorContainer.layer.shadowOpacity = 0.75;
    [self bind];
}

- (void)viewDidUnload {
    [self setSelectorContainer:nil];
    [self setRemoteContainer:nil];
    [self setIrDeviceLabel:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown) {
        return YES;
    } else {
        return NO;
    }
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];

    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        [self.navigationController popViewControllerAnimated:NO];
    }
}

#pragma mark - Bind

- (void)bindIRDevice:(IRDevice)irDevice {
    _irDevice = irDevice;
    if ([self isViewLoaded]) {
        [self bind];
    }
}

- (void)bind {

    // Remove Previous Remote
    if (_remoteVc) {
        [_remoteVc.view removeFromSuperview];
        _remoteVc = nil;
    }

    // Set label text

    _irDeviceLabel.text = stringForIRDevice(_irDevice);

    // Set remote view

    switch (_irDevice) {
        case IRDeviceDVR:
        case IRDeviceCableA:
        case IRDeviceCableB: {
            DvrVc_iPhone *dvrVc = [[DvrVc_iPhone alloc] init];
            [dvrVc bindIRDevice:_irDevice];
            _remoteVc = dvrVc;
            [self.remoteContainer addSubview:_remoteVc.view];
            break;
        }
        default:
            break;
    }

}

#pragma mark - Actions

- (IBAction)handleRight:(id)sender {
    switch (_irDevice) {
        case IRDeviceDVR: {
            [self bindIRDevice:IRDeviceCableA];
            break;
        }
        case IRDeviceCableA: {
            [self bindIRDevice:IRDeviceCableB];
            break;
        }
        case IRDeviceCableB:
            break;

        default:
            break;
    }
}

- (IBAction)handleLeft:(id)sender {
    switch (_irDevice) {
        case IRDeviceDVR: {
            //[self bindIRDevice:IRDeviceWii];
            break;
        }
        case IRDeviceCableA: {
            [self bindIRDevice:IRDeviceDVR];
            break;
        }
        case IRDeviceCableB: {
            [self bindIRDevice:IRDeviceCableA];
            break;
        }
        default:
            break;
    }
}

#pragma mark - Helpers

#pragma mark - Delegate Methods

@end
