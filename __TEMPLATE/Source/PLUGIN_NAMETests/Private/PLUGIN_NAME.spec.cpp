// Copyright <PLUGIN_AUTHOR> - <YEAR>. All Rights Reserved.

#include "Misc/AutomationTest.h"
#include "Engine/World.h"
#include "Engine/GameInstance.h"
#include "Tests/AutomationCommon.h"
#include "Editor/UnrealEd/Public/Tests/AutomationEditorCommon.h"

DEFINE_SPEC(<PLUGIN_NAME>Spec, "<PLUGIN_NAME>.<PLUGIN_NAME>Object", EAutomationTestFlags::EditorContext | EAutomationTestFlags::EngineFilter)

// Add Test Subject definition
// <PLUGIN_NAME>Object* Obj = nullptr;

void <PLUGIN_NAME>Spec::Define() {
    BeforeEach([this]() {
        // Initialize Test Subject
        // Obj = NewObject<<PLUGIN_NAME>Object>(GetTransientPackage());
    });

    Describe("On Initialize", [this]() {

        It("should exist", [this]() {
            // Assert Test Subject exists
            // TestTrue("Obj exists", IsValid(Obj));
        });
    });
}