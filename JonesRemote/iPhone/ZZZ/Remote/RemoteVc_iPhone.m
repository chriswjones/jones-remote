#import "RemoteVc_iPhone.h"
#import "DvrVc_iPhone.h"
#import "Theme.h"
#import "BluRayVc_iPhone.h"


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

    _irDeviceLabel.font = [Theme fontForSize:22.0];

    [self bind];
}

- (void)viewDidUnload {
    [self setSelectorContainer:nil];
    [self setRemoteContainer:nil];
    [self setIrDeviceLabel:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];

    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleUp:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
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
        case IRDeviceTimeWarner:   {
            DvrVc_iPhone *dvrVc = [[DvrVc_iPhone alloc] init];
            [dvrVc bindIRDevice:_irDevice];
            _remoteVc = dvrVc;
            [self.remoteContainer addSubview:_remoteVc.view];
            break;
        }
        case IRDeviceDirecTV1:
        case IRDeviceDirecTV2: {
            // todo direct tv specific remote
            DvrVc_iPhone *dvrVc = [[DvrVc_iPhone alloc] init];
            [dvrVc bindIRDevice:_irDevice];
            _remoteVc = dvrVc;
            [self.remoteContainer addSubview:_remoteVc.view];
            break;
        }
        case IRDeviceBluRay: {
            _remoteVc = [[BluRayVc_iPhone alloc] init];
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
        case IRDeviceTimeWarner: {
          [self bindIRDevice:IRDeviceDirecTV1];
            break;
        }
        case IRDeviceDirecTV1: {
          [self bindIRDevice:IRDeviceDirecTV2];
            break;
        }
        case IRDeviceDirecTV2: {
            [self bindIRDevice:IRDeviceBluRay];
            break;
        }
        case IRDeviceBluRay:
        default:
            break;
    }
}

- (IBAction)handleLeft:(id)sender {
    switch (_irDevice) {
        case IRDeviceDirecTV1: {
          [self bindIRDevice:IRDeviceTimeWarner];
            break;
        }
        case IRDeviceDirecTV2: {
          [self bindIRDevice:IRDeviceDirecTV1];
            break;
        }
        case IRDeviceBluRay: {
          [self bindIRDevice:IRDeviceDirecTV2];
            break;
        }
        case IRDeviceTimeWarner:
        default:
            break;
    }
}

- (void)handleUp:(id)sender {
    NSLog(@"SWIPE UP!");
    // todo show marantz volume control
}

#pragma mark - Helpers

#pragma mark - Delegate Methods

@end
