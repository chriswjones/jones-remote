
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

- (IBAction)handleMinusDay:(id)sender;

- (IBAction)handleLive:(id)sender;

- (IBAction)handleChannelDown:(id)sender;

- (IBAction)handleChannelUp:(id)sender;

// Favorites

- (IBAction)handleESPN:(id)sender;

- (IBAction)handleNFL:(id)sender;

- (IBAction)handlePac12:(id)sender;

- (IBAction)handleHboOD:(id)sender;

- (IBAction)handleHBO:(id)sender;

- (IBAction)handleCNN:(id)sender;

- (IBAction)handlePBS:(id)sender;

- (IBAction)handleFox:(id)sender;

- (IBAction)handleESPN2:(id)sender;

- (IBAction)handleRedZone:(id)sender;

- (IBAction)handleNbcSports:(id)sender;

- (IBAction)handleFoxBiz:(id)sender;

- (IBAction)handleCinemax:(id)sender;

- (IBAction)handleHLN:(id)sender;

- (IBAction)handleFX:(id)sender;

- (IBAction)handleNbc:(id)sender;

- (IBAction)handleESPNews:(id)sender;

- (IBAction)handleGolf:(id)sender;

- (IBAction)handleCbsSports:(id)sender;

- (IBAction)handleMSNBC:(id)sender;

- (IBAction)handleShowtime:(id)sender;

- (IBAction)handleBBC:(id)sender;

- (IBAction)handleTBS:(id)sender;

- (IBAction)handleCBS:(id)sender;

- (IBAction)handleEspnU:(id)sender;

- (IBAction)handleTennis:(id)sender;

- (IBAction)handleFoxSports:(id)sender;

- (IBAction)handleFCS:(id)sender;

- (IBAction)handleMoviesOD:(id)sender;

- (IBAction)handleWeather:(id)sender;

- (IBAction)handleTNT:(id)sender;

- (IBAction)handleABC:(id)sender;

// Bind

- (void)bindIRDevice:(IRDevice)irDevice;

@end
