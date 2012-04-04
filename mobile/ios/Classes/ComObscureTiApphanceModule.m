/**
 * $Id$
 * 
 * Copyright (c) 2012 Paul Mietz Egli
 * Licensed under the Apache Public License version 2.
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComObscureTiApphanceModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import <Apphance-iOS/APHLogger.h>

@implementation ComObscureTiApphanceModule

@synthesize MODE_MARKET=_MODE_MARKET, MODE_QA=_MODE_QA, MODE_SILENT=_MODE_SILENT;
@synthesize LEVEL_VERBOSE=_LEVEL_VERBOSE,LEVEL_INFO=_LEVEL_INFO,LEVEL_WARNING=_LEVEL_WARNING,LEVEL_ERROR=_LEVEL_ERROR,LEVEL_FATAL=_LEVEL_FATAL;

#pragma mark Internal

- (id)moduleGUID {
	return @"066cb1c9-dbc6-4aad-9f78-936758e70801";
}

- (NSString*)moduleId {
	return @"com.obscure.TiApphance";
}

#pragma mark Lifecycle

- (void)startup {
	[super startup];
    
    NSSetUncaughtExceptionHandler(&APHUncaughtExceptionHandler);
    
    _MODE_MARKET = [NSNumber numberWithInt:0];
    _MODE_QA = [NSNumber numberWithInt:1];
    _MODE_SILENT = [NSNumber numberWithInt:2];
    
    _LEVEL_VERBOSE = [NSNumber numberWithInt:APHLogLevelVerbose];
    _LEVEL_INFO = [NSNumber numberWithInt:APHLogLevelInfo];
    _LEVEL_WARNING = [NSNumber numberWithInt:APHLogLevelWarning];
    _LEVEL_ERROR = [NSNumber numberWithInt:APHLogLevelError];
    _LEVEL_FATAL = [NSNumber numberWithInt:APHLogLevelFatal];
    
	NSLog(@"[INFO] %@ loaded",self);
}

- (void)shutdown:(id)sender {
	[super shutdown:sender];
}

#pragma Public APIs

- (void)startNewSession:(id)args {
    NSString * applicationKey;
    NSNumber * mode;
    
    ENSURE_ARG_AT_INDEX(applicationKey, args, 0, NSString)
    ENSURE_ARG_OR_NIL_AT_INDEX(mode, args, 1, NSNumber)
    
    NSString * apphanceMode = kAPHApphanceModeMarket;
    if (mode) {
        if ([mode intValue] == 1) {
            apphanceMode = kAPHApphanceModeQA;
        }
        else if ([mode intValue] == 2) {
            apphanceMode = kAPHApphanceModeSilent;
        }
    }
    
    [APHLogger startNewSessionWithApplicationKey:applicationKey apphanceMode:apphanceMode];
}

-(void)APHExtendedLog:(id)args {
    NSNumber * level;
    NSString * tag;
    NSString * message;
    
    ENSURE_ARG_AT_INDEX(level, args, 0, NSNumber)
    ENSURE_ARG_AT_INDEX(tag, args, 1, NSString)
    ENSURE_ARG_AT_INDEX(message, args, 2, NSString)
    
    APHExtendedLog((APHLogLevel) [level intValue], tag, message);
}

@end
