//
// Created by chris on 7/27/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CommandCenter.h"
#import "JTLSingleton.h"
#import "IRHardware.h"
#import "TimeWarnerDVR.h"
#import "PanasonicPlasmaTV.h"
#import "BluRay.h"
#import "Marantz.h"
#import "DirecTV.h"

#define MATRIX_SOCKET_IP @"192.168.0.201"
#define MATRIX_SOCKET_PORT 4999

#define RECEIVER_SOCKET_IP @"192.168.0.202"
#define RECEIVER_SOCKET_PORT 4999

#define IR1_SOCKET_IP @"192.168.0.201"
#define IR1_SOCKET_PORT 4998

#define IR2_SOCKET_IP @"192.168.0.202"
#define IR2_SOCKET_PORT 4998

#define CONNECT_SOCKET_TIMEOUT 10
#define IR_COMMAND_TIMEOUT 1
#define MATRIX_COMMAND_TIMEOUT 1

#define MATRIX_COMMAND_DELAY 1
#define IR_COMMAND_DELAY 1

@implementation CommandCenter {
  GCDAsyncSocket *_matrixSocket;
  GCDAsyncSocket *_receiverSocket;
  GCDAsyncSocket *_ir1Socket;
  GCDAsyncSocket *_ir2Socket;
  dispatch_queue_t _commandQueue;
}

SINGLETON(CommandCenter)

- (id)init {
  self = [super init];
  if (self) {
    _commandQueue = dispatch_queue_create("com.jones.matrixqueue", NULL);

    _matrixSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    _matrixSocket.delegate = self;

    _receiverSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    _receiverSocket.delegate = self;

    _ir1Socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    _ir1Socket.delegate = self;

    _ir2Socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    _ir2Socket.delegate = self;

    [self connectSockets];
  }
  return self;
}

- (void)connectSockets {
  if (![_matrixSocket isConnected]) {
    [_matrixSocket connectToHost:MATRIX_SOCKET_IP onPort:MATRIX_SOCKET_PORT withTimeout:CONNECT_SOCKET_TIMEOUT error:nil];
  }

  if (![_receiverSocket isConnected]) {
    [_receiverSocket connectToHost:RECEIVER_SOCKET_IP onPort:RECEIVER_SOCKET_PORT error:nil];
  }

  if (![_ir1Socket isConnected]) {
    [_ir1Socket connectToHost:IR1_SOCKET_IP onPort:IR1_SOCKET_PORT error:nil];
  }

  if (![_ir2Socket isConnected]) {
    [_ir2Socket connectToHost:IR2_SOCKET_IP onPort:IR2_SOCKET_PORT error:nil];
  }
}

- (void)disconnectSockets {
  if ([_matrixSocket isConnected]) {
    [_matrixSocket disconnect];
  }

  if ([_receiverSocket isConnected]) {
    [_receiverSocket disconnect];
  }

  if ([_ir1Socket isConnected]) {
    [_ir1Socket disconnect];
  }

  if ([_ir2Socket isConnected]) {
    [_ir2Socket disconnect];
  }
}

#pragma mark - Matrix Commands

- (void)powerMatrixOn {
  dispatch_async(_commandQueue, ^{
      [_matrixSocket writeData:[stringForMatrixCommand(MatrixCommandPowerOn) dataUsingEncoding:NSUTF8StringEncoding] withTimeout:MATRIX_COMMAND_TIMEOUT tag:0];
      sleep(MATRIX_COMMAND_DELAY);
  });
}

- (void)powerMatrixOff {
  dispatch_async(_commandQueue, ^{
      [_matrixSocket writeData:[stringForMatrixCommand(MatrixCommandPowerOff) dataUsingEncoding:NSUTF8StringEncoding] withTimeout:MATRIX_COMMAND_TIMEOUT tag:0];
      sleep(MATRIX_COMMAND_DELAY);
  });
}

- (void)setMatrixInput:(InputDevice)inputDevice toOutput:(OutputDevice)outputDevice {
  dispatch_async(_commandQueue, ^{
      [_matrixSocket writeData:matrixCommandDataForOutputDevice(outputDevice) withTimeout:MATRIX_COMMAND_TIMEOUT tag:0];
      [_matrixSocket writeData:matrixCommandDataForInputDevice(inputDevice) withTimeout:MATRIX_COMMAND_TIMEOUT tag:0];
      sleep(MATRIX_COMMAND_DELAY);
  });
}

#pragma mark - IR Commands

- (void)sendIRCommand:(IRCommand)irCommand toIRDevice:(IRDevice)irDevice {
  dispatch_async(_commandQueue, ^{
      [self processIrCommand:irCommand irDevice:irDevice];
  });
}

- (void)sendQueableIRCommand:(IRCommand)irCommand toIRDevice:(IRDevice)irDevice {
  dispatch_async(_commandQueue, ^{
      [self processIrCommand:irCommand irDevice:irDevice];
      sleep(IR_COMMAND_DELAY);
  });
}

- (void)processIrCommand:(IRCommand)irCommand irDevice:(IRDevice)irDevice {
  NSString *locationString = [CommandCenter locationStringForIRDevice:irDevice];
  Class <IRHardware> hardwareClass = [CommandCenter hardwareClassForIRDevice:irDevice];
  NSString *commandString = [hardwareClass stringForIRCommand:irCommand];
  NSString *finalString = [NSString stringWithFormat:@"sendir,%@,999,%@\r", locationString, commandString];

  dispatch_async(dispatch_get_main_queue(), ^{
      NSLog(@"Final IR String:%@", finalString);
  });

  GCDAsyncSocket *socket = [self socketForIRDevice:irDevice];
  [socket writeData:[finalString dataUsingEncoding:NSUTF8StringEncoding] withTimeout:IR_COMMAND_TIMEOUT tag:0];
}

+ (Class <IRHardware>)hardwareClassForIRDevice:(IRDevice)irDevice {

  Class <IRHardware> class = nil;

  switch (irDevice) {
    case IRDeviceDVR:
      class = [TimeWarnerDVR class];
      break;
    case IRDeviceCableA:
    case IRDeviceCableB:
      class = [DirecTV class];
      break;
    case IRDeviceLeftTv:
    case IRDeviceCenterTv:
    case IRDeviceRightTv:
      class = [PanasonicPlasmaTV class];
      break;
    case IRDeviceBluRay:
      class = [BluRay class];
      break;
    case IRDeviceMarantz:
      class = [Marantz class];
      break;
    default:
      break;
  }

  return class;
}

+ (NSString *)locationStringForIRDevice:(IRDevice)irDevice {
  switch (irDevice) {
    case IRDeviceCableA:
      return @"4:2";
    case IRDeviceDVR:
      return @"4:1";
    case IRDeviceCableB:
      return @"4:3";
    case IRDeviceLeftTv:
      return @"5:1";
    case IRDeviceCenterTv:
      return @"5:2";
    case IRDeviceRightTv:
      return @"5:3";
    case IRDeviceBluRay:
      return @"4:1";
    case IRDeviceMarantz:
      return @"4:2";
    default:
      return @"";
  }
}

- (GCDAsyncSocket *)socketForIRDevice:(IRDevice)device {
  switch (device) {
    case IRDeviceLeftTv:
    case IRDeviceRightTv:
    case IRDeviceCenterTv:
    case IRDeviceDVR:
    case IRDeviceCableA:
    case IRDeviceCableB:
      return _ir1Socket;
    case IRDeviceBluRay:
    case IRDeviceMarantz:
      return _ir2Socket;
    default:
      return nil;
  }
}

@end