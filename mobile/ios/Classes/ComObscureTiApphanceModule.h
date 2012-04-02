/**
 * $Id$
 * 
 * Copyright (c) 2012 Paul Mietz Egli
 * Licensed under the Apache Public License version 2.
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiModule.h"

@interface ComObscureTiApphanceModule : TiModule {
}
@property (readonly) NSNumber * MODE_MARKET;
@property (readonly) NSNumber * MODE_QA;
@property (readonly) NSNumber * MODE_SILENT;

@property (readonly) NSNumber * LEVEL_VERBOSE;
@property (readonly) NSNumber * LEVEL_INFO;
@property (readonly) NSNumber * LEVEL_WARNING;
@property (readonly) NSNumber * LEVEL_ERROR;
@property (readonly) NSNumber * LEVEL_FATAL;

@end
