#import "IREnum.h"

@interface DvrVc_iPhone : UIViewController

@property(strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong, nonatomic) IBOutlet UIView *favoritesView;
@property(strong, nonatomic) IBOutlet UIView *guideNavView;
@property(strong, nonatomic) IBOutlet UIView *showControlView;
@property(strong, nonatomic) IBOutlet UIView *numberPadView;

- (IBAction)handlePlay:(id)sender;

- (IBAction)handleFastForward:(id)sender;

- (IBAction)handleRewind:(id)sender;

- (IBAction)handlePause:(id)sender;

- (IBAction)handleStop:(id)sender;

- (IBAction)handleGuide:(id)sender;

- (IBAction)handleUp:(id)sender;

- (IBAction)handleRecordings:(id)sender;

- (IBAction)handleRight:(id)sender;

- (IBAction)handleSelect:(id)sender;

- (IBAction)handleLeft:(id)sender;

- (IBAction)handleDown:(id)sender;

- (IBAction)handleRecord:(id)sender;

- (IBAction)handleA:(id)sender;

- (IBAction)handle1:(id)sender;

- (IBAction)handle2:(id)sender;

- (IBAction)handle3:(id)sender;

- (IBAction)handle4:(id)sender;

- (IBAction)handle5:(id)sender;

- (IBAction)handle6:(id)sender;

- (IBAction)handle7:(id)sender;

- (IBAction)handle8:(id)sender;

- (IBAction)handle9:(id)sender;

- (IBAction)handle0:(id)sender;

- (IBAction)handleC:(id)sender;

- (IBAction)handlePageUp:(id)sender;

- (IBAction)handlePageDown:(id)sender;

- (IBAction)handlePlusDay:(id)sender;

// Favorites

- (IBAction)handleESPN:(id)sender;

- (IBAction)handlePac12:(id)sender;

- (IBAction)handleFoxSportsWest:(id)sender;

// Bind

- (void)bindIRDevice:(IRDevice)irDevice;

@end
