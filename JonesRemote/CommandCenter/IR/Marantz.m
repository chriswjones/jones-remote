#import "Marantz.h"


@implementation Marantz

+ (NSString *)stringForIRCommand:(IRCommand)command {
    switch(command) {
        case IRCommandPowerOn:
            return @"37000,1,1,0,32,0,64,0,32,0,32,0,32,0,160,0,32,0,64,0,32,0,32,0,32,0,32,0,32,0,32,0,32,0,64,0,2720";
        case IRCommandPowerOff:
            return @"37000,1,1,0,32,0,32,0,32,0,32,0,32,0,32,0,160,0,32,0,64,0,32,0,32,0,32,0,32,0,32,0,32,0,64,0,2720";
        case IRCommandVolUp:
            return @"36000,5,1,32,32,65,65,65,32,32,32,32,32,32,32,32,65,65,32,32,32,32,32,32,3262";
        case IRCommandVolDown:
            return @"36000,5,1,32,32,32,32,32,32,65,32,32,32,32,32,32,32,32,65,65,32,32,32,32,65,32,3229";
        case IRCommandMuteOn:
            return @"37000,1,1,0,32,0,64,0,32,0,32,0,32,0,160,0,32,0,64,0,32,0,64,0,32,0,32,0,32,0,32,0,32,0,2720";
        case IRCommandMuteOff:
            return @"37000,1,1,0,32,0,32,0,32,0,32,0,32,0,32,0,160,0,32,0,64,0,32,0,64,0,32,0,32,0,32,0,32,0,64,0,2720";
        default:
            return @"";
    }
}


@end