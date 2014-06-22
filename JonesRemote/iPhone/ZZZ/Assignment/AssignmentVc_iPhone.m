#import "AssignmentVc_iPhone.h"
#import "MatrixEnum.h"
#import "IREnum.h"
#import "RemoteVc_iPhone.h"
#import "AssignmentRowControl.h"
#import "CommandCenter.h"
#import "Theme.h"
#import "TvVolumeVc_iPhone.h"


#define kHeaderRowHeight 50.0


@implementation AssignmentVc_iPhone {
    NSArray *_inputArray;
    UIScrollView *_scrollView;
    NSMutableArray *_rowControlsPage1;
    UIView *_headerView;
    UIView *_headerDivider;
    NSArray *_imageArray;
    NSMutableArray *_headerImageViews;
    NSMutableArray *_headerButtons;
    NSMutableArray *_rowControlsPage2;
    UIView *_verticalDivider;

    UIButton *_volUp;
    UIButton *_volDown;
    UIButton *_muteOn;
    UIButton *_muteOff;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"INPUT ASSIGNMENT";
        _inputArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:InputDeviceDVR],
                                                [NSNumber numberWithInt:InputDeviceCableA],
                                                [NSNumber numberWithInt:InputDeviceCableB],
                                                [NSNumber numberWithInt:InputDeviceBluRay],
                                                [NSNumber numberWithInt:InputDeviceAppleTv],
                                                [NSNumber numberWithInt:InputDeviceMac],
                                                nil];

        _imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"tv_left"],
                                                [UIImage imageNamed:@"tv_center"],
                                                [UIImage imageNamed:@"tv_right"],
                                                [UIImage imageNamed:@"speaker"],
                                                [UIImage imageNamed:@"headphones"],
                                                nil];
    }

    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // ScrollView
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _scrollView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];

    // Header
    _headerView = [[UIView alloc] init];

    _headerImageViews = [NSMutableArray array];
    _headerButtons = [NSMutableArray array];
    for (UIImage *image in _imageArray) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeCenter;
        [_headerView addSubview:imageView];
        [_headerImageViews addObject:imageView];

        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(handleTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:button];
        [_headerButtons addObject:button];
    }

    [_scrollView addSubview:_headerView];

    // Divider
    _headerDivider = [[UIView alloc] init];
    _headerDivider.backgroundColor = [UIColor darkGrayColor];
    [_scrollView addSubview:_headerDivider];

    // Page 1 Rows
    _rowControlsPage1 = [NSMutableArray array];
    for (NSNumber *input in _inputArray) {
        InputDevice inputDevice = (InputDevice) [input integerValue];
        NSArray *outputArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:OutputDeviceLeftTv],
                                                         [NSNumber numberWithInt:OutputDeviceCenterTv],
                                                         [NSNumber numberWithInt:OutputDeviceRightTv],
                                                         nil];
        AssignmentRowControl *rowControl = [[AssignmentRowControl alloc] initWithInputDevice:inputDevice outputArray:outputArray];
        [_scrollView addSubview:rowControl];
        [_rowControlsPage1 addObject:rowControl];
    }

    // Page 2 Rows
    _rowControlsPage2 = [NSMutableArray array];
    for (NSNumber *input in _inputArray) {
        InputDevice inputDevice = (InputDevice) [input integerValue];
        NSArray *outputArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:OutputDeviceAudioZone1],
                                                         [NSNumber numberWithInt:OutputDeviceAudioZone2],
                                                         nil];
        AssignmentRowControl *rowControl = [[AssignmentRowControl alloc] initWithInputDevice:inputDevice outputArray:outputArray];
        [_scrollView addSubview:rowControl];
        [_rowControlsPage2 addObject:rowControl];
    }

    // Vertical Divider
    _verticalDivider = [[UIView alloc] init];
    _verticalDivider.backgroundColor = [Theme grayColor];
    [_scrollView addSubview:_verticalDivider];

    // Volume Buttons
    _volUp = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_volUp setTitle:@"+" forState:UIControlStateNormal];
    [_volUp addTarget:self action:@selector(handleVolUp:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_volUp];

    _volDown = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_volDown setTitle:@"-" forState:UIControlStateNormal];
    [_volDown addTarget:self action:@selector(handleVolDown:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_volDown];

    _muteOn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_muteOn setTitle:@"Mute On" forState:UIControlStateNormal];
    [_muteOn addTarget:self action:@selector(handleMuteOn:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_muteOn];

    _muteOff = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_muteOff setTitle:@"Mute Off" forState:UIControlStateNormal];
    [_muteOff addTarget:self action:@selector(handleMuteOff:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_muteOff];

}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    // Scroll view content size
    _scrollView.contentSize = CGSizeMake(640, _scrollView.bounds.size.height);

    // Header
    _headerView.frame = CGRectMake(0, 0, 640, kHeaderRowHeight);
    CGFloat rowWidth = 640.0 / 6;
    for (int i = 0; i < [_headerImageViews count]; i++) {
        UIImageView *imageView = [_headerImageViews objectAtIndex:i];
        imageView.frame = CGRectMake(i * rowWidth, 0, rowWidth, kHeaderRowHeight);

        UIButton *button = [_headerButtons objectAtIndex:i];
        button.frame = CGRectMake(i * rowWidth, 0, rowWidth, kHeaderRowHeight);
    }

    // Divider
    _headerDivider.frame = CGRectMake(0, kHeaderRowHeight, 640 - (320 / 3), 1.0);

    // Page 1 Rows
    CGFloat rowHeight = (_scrollView.bounds.size.height - 1.0 - kHeaderRowHeight) / [_rowControlsPage1 count];
    CGFloat yCoordinate = kHeaderRowHeight + 1.0;
    for (AssignmentRowControl *rowControl in _rowControlsPage1) {
        rowControl.frame = CGRectMake(0, yCoordinate, 320, rowHeight);
        yCoordinate += rowControl.bounds.size.height;
    }

    // Page 2 Rows
    yCoordinate = kHeaderRowHeight + 1.0;
    for (AssignmentRowControl *rowControl in _rowControlsPage2) {
        rowControl.frame = CGRectMake(320, yCoordinate, 320, rowHeight);
        yCoordinate += rowControl.bounds.size.height;
    }

    // Vertical Divider
    _verticalDivider.frame = CGRectMake(319.0, 0, 1.0, _scrollView.bounds.size.height);

    // Volume buttons
    CGFloat volY = kHeaderRowHeight;
    CGFloat volX = 10 + 320 + (320 / 3) * 2;
    CGFloat volWidth = 320 / 3 - 10;
    _volUp.frame = CGRectMake(volX, volY, volWidth, rowHeight*2);
    volY += rowHeight*2;
    _volDown.frame = CGRectMake(volX, volY, volWidth, rowHeight*2);
    volY += (rowHeight*2);
    _muteOn.frame = CGRectMake(volX, volY, volWidth, rowHeight);
    volY += rowHeight;
    _muteOff.frame = CGRectMake(volX, volY, volWidth, rowHeight);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];

    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        RemoteVc_iPhone *remoteVc = [[RemoteVc_iPhone alloc] init];
      [remoteVc bindIRDevice:IRDeviceTimeWarner];
        [self.navigationController pushViewController:remoteVc animated:NO];
    }
}

