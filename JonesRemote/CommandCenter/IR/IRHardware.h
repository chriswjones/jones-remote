//
// Created by chris on 7/27/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "IREnum.h"

@protocol IRHardware <NSObject>

+ (NSString *)stringForIRCommand:(IRCommand)command;

@end