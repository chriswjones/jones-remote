//
// Created by chris on 7/27/12.
//
// To change the template use AppCode | Preferences | File Templates.
//

typedef enum {
    OutputDeviceLeftTv,
    OutputDeviceCenterTv,
    OutputDeviceRightTv,
    OutputDeviceAudioZone1,
    OutputDeviceAudioZone2,
    OutputDeviceAudioZone3
} OutputDevice;

typedef enum {
    InputDeviceDVR,
    InputDeviceCableA,
    InputDeviceCableB,
    InputDeviceBluRay,
    InputDeviceMac,
    InputDeviceAppleTv,
    InputDeviceWii,
    InputDeviceNone
} InputDevice;

typedef enum {
    MatrixCommandPowerOn,
    MatrixCommandPowerOff,
    MatrixCommandStatus
} MatrixCommand;


static inline NSString *stringForMatrixCommand(int command) {
    switch (command) {
        case MatrixCommandPowerOn:
            return @"Y";
        case MatrixCommandPowerOff:
            return @"X";
        case MatrixCommandStatus:
            return @"M";
        default:
            return @"";
    }
}

static inline NSData *matrixCommandDataForOutputDevice(OutputDevice outputDevice) {
    NSString *string = @"";

    switch (outputDevice) {
        case OutputDeviceLeftTv: {
            string = @"a";
            break;
        }
        case OutputDeviceCenterTv: {
            string = @"b";
            break;
        }
        case OutputDeviceRightTv: {
            string = @"c";
            break;
        }
        case OutputDeviceAudioZone1: {
            string = @"d";
            break;
        }
        case OutputDeviceAudioZone2: {
            string = @"e";
            break;
        }
        case OutputDeviceAudioZone3: {
            string = @"f";
            break;
        }
        default: {
            NSLog(@"MatrixEnum: Error, unrecognized output device: %d", outputDevice);
            break;
        }
    }

    return [string dataUsingEncoding:NSUTF8StringEncoding];
}

static inline NSData *matrixCommandDataForInputDevice(InputDevice inputDevice) {

    NSString *string = @"";

    switch (inputDevice) {
        case InputDeviceDVR: {
            string = @"1";
            break;
        }
        case InputDeviceCableA: {
            string = @"2";
            break;
        }
        case InputDeviceCableB: {
            string = @"3";
            break;
        }
        case InputDeviceBluRay: {
            string = @"4";
            break;
        }
        case InputDeviceAppleTv: {
            string = @"5";
            break;
        }
        case InputDeviceMac: {
            string = @"6";
            break;
        }
        case InputDeviceWii: {
            string = @"7";
            break;
        }
        case InputDeviceNone: {
            string = @"7";
            break;
        }
        default: {
            NSLog(@"MatrixEnum: Error, unrecognized input device: %d", inputDevice);
            break;
        }
    }

    return [string dataUsingEncoding:NSUTF8StringEncoding];
}

static inline NSString *stringForOutputDevice(OutputDevice outputDevice) {
    NSString *string = @"";
    switch (outputDevice) {
        case OutputDeviceLeftTv: {
            string = @"Left TV";
            break;
        }
        case OutputDeviceCenterTv: {
            string = @"Center TV";
            break;
        }
        case OutputDeviceRightTv: {
            string = @"Right TV";
            break;
        }
        case OutputDeviceAudioZone1: {
            string = @"Audio Zone 1";
            break;
        }
        case OutputDeviceAudioZone2: {
            string = @"Audio Zone 2";
            break;
        }
        case OutputDeviceAudioZone3: {
            string = @"Audio Zone 3";
            break;
        }
        default:
            break;
    }
    return string;
}

static inline NSString *stringForInputDevice(InputDevice inputDevice) {
    NSString *string = @"";

    switch (inputDevice) {
        case InputDeviceDVR: {
            string = @"DVR";
            break;
        }
        case InputDeviceCableA: {
            string = @"Cable-A";
            break;
        }
        case InputDeviceCableB: {
            string = @"Cable-B";
            break;
        }
        case InputDeviceBluRay: {
            string = @"BluRay";
            break;
        }
        case InputDeviceMac: {
            string = @"Mac";
            break;
        }
        case InputDeviceAppleTv: {
            string = @"Apple TV";
            break;
        }
        case InputDeviceWii: {
            string = @"Wii";
            break;
        }
        case InputDeviceNone: {
            string = @"None";
            break;
        }
        default:
            break;
    }

    return string;
}