#pragma mark - Bind

#pragma mark - Actions

- (void)handleTouchUp:(UIButton *)sender {
    int index = [_headerButtons indexOfObject:sender];

    if (index >= 3) {
        // Audio Zone Off
        switch (index) {
            case 3: {
                [[CommandCenter singleton] setMatrixInput:InputDeviceNone
                                                 toOutput:OutputDeviceAudioZone1];
                break;
            }
            case 4: {
                [[CommandCenter singleton] setMatrixInput:InputDeviceNone
                                                 toOutput:OutputDeviceAudioZone2];
                break;
            }
            case 5: {
                [[CommandCenter singleton] setMatrixInput:InputDeviceNone
                                                 toOutput:OutputDeviceAudioZone3];
                break;
            }
            default:
                break;
        }
    } else {
        // TV on/off or volume
        IRDevice device = IRDeviceNone;
        switch (index) {
            case 0: {
                device = IRDeviceLeftTv;
                break;
            }
            case 1: {
                device = IRDeviceCenterTv;
                break;
            }
            case 2: {
                device = IRDeviceRightTv;
                break;
            }
            default:
                break;
        }

        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:stringForIRDevice(device)
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                   destructiveButtonTitle:nil otherButtonTitles:@"On", @"Off", @"Volume", nil];
        actionSheet.tag = device;
        [actionSheet showInView:self.view];
    }
}

- (void)handleVolUp:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandVolUp toIRDevice:IRDeviceMarantz];
}

- (void)handleVolDown:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandVolDown toIRDevice:IRDeviceMarantz];
}

- (void)handleMuteOn:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandMuteOn toIRDevice:IRDeviceMarantz];
}

- (void)handleMuteOff:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandMuteOff toIRDevice:IRDeviceMarantz];
}

#pragma mark - Helpers

#pragma mark - Delegate Methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        return;
    }

    IRDevice device = (IRDevice) actionSheet.tag;
    switch (buttonIndex) {
        case 0: {
            // On
            [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOn toIRDevice:device];
            break;
        }
        case 1: {
            // Off
            [[CommandCenter singleton] sendQueableIRCommand:IRCommandPowerOff toIRDevice:device];
            break;
        }
        case 2: {
            // Volume
            [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[[TvVolumeVc_iPhone alloc] initWithIrDevice:device]]
                               animated:YES
                             completion:nil];
            break;
        }
        default:
            break;
    }
}

@end
