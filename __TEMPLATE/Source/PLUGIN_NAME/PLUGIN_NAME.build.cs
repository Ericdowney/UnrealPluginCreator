// Copyright <PLUGIN_AUTHOR> - <YEAR>. All Rights Reserved.

using UnrealBuildTool;

public class <PLUGIN_NAME> : ModuleRules
{
	public <PLUGIN_NAME>(ReadOnlyTargetRules Target) : base(Target)
	{
		PCHUsage = ModuleRules.PCHUsageMode.UseExplicitOrSharedPCHs;
		
		PublicDependencyModuleNames.AddRange(
			new string[]
			{
				"Core",
			});
			
		PrivateDependencyModuleNames.AddRange(
			new string[]
			{
				"CoreUObject",
				"Engine",
				"Slate",
				"SlateCore",
			});
	}
}
