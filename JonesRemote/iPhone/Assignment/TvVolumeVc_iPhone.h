#import <UIKit/UIKit.h>
#import "IREnum.h"


@interface TvVolumeVc_iPhone : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet UIButton *minusButton;
@property (weak, nonatomic) IBOutlet UIButton *muteButton;

- (id)initWithIrDevice:(IRDevice)irDevice;

- (IBAction)handlePlus:(id)sender;

- (IBAction)handleMinus:(id)sender;

- (IBAction)handleMute:(id)sender;

@end
