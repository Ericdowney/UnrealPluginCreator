// Copyright <PLUGIN_AUTHOR> - <YEAR>. All Rights Reserved.

#pragma once

#include "Modules/ModuleManager.h"

class F<PLUGIN_NAME>TestsModule : public IModuleInterface
{
public:

	/** IModuleInterface implementation */
	virtual void StartupModule() override;
	virtual void ShutdownModule() override;
};
