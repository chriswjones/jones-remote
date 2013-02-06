//
//  AssignmentSelectorTvc_iPhone.m
//  JonesRemote
//
//  Created by Chris Jones on 07/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AssignmentSelectorTvc_iPhone.h"
#import "CommandCenter.h"

@implementation AssignmentSelectorTvc_iPhone {
    OutputDevice _outputDevice;
    NSArray *_inputArray;
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        _inputArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:InputDeviceDVR],
                                                [NSNumber numberWithInt:InputDeviceCableA],
                                                [NSNumber numberWithInt:InputDeviceCableB],
                                                [NSNumber numberWithInt:InputDeviceBluRay],
                                                [NSNumber numberWithInt:InputDeviceMac],
                                                [NSNumber numberWithInt:InputDeviceAppleTv],
                                                [NSNumber numberWithInt:InputDeviceWii],
                                                [NSNumber numberWithInt:InputDeviceNone],
                                                nil];
    }
    return self;
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_inputArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    InputDevice inputDevice = (InputDevice)[[_inputArray objectAtIndex:indexPath.row] integerValue];
    cell.textLabel.text = stringForInputDevice(inputDevice);

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    InputDevice inputDevice = (InputDevice)[[_inputArray objectAtIndex:indexPath.row] integerValue];
    [[CommandCenter singleton] setMatrixInput:inputDevice toOutput:_outputDevice];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Bind

- (void)bindOutputDevice:(OutputDevice)outputDevice {
    _outputDevice = outputDevice;
    self.navigationItem.title = stringForOutputDevice(outputDevice);
}

#pragma mark - Actions

#pragma mark - Helpers

#pragma mark - Delegate Methods

@end
