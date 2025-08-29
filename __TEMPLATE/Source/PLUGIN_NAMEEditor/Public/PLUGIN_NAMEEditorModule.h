// Copyright <PLUGIN_AUTHOR> - <YEAR>. All Rights Reserved.

#pragma once

#include "Modules/ModuleManager.h"

class SDockTab;

class F<PLUGIN_NAME>EditorModule : public IModuleInterface
{
public:

	/** IModuleInterface implementation */
	virtual void StartupModule() override;
	virtual void ShutdownModule() override;

	TSharedRef<SDockTab> OnSpawnPluginTab(const FSpawnTabArgs& SpawnTabArgs);
};
