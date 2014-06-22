#import "MatrixEnum.h"

NS_ENUM(int, IRCommand) {
  IRCommandNoCommand,
  IRCommand0, IRCommand1, IRCommand2, IRCommand3, IRCommand4, IRCommand5, IRCommand6, IRCommand7, IRCommand8, IRCommand9,
  IRCommandRewind, IRCommandFastForward, IRCommandPlay, IRCommandPause, IRCommandStop, IRCommandRecord, IRCommandLive,
  IRCommandGuide, IRCommandRecordedShows, IRCommandPageUp, IRCommandPageDown, IRCommandUp, IRCommandDown, IRCommandLeft, IRCommandRight, IRCommandSelect, IRCommandExit,
  IRCommandA, IRCommandB, IRCommandC, IRCommandInfo,
  IRCommandPowerOn, IRCommandPowerOff, IRCommandPowerOnOff, IRCommandVolUp, IRCommandVolDown, IRCommandMute,
  IRCommandPlusDay, IRCommandMinusDay, IRCommandPlusChannel, IRCommandMinusChannel,
  IRCommandStatus, IRCommandBack,
  IRCommandMuteOn, IRCommandMuteOff,
  IRCommandMenu
};

NS_ENUM(int, IRDevice) {
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
};

static inline NSString *stringForIRDevice(enum IRDevice irDevice) {
  switch (irDevice) {
    case IRDeviceDVR:
      return @"Dvr";
    case IRDeviceCableA:
      return @"Cable A";
    case IRDeviceCableB:
      return @"Cable B";
    case IRDeviceBluRay:
      return @"Blu-Ray";
    case IRDeviceMac:
      return @"Mac Mini";
    case IRDeviceAppleTv:
      return @"Apple TV";
    case IRDeviceWii:
      return @"Wii";
    case IRDeviceLeftTv:
      return @"Left TV";
    case IRDeviceCenterTv:
      return @"Center TV";
    case IRDeviceRightTv:
      return @"Right TV";
    default:
      NSLog(@"Error, unrecognized ir device: %d", irDevice);
      return @"";
  }
}