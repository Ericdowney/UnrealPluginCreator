// Copyright <PLUGIN_AUTHOR> - <YEAR>. All Rights Reserved.

#include "<PLUGIN_NAME>EditorWidget.h"

#include "Logging/LogMacros.h"

// Public Functions

void S<PLUGIN_NAME>EditorWidget::Construct(const FArguments& InArgs) {
    ChildSlot
    [
        SNew(SVerticalBox)
        
        + SVerticalBox::Slot()
            .AutoHeight()
        [
            SNew(SHorizontalBox)
            
            + SHorizontalBox::Slot()
                .FillWidth(1)
            [
                SNew(SEditableTextBox)
                    .MinDesiredWidth(200)
                    .HintText(FText::FromString("Search"))
                    .Text(this, &S<PLUGIN_NAME>EditorWidget::GetSearchText)
                    .OnTextChanged(this, &S<PLUGIN_NAME>EditorWidget::OnSearchTextChanged)
            ]
        ]

        // Create <PLUGIN_NAME> UI here
    ];
}

// Protected Functions

// Private Functions

FText S<PLUGIN_NAME>EditorWidget::GetSearchText() const {
    return FText::FromString(SearchText);
}

void S<PLUGIN_NAME>EditorWidget::OnSearchTextChanged(const FText& InText) {
    SearchText = InText.ToString();
    
    // Refresh UI
}

/**
 * Loops through all available UWorld objects to find the world with a valid UGameInstance.
 * A valid UGameInstance property signifies the UWorld running the game in PIE.
 * Returns the UWorld object or nullptr.
 */
UWorld* S<PLUGIN_NAME>EditorWidget::GetGameWorld() {
    if (GEngine && GEngine->GetWorldContexts().Num() > 0) {
        auto WorldContexts = GEngine->GetWorldContexts();
        for (auto& Context : WorldContexts) {
            UWorld* World = Context.World();
            if (World && World->GetGameInstance()) {
                return World;
            }
        }
    }
    return nullptr;
}