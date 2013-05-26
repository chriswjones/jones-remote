//
// Created by chris on 7/27/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"
#import "MatrixEnum.h"
#import "IREnum.h"


@interface CommandCenter : NSObject <GCDAsyncSocketDelegate>

@property(nonatomic, strong) GCDAsyncSocket *matrixSocket;

+ (CommandCenter *)singleton;

- (void)connectSockets;

- (void)disconnectSockets;

- (void)powerMatrixOn;

- (void)powerMatrixOff;

- (void)setMatrixInput:(InputDevice)inputDevice toOutput:(OutputDevice)outputDevice;

- (void)sendIRCommand:(IRCommand)irCommand toIRDevice:(IRDevice)irDevice;

- (void)sendQueableIRCommand:(IRCommand)irCommand toIRDevice:(IRDevice)irDevice;

@end