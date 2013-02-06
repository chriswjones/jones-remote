//
//  AssignmentTvc_iPhone.m
//  JonesRemote
//
//  Created by Chris Jones on 07/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AssignmentTvc_iPhone.h"

#import "MatrixEnum.h"
#import "AssignmentSelectorTvc_iPhone.h"
#import "RemoteVc_iPhone.h"

@implementation AssignmentTvc_iPhone {
    NSArray *_sectionArray;
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {

        self.navigationItem.title = @"Input Assignment";
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
        _sectionArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:OutputDeviceCenterTv],
                                                  [NSNumber numberWithInt:OutputDeviceLeftTv],
                                                  [NSNumber numberWithInt:OutputDeviceRightTv],
                                                  [NSNumber numberWithInt:OutputDeviceAudioZone1],
                                                  [NSNumber numberWithInt:OutputDeviceAudioZone2],
                                                  [NSNumber numberWithInt:OutputDeviceAudioZone3],
                                                  nil];
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.scrollEnabled = NO;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown) {
        return YES;
    } else {
        return NO;
    }
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];

    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        RemoteVc_iPhone *remoteVc = [[RemoteVc_iPhone alloc] init];
        [remoteVc bindIRDevice:IRDeviceDVR];
        [self.navigationController pushViewController:remoteVc animated:NO];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_sectionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    OutputDevice outputDevice = (OutputDevice) [[_sectionArray objectAtIndex:indexPath.section] intValue];
    cell.textLabel.text = stringForOutputDevice(outputDevice);

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OutputDevice outputDevice = (OutputDevice) [[_sectionArray objectAtIndex:indexPath.section] intValue];
    AssignmentSelectorTvc_iPhone *selectorTvc = [[AssignmentSelectorTvc_iPhone alloc] init];
    [selectorTvc bindOutputDevice:outputDevice];
    [self.navigationController pushViewController:selectorTvc animated:YES];
}

#pragma mark - Bind

#pragma mark - Actions

#pragma mark - Helpers

#pragma mark - Delegate Methods

@end
