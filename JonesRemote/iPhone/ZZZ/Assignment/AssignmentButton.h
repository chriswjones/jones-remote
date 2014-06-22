

#import <Foundation/Foundation.h>
#import "MatrixEnum.h"


@interface AssignmentButton : UIButton

@property (nonatomic)InputDevice inputDevice;
@property (nonatomic)OutputDevice outputDevice;

- (id)initWithInputDevice:(InputDevice)inputDevice outputDevice:(OutputDevice)outputDevice;

@end