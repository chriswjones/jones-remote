//
// Created by chris on 7/27/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "TimeWarnerDVR.h"


@implementation TimeWarnerDVR

+ (NSString *)stringForIRCommand:(IRCommand)command {
    switch (command) {
        case IRCommand0:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,48,48,48,48,145,48,145,48,48,48,48,48,48,48,145,48,48,48,48,48,48,48,145,48,145,48,48,48,48,48,145,48,48";
        case IRCommand1:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,48,48,48,48,145,48,48,48,48,48,48,48,145,48,48,48,48,48,145,48,145,48,145,48,145,48,48,48,145,48,2167";
        case IRCommand2:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,48,48,48,48,48,48,145,48,48,48,48,48,48,48,145,48,48,48,48,48,48,48,145,48,145,48,145,48,48,48,145,48,2167";
        case IRCommand3:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,145,48,48,48,48,48,145,48,48,48,48,48,48,48,145,48,48,48,48,48,145,48,48,48,145,48,145,48,48,48,145,48,48";
        case IRCommand4:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,145,48,48,48,48,48,145,48,48,48,48,48,48,48,145,48,48,48,48,48,48,48,48,48,145,48,145,48,48,48,145,48,48";
        case IRCommand5:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,145,48,48,48,145,48,48,48,48,48,48,48,145,48,48,48,48,48,145,48,145,48,48,48,145,48,48,48,145,48,48";
        case IRCommand6:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,48,48,145,48,48,48,145,48,48,48,48,48,48,48,145,48,48,48,48,48,48,48,145,48,48,48,145,48,48,48,145,48,48";
        case IRCommand7:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,145,48,145,48,48,48,145,48,48,48,48,48,48,48,145,48,48,48,48,48,145,48,48,48,48,48,145,48,48,48,145,48,48";
        case IRCommand8:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,145,48,145,48,48,48,145,48,48,48,48,48,48,48,145,48,48,48,48,48,48,48,48,48,48,48,145,48,48,48,145,48,48";
        case IRCommand9:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,48,48,145,48,145,48,48,48,48,48,48,48,145,48,48,48,48,48,145,48,145,48,145,48,48,48,48,48,145,48,48";
        case IRCommandSelect:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,145,48,145,48,48,48,48,48,48,48,48,48,145,48,48,48,48,48,145,48,145,48,48,48,48,48,145,48,145,48,2167";
        case IRCommandLeft:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,145,48,48,48,48,48,48,48,48,48,48,48,48,48,145,48,48,48,48,48,48,48,48,48,145,48,145,48,145,48,145,48,2167";
        case IRCommandRight:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,145,48,48,48,48,48,48,48,48,48,48,48,145,48,48,48,48,48,145,48,145,48,48,48,145,48,145,48,145,48,2167";
        case IRCommandUp:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,145,48,48,48,48,48,48,48,48,48,48,48,48,48,145,48,48,48,48,48,145,48,48,48,145,48,145,48,145,48,145,48,2167";
        case IRCommandDown:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,145,48,48,48,145,48,48,48,48,48,48,48,48,48,145,48,48,48,48,48,48,48,48,48,145,48,48,48,145,48,145,48,2167";
        case IRCommandPageUp:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,145,48,48,48,48,48,145,48,48,48,48,48,145,48,48,48,48,48,2510,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,145,48,48,48,48,48,48,48,145";
        case IRCommandPageDown:
            return @"57000,1,1,191,191,48,145,48,145,48,48,48,145,48,145,48,145,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,145,48,48,48,48,48,48,48,48,48,48,48,145,48,48,48,48,48,2510,191,191,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,48,145,48,48,48,48,48,145";
        case IRCommandInfo:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,48,48,145,48,48,48,48,48,48,48,48,48,145,48,48,48,48,48,145,48,145,48,145,48,48,48,145,48,145,48,2167";
        case IRCommandPause:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,48,48,145,48,48,48,48,48,48,48,48,48,48,48,145,48,48,48,48,48,48,48,145,48,48,48,145,48,145,48,145,48,48";
        case IRCommandPlay:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,145,48,48,48,48,48,145,48,145,48,48,48,48,48,145,48,48,48,48,48,48,48,48,48,145,48,145,48,48,48,48,48,48";
        case IRCommandRewind:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,48,48,48,48,145,48,48,48,145,48,48,48,48,48,145,48,48,48,48,48,48,48,145,48,145,48,48,48,145,48,48,48,48";
        case IRCommandFastForward:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,48,48,145,48,48,48,145,48,48,48,48,48,145,48,48,48,48,48,145,48,145,48,145,48,48,48,145,48,48,48,48";
        case IRCommandStop:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,145,48,48,48,145,48,145,48,48,48,48,48,145,48,48,48,48,48,145,48,145,48,48,48,145,48,48,48,48,48,48";
        case IRCommandRecord:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,48,48,145,48,48,48,145,48,145,48,48,48,48,48,145,48,48,48,48,48,48,48,145,48,48,48,145,48,48,48,48,48,2167";
        case IRCommandA:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,145,48,145,48,145,48,48,48,145,48,48,48,48,48,145,48,48,48,48,48,48,48,48,48,48,48,48,48,145,48,48,48,2167";
        case IRCommandB:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,48,48,48,48,145,48,145,48,48,48,48,48,145,48,48,48,48,48,145,48,145,48,145,48,145,48,48,48,48,48,2510";
        case IRCommandC:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,145,48,48,48,48,48,48,48,145,48,145,48,48,48,48,48,145,48,48,48,48,48,48,48,145,48,145,48,145,48,48,48,48,48,48";
        case IRCommandExit:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,145,48,145,48,48,48,145,48,48,48,48,48,145,48,48,48,48,48,145,48,145,48,48,48,48,48,145,48,48,48,2510";
        case IRCommandGuide:
            return @"57000,1,1,192,192,48,145,48,145,48,48,48,145,48,145,48,48,48,145,48,145,48,48,48,48,48,48,48,48,48,48,48,145,48,48,48,48,48,145,48,48,48,48,48,145,48,145,48,145,48,2167";
        case IRCommandRecordedShows:
            return @"59000,1,1,199,200,50,148,50,149,50,49,50,150,50,149,50,50,49,150,50,150,50,49,50,49,50,150,50,49,50,50,50,149,50,49,50,50,50,149,50,50,50,50,50,149,50,150,50,49,50,2213";
        case IRCommandPlusChannel:
            return @"56000,1,1,190,192,48,144,48,144,48,47,48,144,48,144,48,144,48,47,48,144,48,144,48,144,48,47,48,52,48,47,48,144,48,47,48,47,48,47,48,144,48,47,48,47,48,47,48,144,48,2162,190,192,48,144,48,144,48,47,48,144,48,144,48,144,48,47,48,144,48,144,48,144,48,47,48,52,48,47,48,144,48,47,48,47,48,47,48,144,48,47,48,47,48,47,48,144,48,2154";
        case IRCommandMinusChannel:
            return @"56000,1,1,190,192,48,144,48,144,48,47,48,144,48,144,48,47,48,144,48,144,48,144,48,144,48,47,48,52,48,47,48,144,48,47,48,47,48,144,48,47,48,47,48,47,48,47,48,144,48,2162,190,192,48,144,48,144,48,47,48,144,48,144,48,47,48,144,48,144,48,144,48,144,48,47,48,52,48,47,48,144,48,47,48,47,48,144,48,47,48,47,48,47,48,47,48,144,48,2154";
        case IRCommandPlusDay:
            return @"56000,1,1,190,192,48,144,48,144,48,47,48,144,48,144,48,144,48,47,48,47,48,47,48,47,48,47,48,52,48,47,48,144,48,47,48,47,48,47,48,144,48,144,48,144,48,144,48,144,48,2162,190,192,48,144,48,144,48,47,48,144,48,144,48,144,48,47,48,47,48,47,48,47,48,47,48,52,48,47,48,144,48,47,48,47,48,47,48,144,48,144,48,144,48,144,48,144,48,2154";
        case IRCommandMinusDay:
            return @"56000,1,1,190,192,48,144,48,144,48,47,48,144,48,144,48,47,48,47,48,47,48,47,48,47,48,47,48,52,48,47,48,144,48,47,48,47,48,144,48,144,48,144,48,144,48,144,48,144,48,2162,190,192,48,144,48,144,48,47,48,144,48,144,48,47,48,47,48,47,48,47,48,47,48,47,48,52,48,47,48,144,48,47,48,47,48,144,48,144,48,144,48,144,48,144,48,144,48,2154";
        case IRCommandLive:
            return @"";
        case IRCommandPowerOnOff:
            return @"37000,1,1,15,11,6,11,6,23,6,11,6,29,6,17,6,11,6,11,6,11,6,11,6,23,6,17,6,23,6,11,6,11,6,29,6,11,6,3268,15,11,6,11,6,23,6,11,6,29,6,17,6,11,6,11,6,11,6,11,6,23,6,17,6,23,6,11,6,11,6,29,6,11,6,3224";
        default:
            return @"";
    }
}

@end