// Copyright <PLUGIN_AUTHOR> - <YEAR>. All Rights Reserved.

#pragma once

#include "CoreMinimal.h"
#include "Widgets/SCompoundWidget.h"
#include "Widgets/Input/SComboButton.h"
#include "Widgets/SBoxPanel.h"
#include "Widgets/Views/SListView.h"
#include "Widgets/Views/STableRow.h"
#include "Widgets/Input/SButton.h"
#include "Widgets/Text/STextBlock.h"
#include "Widgets/Layout/SBox.h"
#include "Widgets/Layout/SScrollBox.h"

class UWorld;
class F<PLUGIN_NAME>EditorItem;

class S<PLUGIN_NAME>EditorWidget : public SCompoundWidget
{
public:
    SLATE_BEGIN_ARGS(S<PLUGIN_NAME>EditorWidget) {}
    SLATE_END_ARGS()

    void Construct(const FArguments& InArgs);

private:
    FString SearchText;
    bool bAutoRefresh = false;

    FText GetSearchText() const;
    void OnSearchTextChanged(const FText& InText);

    UWorld* GetGameWorld();
};
