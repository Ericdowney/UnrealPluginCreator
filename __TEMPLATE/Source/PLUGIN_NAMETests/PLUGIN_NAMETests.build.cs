// Copyright <PLUGIN_AUTHOR> - <YEAR>. All Rights Reserved.

using UnrealBuildTool;

public class <PLUGIN_NAME>Tests : ModuleRules
{
    public <PLUGIN_NAME>Tests(ReadOnlyTargetRules Target) : base(Target)
    {
        PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;
    
        PrivateDependencyModuleNames.AddRange(new string[] {
            "Core",
            "CoreUObject",
            "Engine",
            "<PLUGIN_NAME>",
            "AutomationTest"
        });
        
        if (Target.bBuildEditor)
        {
            PrivateDependencyModuleNames.AddRange(new string[]
            {
                "UnrealEd",
                "EditorSubsystem"
            });

            PublicIncludePaths.AddRange(new string[]
            {
                "Editor/UnrealEd/Public"
            });
        }
    }
}
