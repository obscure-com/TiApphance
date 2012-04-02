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
    
	NSLog(@"[INFO] %@ loaded",self);
}

- (void)shutdown:(id)sender {
	[super shutdown:sender];
}

#pragma Public APIs

- (id)getMODE_MARKET {
    return [NSNumber numberWithInt:0];
}

- (id)getMODE_QA {
    return [NSNumber numberWithInt:1];
}

- (id)getMODE_SILENT {
    return [NSNumber numberWithInt:1];
}



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


@end
