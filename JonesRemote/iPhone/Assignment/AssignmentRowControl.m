#import "AssignmentRowControl.h"
#import "AssignmentButton.h"
#import "CommandCenter.h"
#import "Theme.h"


@implementation AssignmentRowControl {
@private
    InputDevice _device;
    NSArray *_outputs;

    // Views
    UIView *_hDivider;
    NSMutableArray *_vDividerArray;
    UILabel *_deviceLabel;
    NSMutableArray *_buttonArray;
}

- (id)initWithInputDevice:(InputDevice)inputDevice outputArray:(NSArray *)outputs {
    self = [super init];
    if (self) {
        _device = inputDevice;
        _outputs = outputs;

        // Vertical Dividers
        _vDividerArray = [NSMutableArray array];
        for (int i = 0; i < 3; i++) {
            UIView *divider = [[UIView alloc] init];
            divider.backgroundColor = [Theme faintGrayColor];
            [_vDividerArray addObject:divider];
            [self addSubview:divider];
        }

        // Horizontal Divider
        _hDivider = [[UIView alloc] init];
        _hDivider.backgroundColor = [Theme grayColor];
        [self addSubview:_hDivider];

        // Buttons
        _buttonArray = [NSMutableArray array];
        for (int i = 0; i < [_outputs count]; i++) {
            OutputDevice outputDevice = (OutputDevice) [[_outputs objectAtIndex:i] integerValue];
            AssignmentButton *button = [[AssignmentButton alloc] initWithInputDevice:_device
                                                                        outputDevice:outputDevice];
            [button addTarget:self
                       action:@selector(handleTouchUp:)
             forControlEvents:UIControlEventTouchUpInside];

            [_buttonArray addObject:button];
            [self addSubview:button];
        }

        // Label
        _deviceLabel = [[UILabel alloc] init];
        _deviceLabel.font = [Theme fontForSize:60];
        _deviceLabel.adjustsFontSizeToFitWidth = YES;
        _deviceLabel.textColor = [Theme lightGrayColor];
        _deviceLabel.backgroundColor = [UIColor clearColor];
        _deviceLabel.text = stringForInputDevice(_device);
        [self addSubview:_deviceLabel];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    // Vertical Dividers
    CGFloat sectionWidth = self.bounds.size.width / 3;
    for (int i = 0; i < [_vDividerArray count]; i++) {
        UIView *view = [_vDividerArray objectAtIndex:i];
        view.frame = CGRectMake(((sectionWidth + 1) * i) - 1.0, 0, 1.0, self.bounds.size.height);
    }

    // Horizontal Divider
    _hDivider.frame = CGRectMake(0, self.bounds.size.height - 1, (320/3) * [_buttonArray count], 1.0);

    // Label
    _deviceLabel.frame = CGRectMake(5.0, 5.0, self.bounds.size.width - 10.0, self.bounds.size.height - 10.0);

    // Buttons
    for (int i = 0; i < [_buttonArray count]; i++) {
        AssignmentButton *button = [_buttonArray objectAtIndex:i];
        button.frame = CGRectMake(((sectionWidth) * i) + i, 0, sectionWidth, self.bounds.size.height - 1);
    }
}

- (void)handleTouchUp:(AssignmentButton *)sender {
    [[CommandCenter singleton] setMatrixInput:sender.inputDevice
                                     toOutput:sender.outputDevice];
}

@end