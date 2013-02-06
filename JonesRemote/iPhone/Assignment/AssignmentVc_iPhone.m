//
//  AssignmentVc_iPhone.m
//  JonesRemote
//
//  Created by Chris Jones on 10/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AssignmentVc_iPhone.h"
#import "MatrixEnum.h"
#import "AssignmentButton.h"
#import "IREnum.h"
#import "RemoteVc_iPhone.h"
#import "CommandCenter.h"

#define inputWidth 100
#define headerRowHeight 30
#define scrollViewWidth 600

@implementation AssignmentVc_iPhone {
    NSArray *_inputArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"Input Assignment";
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


#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat yCoordinate = 0;
    CGFloat imageWidth = (scrollViewWidth - inputWidth) / 2;
    CGFloat headerInputWidth = imageWidth / 3;
    CGFloat rowHeight = headerInputWidth;
    CGFloat totalHeight = ([_inputArray count] * rowHeight) + (headerRowHeight * 2);

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(scrollViewWidth + 20, totalHeight + (headerRowHeight * 2));
    scrollView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    [self.view addSubview:scrollView];


    // Vertical Dividers

    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(inputWidth, headerRowHeight, 1.0, totalHeight - headerRowHeight)];
    v1.backgroundColor = [UIColor blackColor];
    [scrollView addSubview:v1];

    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(inputWidth + imageWidth, headerRowHeight, 1.0, totalHeight - headerRowHeight)];
    v2.backgroundColor = [UIColor blackColor];
    [scrollView addSubview:v2];

    UIView *vLast = [[UIView alloc] initWithFrame:CGRectMake(inputWidth + (imageWidth * 2), headerRowHeight, 1.0, totalHeight - headerRowHeight)];
    vLast.backgroundColor = [UIColor blackColor];
    [scrollView addSubview:vLast];

    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(inputWidth + headerInputWidth, headerRowHeight, 1.0, totalHeight - headerRowHeight)];
    v3.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:v3];

    UIView *v4 = [[UIView alloc] initWithFrame:CGRectMake(inputWidth + (headerInputWidth * 2), headerRowHeight, 1.0, totalHeight - headerRowHeight)];
    v4.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:v4];

    UIView *v5 = [[UIView alloc] initWithFrame:CGRectMake(inputWidth + imageWidth + headerInputWidth, headerRowHeight, 1.0, totalHeight - headerRowHeight)];
    v5.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:v5];

    UIView *v6 = [[UIView alloc] initWithFrame:CGRectMake(inputWidth + imageWidth + (headerInputWidth * 2), headerRowHeight, 1.0, totalHeight - headerRowHeight)];
    v6.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:v6];


    // TV an Audio Images

    UILabel *tvLabel = [[UILabel alloc] initWithFrame:CGRectMake(inputWidth, yCoordinate, imageWidth, headerRowHeight)];
    tvLabel.textAlignment = UITextAlignmentCenter;
    tvLabel.text = @"TV";
    [scrollView addSubview:tvLabel];

    UILabel *audioLabel = [[UILabel alloc] initWithFrame:CGRectMake(inputWidth + imageWidth, yCoordinate, imageWidth, headerRowHeight)];
    audioLabel.textAlignment = UITextAlignmentCenter;
    audioLabel.text = @"AUDIO";
    [scrollView addSubview:audioLabel];


    // H Border 1
    yCoordinate += headerRowHeight;
    UIView *hBorder1 = [[UIView alloc] initWithFrame:CGRectMake(inputWidth, yCoordinate, imageWidth * 2, 1.0)];
    hBorder1.backgroundColor = [UIColor blackColor];
    [scrollView addSubview:hBorder1];
    yCoordinate += hBorder1.bounds.size.height;

    // TV Inputs

    UIView *tvInputs = [[UIView alloc] initWithFrame:CGRectMake(inputWidth, yCoordinate, imageWidth, headerRowHeight)];
    tvInputs.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:tvInputs];

    UILabel *leftTv = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, headerInputWidth, tvInputs.bounds.size.height)];
    leftTv.textAlignment = UITextAlignmentCenter;
    leftTv.backgroundColor = [UIColor clearColor];
    leftTv.text = @"L";
    [tvInputs addSubview:leftTv];

    UILabel *centerTv = [[UILabel alloc] initWithFrame:CGRectMake(headerInputWidth, 0, headerInputWidth, tvInputs.bounds.size.height)];
    centerTv.backgroundColor = [UIColor clearColor];
    centerTv.textAlignment = UITextAlignmentCenter;
    centerTv.text = @"C";
    [tvInputs addSubview:centerTv];

    UILabel *rightTv = [[UILabel alloc] initWithFrame:CGRectMake(headerInputWidth * 2, 0, headerInputWidth, tvInputs.bounds.size.height)];
    rightTv.backgroundColor = [UIColor clearColor];
    rightTv.textAlignment = UITextAlignmentCenter;
    rightTv.text = @"R";
    [tvInputs addSubview:rightTv];

    // Audio Inputs
    UIView *audioInputs = [[UIView alloc] initWithFrame:CGRectMake(inputWidth + imageWidth, yCoordinate, imageWidth, headerRowHeight)];
    audioInputs.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:audioInputs];

    UILabel *zoneOne = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, headerInputWidth, audioInputs.bounds.size.height)];
    zoneOne.backgroundColor = [UIColor clearColor];
    zoneOne.textAlignment = UITextAlignmentCenter;
    zoneOne.text = @"1";
    [audioInputs addSubview:zoneOne];

    UILabel *zoneTwo = [[UILabel alloc] initWithFrame:CGRectMake(headerInputWidth, 0, headerInputWidth, audioInputs.bounds.size.height)];
    zoneTwo.backgroundColor = [UIColor clearColor];
    zoneTwo.textAlignment = UITextAlignmentCenter;
    zoneTwo.text = @"2";
    [audioInputs addSubview:zoneTwo];

    UILabel *zoneThree = [[UILabel alloc] initWithFrame:CGRectMake(headerInputWidth * 2, 0, headerInputWidth, audioInputs.bounds.size.height)];
    zoneThree.backgroundColor = [UIColor clearColor];
    zoneThree.textAlignment = UITextAlignmentCenter;
    zoneThree.text = @"3";
    [audioInputs addSubview:zoneThree];

    // H Border 2
    yCoordinate += headerRowHeight;
    UIView *hBorder2 = [[UIView alloc] initWithFrame:CGRectMake(inputWidth, yCoordinate, imageWidth * 2, 1.0)];
    hBorder2.backgroundColor = [UIColor blackColor];
    [scrollView addSubview:hBorder2];
    yCoordinate += hBorder2.bounds.size.height;


    // Inputs

    yCoordinate = headerRowHeight * 2;

    for (NSNumber *input in _inputArray) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, yCoordinate, inputWidth - 20, rowHeight)];
        label.textAlignment = UITextAlignmentRight;
        label.text = stringForInputDevice((InputDevice) [input integerValue]);
        [scrollView addSubview:label];

        AssignmentButton *leftTvButton = [[AssignmentButton alloc] init];
        leftTvButton.frame = CGRectMake(inputWidth + 1, yCoordinate, headerInputWidth - 1, rowHeight - 1);
        leftTvButton.inputSource = input;
        leftTvButton.outputDevice = [NSNumber numberWithInt:OutputDeviceLeftTv];
        [scrollView addSubview:leftTvButton];
        [leftTvButton addTarget:self action:@selector(handleTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [leftTvButton setImage:[UIImage imageNamed:@"AssignmentButtonBg@2x"] forState:UIControlStateNormal];
        [leftTvButton setImage:[UIImage imageNamed:@"AssignmentButtonBg_highlighted@2x"] forState:UIControlStateHighlighted];

        AssignmentButton *centerTvButton = [[AssignmentButton alloc] init];
        centerTvButton.frame = CGRectMake(inputWidth + headerInputWidth + 1, yCoordinate, headerInputWidth - 1, rowHeight - 1);
        centerTvButton.inputSource = input;
        centerTvButton.outputDevice = [NSNumber numberWithInt:OutputDeviceCenterTv];
        [scrollView addSubview:centerTvButton];
        [centerTvButton addTarget:self action:@selector(handleTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [centerTvButton setImage:[UIImage imageNamed:@"AssignmentButtonBg@2x"] forState:UIControlStateNormal];
        [centerTvButton setImage:[UIImage imageNamed:@"AssignmentButtonBg_highlighted@2x"] forState:UIControlStateHighlighted];

        AssignmentButton *rightTvButton = [[AssignmentButton alloc] init];
        rightTvButton.frame = CGRectMake(inputWidth + (headerInputWidth * 2) + 1, yCoordinate, headerInputWidth - 1, rowHeight - 1);
        rightTvButton.inputSource = input;
        rightTvButton.outputDevice = [NSNumber numberWithInt:OutputDeviceRightTv];
        [scrollView addSubview:rightTvButton];
        [rightTvButton addTarget:self action:@selector(handleTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [rightTvButton setImage:[UIImage imageNamed:@"AssignmentButtonBg@2x"] forState:UIControlStateNormal];
        [rightTvButton setImage:[UIImage imageNamed:@"AssignmentButtonBg_highlighted@2x"] forState:UIControlStateHighlighted];

        AssignmentButton *audioOneButton = [[AssignmentButton alloc] init];
        audioOneButton.frame = CGRectMake(inputWidth + imageWidth + 1, yCoordinate, headerInputWidth - 1, rowHeight - 1);
        audioOneButton.inputSource = input;
        audioOneButton.outputDevice = [NSNumber numberWithInt:OutputDeviceAudioZone1];
        [scrollView addSubview:audioOneButton];
        [audioOneButton addTarget:self action:@selector(handleTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [audioOneButton setImage:[UIImage imageNamed:@"AssignmentButtonBg@2x"] forState:UIControlStateNormal];
        [audioOneButton setImage:[UIImage imageNamed:@"AssignmentButtonBg_highlighted@2x"] forState:UIControlStateHighlighted];

        AssignmentButton *audioTwoButton = [[AssignmentButton alloc] init];
        audioTwoButton.frame = CGRectMake(inputWidth + imageWidth + (headerInputWidth * 1) + 1, yCoordinate, headerInputWidth - 1, rowHeight - 1);
        audioTwoButton.inputSource = input;
        audioTwoButton.outputDevice = [NSNumber numberWithInt:OutputDeviceAudioZone2];
        [scrollView addSubview:audioTwoButton];
        [audioTwoButton addTarget:self action:@selector(handleTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [audioTwoButton setImage:[UIImage imageNamed:@"AssignmentButtonBg@2x"] forState:UIControlStateNormal];
        [audioTwoButton setImage:[UIImage imageNamed:@"AssignmentButtonBg_highlighted@2x"] forState:UIControlStateHighlighted];

        AssignmentButton *audioThreeButton = [[AssignmentButton alloc] init];
        audioThreeButton.frame = CGRectMake(inputWidth + imageWidth + (headerInputWidth * 2) + 1, yCoordinate, headerInputWidth - 1, rowHeight - 1);
        audioThreeButton.inputSource = input;
        audioThreeButton.outputDevice = [NSNumber numberWithInt:OutputDeviceAudioZone3];
        [scrollView addSubview:audioThreeButton];
        [audioThreeButton addTarget:self action:@selector(handleTouchUp:) forControlEvents:UIControlEventTouchUpInside];
        [audioThreeButton setImage:[UIImage imageNamed:@"AssignmentButtonBg@2x"] forState:UIControlStateNormal];
        [audioThreeButton setImage:[UIImage imageNamed:@"AssignmentButtonBg_highlighted@2x"] forState:UIControlStateHighlighted];

        yCoordinate += rowHeight;

        UIView *border = [[UIView alloc] initWithFrame:CGRectMake(inputWidth, yCoordinate - 1, imageWidth * 2, 1.0)];
        border.backgroundColor = [UIColor darkGrayColor];
        [scrollView addSubview:border];
    }

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];

    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        RemoteVc_iPhone *remoteVc = [[RemoteVc_iPhone alloc] init];
        [remoteVc bindIRDevice:IRDeviceDVR];
        [self.navigationController pushViewController:remoteVc animated:NO];
    }
}

#pragma mark - Bind

#pragma mark - Actions

- (void)handleTouchUp:(AssignmentButton *)button {
    [[CommandCenter singleton] setMatrixInput:(InputDevice) [button.inputSource integerValue] toOutput:(OutputDevice) [button.outputDevice integerValue]];
}

#pragma mark - Helpers

#pragma mark - Delegate Methods

@end
