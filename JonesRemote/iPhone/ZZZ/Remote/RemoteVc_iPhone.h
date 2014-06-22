#import "IREnum.h"
#import <QuartzCore/QuartzCore.h>


@interface RemoteVc_iPhone : UIViewController
@property(weak, nonatomic) IBOutlet UIView *selectorContainer;
@property(weak, nonatomic) IBOutlet UIView *remoteContainer;
@property(weak, nonatomic) IBOutlet UILabel *irDeviceLabel;

- (IBAction)handleRight:(id)sender;

- (IBAction)handleLeft:(id)sender;

- (void)bindIRDevice:(IRDevice)irDevice;

@end
