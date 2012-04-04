/**
 * $Id$
 * 
 * Copyright (c) 2012 Paul Mietz Egli
 * Licensed under the Apache Public License version 2.
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
package com.obscure.TiApphance;

import org.appcelerator.kroll.KrollModule;
import org.appcelerator.kroll.annotations.Kroll;
import org.appcelerator.titanium.TiApplication;

import com.apphance.android.Apphance;

@Kroll.module(name = "Tiapphance", id = "com.obscure.TiApphance")
public class TiapphanceModule extends KrollModule {

	// Standard Debugging variables
	private static final String	LCAT	= "TiapphanceModule";

	@Kroll.onAppCreate
	public static void onAppCreate(TiApplication app) {
	}

	public TiapphanceModule() {
		super();
	}

	@Kroll.method
	public void APHExtendedLog(String level, String tag, String message) {
		Apphance.log(level, tag, message);
	}

	@Kroll.getProperty(name="LEVEL_ERROR")
	public String getLEVEL_ERROR() {
		return Apphance.ERROR;
	}

	@Kroll.getProperty(name="LEVEL_FATAL")
	public String getLEVEL_FATAL() {
		return Apphance.FATAL;
	}

	@Kroll.getProperty(name="LEVEL_INFO")
	public String getLEVEL_INFO() {
		return Apphance.INFO;
	}

	@Kroll.getProperty(name="LEVEL_VERBOSE")
	public String getLEVEL_VERBOSE() {
		return Apphance.VERBOSE;
	}

	@Kroll.getProperty(name="LEVEL_WARNING")
	public String getLEVEL_WARNING() {
		return Apphance.WARNING;
	}

	@Kroll.getProperty(name="MODE_MARKET")
	public String getMODE_MARKET() {
		return Apphance.Mode.Market.name();
	}

	@Kroll.getProperty(name="MODE_QA")
	public String getMODE_QA() {
		return Apphance.Mode.QA.name();
	}

	@Kroll.getProperty(name="MODE_SILENT")
	public String getMODE_SILENT() {
		return Apphance.Mode.Silent.name();
	}

	@Kroll.method
	public void startNewSession(String apphanceKey, String mode) {
		Apphance.startNewSession(this.getActivity(), apphanceKey, Apphance.Mode.valueOf(mode));
	}

}
