

#import "AssignmentButton.h"


@implementation AssignmentButton

- (id)initWithInputDevice:(InputDevice)inputDevice outputDevice:(OutputDevice)outputDevice {
    self = [super init];
    if (self) {
        self.inputDevice = inputDevice;
        self.outputDevice = outputDevice;

        [self setBackgroundImage:[UIImage imageNamed:@"AssignmentButtonBg@2x.png"]
                        forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"AssignmentButtonBg_highlighted@2x.png"]
                        forState:UIControlStateHighlighted];
    }

    return self;
}

@end