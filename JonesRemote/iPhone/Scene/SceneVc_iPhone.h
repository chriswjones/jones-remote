
#import <UIKit/UIKit.h>

@interface SceneVc_iPhone : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *powerOn;
@property (weak, nonatomic) IBOutlet UIButton *powerOff;

- (IBAction)handleCenterTV:(id)sender;
- (IBAction)handleSportsBar:(id)sender;
- (IBAction)handleRecording:(id)sender;
- (IBAction)handleBluray:(id)sender;
- (IBAction)handleAppleTV:(id)sender;
- (IBAction)handleMacMini:(id)sender;
- (IBAction)handleInputs:(id)sender;
- (IBAction)handlePowerOn:(id)sender;
- (IBAction)handlePowerOff:(id)sender;


@end
