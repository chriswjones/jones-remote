//
//  DvrVc_iPhone.h
//  JonesRemote
//
//  Created by Chris Jones on 07/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "IREnum.h"

@interface DvrVc_iPhone : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *part1;
@property (strong, nonatomic) IBOutlet UIView *part2;
@property (strong, nonatomic) IBOutlet UIView *part3;

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

- (void)bindIRDevice:(IRDevice)irDevice;

@end
