#import "DvrVc_iPhone.h"
#import "CommandCenter.h"

@implementation DvrVc_iPhone {
    IRDevice _irDevice;
}
@synthesize scrollView;
@synthesize favoritesView;
@synthesize guideNavView;
@synthesize showControlView;
@synthesize numberPadView;

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat width = 568;
    CGFloat height = 261;

    self.scrollView.contentSize = CGSizeMake(width * 4, 261);
    [self.scrollView addSubview:self.favoritesView];

    self.guideNavView.frame = CGRectMake(width, 0, width, height);
    [self.scrollView addSubview:self.guideNavView];

    self.showControlView.frame = CGRectMake(width * 2, 0, width, height);
    [self.scrollView addSubview:self.showControlView];

    self.numberPadView.frame = CGRectMake(width * 3, 0, width, height);
    [self.scrollView addSubview:self.numberPadView];
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

- (IBAction)handlePageUp:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandPageUp toIRDevice:_irDevice];
}

- (IBAction)handlePageDown:(id)sender {
    [[CommandCenter singleton] sendIRCommand:IRCommandPageDown toIRDevice:_irDevice];
}

- (IBAction)handlePlusDay:(id)sender {
    // todo
}

#pragma mark - Favorites

- (IBAction)handleESPN:(id)sender {
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand7 toIRDevice:_irDevice];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand2 toIRDevice:_irDevice];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommand9 toIRDevice:_irDevice];
    [[CommandCenter singleton] sendQueableIRCommand:IRCommandSelect toIRDevice:_irDevice];
}

- (IBAction)handlePac12:(id)sender {
}

- (IBAction)handleFoxSportsWest:(id)sender {
}

@end
