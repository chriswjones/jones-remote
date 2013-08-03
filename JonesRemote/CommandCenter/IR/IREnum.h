//
// Created by chris on 7/27/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MatrixEnum.h"

typedef enum {
    IRCommandNoCommand = 0,
    IRCommand0, IRCommand1, IRCommand2, IRCommand3, IRCommand4, IRCommand5, IRCommand6, IRCommand7, IRCommand8, IRCommand9,
    IRCommandRewind, IRCommandFastForward, IRCommandPlay, IRCommandPause, IRCommandStop, IRCommandRecord, IRCommandLive,
    IRCommandGuide, IRCommandRecordedShows, IRCommandPageUp, IRCommandPageDown, IRCommandUp, IRCommandDown, IRCommandLeft, IRCommandRight, IRCommandSelect, IRCommandExit,
    IRCommandA, IRCommandB, IRCommandC, IRCommandInfo,
    IRCommandPowerOn, IRCommandPowerOff, IRCommandPowerOnOff, IRCommandVolUp, IRCommandVolDown, IRCommandMute,
    IRCommandPlusDay, IRCommandMinusDay, IRCommandPlusChannel, IRCommandMinusChannel,
    IRCommandStatus, IRCommandBack
    , IRCommandMuteOn, IRCommandMuteOff
    , IRCommandMenu
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
    IRDeviceMarantz,
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
            string = @"CABLE A";
            break;
        }
        case IRDeviceCableB: {
            string = @"CABLE B";
            break;
        }
        case IRDeviceBluRay: {
            string = @"BLU-RAY";
            break;
        }
        case IRDeviceMac: {
            string = @"MAC MINI";
            break;
        }
        case IRDeviceAppleTv: {
            string = @"APPLE TV";
            break;
        }
        case IRDeviceWii: {
            string = @"Wii";
            break;
        }
        case IRDeviceLeftTv: {
            string = @"LEFT TV";
            break;
        }
        case IRDeviceCenterTv: {
            string = @"CENTER TV";
            break;
        }
        case IRDeviceRightTv: {
            string = @"RIGHT TV";
            break;
        }
        default:
            break;
    }

    return string;
}