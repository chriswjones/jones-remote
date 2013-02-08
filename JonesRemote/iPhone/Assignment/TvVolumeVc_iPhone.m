#import "TvVolumeVc_iPhone.h"
#import "CommandCenter.h"
#import "Theme.h"


@implementation TvVolumeVc_iPhone {
    IRDevice _irDevice;
}

- (id)initWithIrDevice:(IRDevice)irDevice {
    self = [super init];
    if (self) {
        _irDevice = irDevice;
        self.navigationItem.title = stringForIRDevice(_irDevice);
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"DONE"
                                                                                  style:UIBarButtonItemStyleBordered
                                                                                 target:self
                                                                                 action:@selector(handleDone:)];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.plusButton.titleLabel.font = [Theme fontForSize:100.0];
    self.minusButton.titleLabel.font = [Theme fontForSize:100.0];
    self.muteButton.titleLabel.font = [Theme fontForSize:32.0];
}

#pragma mark - Actions

- (void)handleDone:(id)sender {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (IBAction)handlePlus:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandVolUp
                                  toIRDevice:_irDevice];
}

- (IBAction)handleMinus:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandVolDown
                                  toIRDevice:_irDevice];
}

- (IBAction)handleMute:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandMute
                                  toIRDevice:_irDevice];
}

@end
