#import <QuartzCore/QuartzCore.h>
#import "RemoteButton.h"
#import "Theme.h"


@implementation RemoteButton

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
        view.backgroundColor = [Theme grayColor];
        UIGraphicsBeginImageContextWithOptions(view.frame.size, view.opaque, 0.0);
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [self setBackgroundImage:[img stretchableImageWithLeftCapWidth:0 topCapHeight:0] forState:UIControlStateHighlighted];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    }

    return self;
}


- (id)init {
    self = [super init];
    if (self) {

    }

    return self;
}


@end