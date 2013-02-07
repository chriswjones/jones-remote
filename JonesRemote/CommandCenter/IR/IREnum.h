//
// Created by chris on 7/27/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MatrixEnum.h"

typedef enum {
    IRCommandNoCommand = 0,
    IRCommand0, IRCommand1, IRCommand2, IRCommand3, IRCommand4, IRCommand5, IRCommand6, IRCommand7, IRCommand8, IRCommand9,
    IRCommandRewind, IRCommandFastForward, IRCommandPlay, IRCommandPause, IRCommandStop, IRCommandRecord,
    IRCommandGuide, IRCommandRecordedShows, IRCommandPageUp, IRCommandPageDown, IRCommandUp, IRCommandDown, IRCommandLeft, IRCommandRight, IRCommandSelect, IRCommandExit,
    IRCommandA, IRCommandB, IRCommandC, IRCommandInfo,
    IRCommandPowerOn, IRCommandPowerOff,
    IRCommandStatus
} IRCommand;

typedef enum {
    IRDeviceDVR,
    IRDeviceCableA,
    IRDeviceCableB,
    IRDeviceBluRay,
    IRDeviceMac,
    IRDeviceAppleTv,
    IRDeviceWii,
    IRDeviceLeftTv,
    IRDeviceCenterTv,
    IRDeviceRightTv,
    IRDeviceNone
} IRDevice;

static inline NSString *stringForIRDevice(IRDevice irDevice) {
    NSString *string = @"";
    switch (irDevice) {
        case IRDeviceDVR: {
            string = @"DVR";
            break;
        }
        case IRDeviceCableA: {
            string = @"Cable-A";
            break;
        }
        case IRDeviceCableB: {
            string = @"Cable-B";
            break;
        }
        case IRDeviceBluRay: {
            string = @"BluRay";
            break;
        }
        case IRDeviceMac: {
            string = @"Mac";
            break;
        }
        case IRDeviceAppleTv: {
            string = @"Apple TV";
            break;
        }
        case IRDeviceWii: {
            string = @"Wii";
            break;
        }
        case IRDeviceLeftTv: {
            string = @"Left TV";
            break;
        }
        case IRDeviceCenterTv: {
            string = @"Center TV";
            break;
        }
        case IRDeviceRightTv: {
            string = @"Right TV";
            break;
        }
        default:
            break;
    }

    return string;
}