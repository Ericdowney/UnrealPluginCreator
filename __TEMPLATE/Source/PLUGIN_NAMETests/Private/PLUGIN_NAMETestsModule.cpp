// Copyright <PLUGIN_AUTHOR> - <YEAR>. All Rights Reserved.

#include "<PLUGIN_NAME>TestsModule.h"

#include "Modules/ModuleManager.h"

#include "<PLUGIN_NAME>TestsLog.h"

void F<PLUGIN_NAME>TestsModule::StartupModule()
{
    UE_LOG(<PLUGIN_NAME>TestsLog, Log, TEXT("<PLUGIN_NAME>Tests::%s"), *FString(__FUNCTION__));
}

void F<PLUGIN_NAME>TestsModule::ShutdownModule()
{
    UE_LOG(<PLUGIN_NAME>TestsLog, Log, TEXT("<PLUGIN_NAME>Tests::%s"), *FString(__FUNCTION__));
}

IMPLEMENT_MODULE(F<PLUGIN_NAME>TestsModule, <PLUGIN_NAME>Tests)
