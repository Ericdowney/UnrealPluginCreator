// Copyright <PLUGIN_AUTHOR> - <YEAR>. All Rights Reserved.

#include "Misc/AutomationTest.h"
#include "Engine/World.h"
#include "Engine/GameInstance.h"
#include "Tests/AutomationCommon.h"
#include "Editor/UnrealEd/Public/Tests/AutomationEditorCommon.h"

#include "<PLUGIN_NAME>.h"

DEFINE_SPEC(<PLUGIN_NAME>Spec, "<PLUGIN_NAME>.<PLUGIN_NAME>Object", EAutomationTestFlags::EditorContext | EAutomationTestFlags::EngineFilter)

<PLUGIN_NAME>Object* Obj = nullptr;

void <PLUGIN_NAME>Spec::Define() {
    BeforeEach([this]() {
        Obj = NewObject<<PLUGIN_NAME>Object>(GetTransientPackage());
    });

    Describe("On Initialize", [this]() {

        It("should exist", [this]() {
            TestTrue("Obj exists", IsValid(Obj));
        });
    });
}