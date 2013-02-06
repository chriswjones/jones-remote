//
//  RemoteVc_iPhone.h
//  JonesRemote
//
//  Created by Chris Jones on 07/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import "IREnum.h"
#import <QuartzCore/QuartzCore.h>

@interface RemoteVc_iPhone : UIViewController
@property (weak, nonatomic) IBOutlet UIView *selectorContainer;
@property (weak, nonatomic) IBOutlet UIView *remoteContainer;
@property (weak, nonatomic) IBOutlet UILabel *irDeviceLabel;
- (IBAction)handleRight:(id)sender;
- (IBAction)handleLeft:(id)sender;

- (void)bindIRDevice:(IRDevice)irDevice;

@end
