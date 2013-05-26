//
//  BluRayVc_iPhone.h
//  JonesRemote
//
//  Created by Chris Jones on 03/02/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//



@interface BluRayVc_iPhone : UIViewController
@property(strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong, nonatomic) IBOutlet UIView *navView;
@property(strong, nonatomic) IBOutlet UIView *showControlView;


- (IBAction)handleUp:(id)sender;
- (IBAction)handleDown:(id)sender;
- (IBAction)handleLeft:(id)sender;
- (IBAction)handleRight:(id)sender;
- (IBAction)handleSelect:(id)sender;
- (IBAction)handleDiscreteOn:(id)sender;
- (IBAction)handleDiscreteOff:(id)sender;
- (IBAction)handleBack:(id)sender;

@end
