// Copyright <PLUGIN_AUTHOR> - <YEAR>. All Rights Reserved.

using UnrealBuildTool;

public class <PLUGIN_NAME>Editor : ModuleRules
{
    public <PLUGIN_NAME>Editor(ReadOnlyTargetRules Target) : base(Target)
    {
        PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;
    
        PrivateDependencyModuleNames.AddRange(new string[] {
            "Core",
            "CoreUObject",
            "Engine",
            "Slate",
            "SlateCore",
            "InputCore",
            "EditorStyle",
            "UnrealEd",
            "LevelEditor",
            "ToolMenus",
            "<PLUGIN_NAME>",
            "PropertyEditor"
        });
    }
}
