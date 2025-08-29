// Copyright <PLUGIN_AUTHOR> - <YEAR>. All Rights Reserved.

#include "<PLUGIN_NAME>Module.h"
#include "<PLUGIN_NAME>Log.h"

#define LOCTEXT_NAMESPACE "F<PLUGIN_NAME>Module"

void F<PLUGIN_NAME>Module::StartupModule()
{
	// This code will execute after your module is loaded into memory;
	// the exact timing is specified in the .uplugin file per-module
    UE_LOG(<PLUGIN_NAME>Log, Verbose, TEXT("F<PLUGIN_NAME>Module::%s"), *FString(__FUNCTION__));
}

void F<PLUGIN_NAME>Module::ShutdownModule()
{
	// This function may be called during shutdown to clean up your module.
	// For modules that support dynamic reloading, we call this function before unloading the module.
    UE_LOG(<PLUGIN_NAME>Log, Verbose, TEXT("F<PLUGIN_NAME>Module::%s"), *FString(__FUNCTION__));
}

#undef LOCTEXT_NAMESPACE
	
IMPLEMENT_MODULE(F<PLUGIN_NAME>Module, <PLUGIN_NAME>)
