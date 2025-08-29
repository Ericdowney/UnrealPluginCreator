// Copyright <PLUGIN_AUTHOR> - <YEAR>. All Rights Reserved.

#include "<PLUGIN_NAME>EditorModule.h"

#include "<PLUGIN_NAME>EditorLog.h"

#include "LevelEditor.h"
#include "Framework/MultiBox/MultiBoxBuilder.h"
#include "ToolMenus.h"
#include "EditorStyleSet.h"
#include "Widgets/Layout/SBox.h"
#include "Widgets/Docking/SDockTab.h"

#include "<PLUGIN_NAME>EditorWidget.h"

#define LOCTEXT_NAMESPACE "F<PLUGIN_NAME>EditorModule"

void F<PLUGIN_NAME>EditorModule::StartupModule() {
    UE_LOG(<PLUGIN_NAME>EditorLog, Verbose, TEXT("F<PLUGIN_NAME>EditorModule::%s"), *FString(__FUNCTION__));

	// Register the custom tab
    FGlobalTabmanager::Get()->RegisterNomadTabSpawner("<PLUGIN_NAME>DebugTab",
        FOnSpawnTab::CreateRaw(this, &F<PLUGIN_NAME>EditorModule::OnSpawnPluginTab))
        .SetDisplayName(FText::FromString("<PLUGIN_NAME>"))
        .SetMenuType(ETabSpawnerMenuType::Enabled);

    // Add a button to the Window > Developer Tools menu
    FLevelEditorModule& LevelEditorModule = FModuleManager::LoadModuleChecked<FLevelEditorModule>("LevelEditor");

    TSharedPtr<FExtender> MenuExtender = MakeShareable(new FExtender);
    MenuExtender->AddMenuExtension(
        "WindowLayout",
        EExtensionHook::After,
        nullptr,
        FMenuExtensionDelegate::CreateLambda([](FMenuBuilder& Builder) {
            Builder.AddMenuEntry(
                FText::FromString("<PLUGIN_NAME>"),
                FText::FromString("Open the <PLUGIN_NAME> Tab."),
                FSlateIcon(),
                FUIAction(FExecuteAction::CreateLambda([] {
                    FGlobalTabmanager::Get()->TryInvokeTab(FName("<PLUGIN_NAME>DebugTab"));
                }))
            );
        })
    );

    LevelEditorModule.GetMenuExtensibilityManager()->AddExtender(MenuExtender);
}

void F<PLUGIN_NAME>EditorModule::ShutdownModule() {
    UE_LOG(<PLUGIN_NAME>EditorLog, Verbose, TEXT("F<PLUGIN_NAME>EditorModule::%s"), *FString(__FUNCTION__));

	FGlobalTabmanager::Get()->UnregisterNomadTabSpawner("<PLUGIN_NAME>DebugTab");
}

TSharedRef<SDockTab> F<PLUGIN_NAME>EditorModule::OnSpawnPluginTab(const FSpawnTabArgs& SpawnTabArgs) {
    return SNew(SDockTab)
        .TabRole(ETabRole::NomadTab)
        [
            SNew(S<PLUGIN_NAME>EditorWidget)
        ];
}

#undef LOCTEXT_NAMESPACE
	
IMPLEMENT_MODULE(F<PLUGIN_NAME>EditorModule, <PLUGIN_NAME>Editor)
