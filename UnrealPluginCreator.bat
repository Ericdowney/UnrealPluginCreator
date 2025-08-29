@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: -----------------------------
:: UnrealPluginCreator (Windows)
:: -----------------------------

:: Default variables
set "DEFAULTS=false"
set "OUTPUT_DIR="
set "TEMPLATE_DIR=__TEMPLATE"

:: -----------------------------
:: Helper: Show Help
:: -----------------------------
:show_help
echo.
echo Usage: %~nx0 --output-dir ^<directory^> [--help] [--defaults]
echo.
echo UnrealPluginCreator: Scaffold Unreal Engine plugins in seconds!
echo.
echo This tool generates a fully structured Unreal Engine plugin including:
echo - Runtime module
echo - Editor module with a Slate UI tab
echo - Automated test module
echo.
echo It also replaces template placeholders with your plugin's information and
echo renames directories and files accordingly. Perfect for quickly starting
echo new plugin projects without boilerplate setup.
echo.
echo Required inputs: PLUGIN_NAME, PLUGIN_AUTHOR, --output-dir
echo Optional inputs: Description, Category, URLs (Author, Docs, Marketplace, Support)
echo.
echo Options:
echo --output-dir ^<dir^>   Specify the directory where the plugin will be created (required)
echo --help                  Show this help message
echo --defaults              Generate plugin with minimal input (PLUGIN_NAME and PLUGIN_AUTHOR)
echo.
exit /b 0

:: -----------------------------
:: Parse Arguments
:: -----------------------------
:parse_args
:loop
if "%~1"=="" goto args_done
if /i "%~1"=="--help" (
    call :show_help
)
if /i "%~1"=="--defaults" (
    set "DEFAULTS=true"
    shift
    goto loop
)
if /i "%~1"=="--output-dir" (
    if "%~2"=="" (
        echo Error: --output-dir requires a value.
        exit /b 1
    )
    set "OUTPUT_DIR=%~2"
    shift
    shift
    goto loop
)
echo Unknown argument: %~1
call :show_help
shift
goto loop
:args_done

if "%OUTPUT_DIR%"=="" (
    echo Error: --output-dir is required.
    call :show_help
)

:: -----------------------------
:: Collect Wizard Input
:: -----------------------------
echo.
echo 🛠 Welcome to UnrealPluginCreator!
echo This wizard will scaffold your Unreal Engine plugin.
echo.

:: Required
:prompt_plugin_name
set /p PLUGIN_NAME="Plugin Name (required): "
if "%PLUGIN_NAME%"=="" goto prompt_plugin_name

:prompt_plugin_author
set /p PLUGIN_AUTHOR="Plugin Author (required): "
if "%PLUGIN_AUTHOR%"=="" goto prompt_plugin_author

:: Optional
if "%DEFAULTS%"=="false" (
    set /p PLUGIN_DESCRIPTION="Plugin Description: "
    set /p PLUGIN_CATEGORY="Plugin Category: "
    set /p PLUGIN_AUTHOR_URL="Plugin Author URL: "
    set /p PLUGIN_DOCS_URL="Plugin Docs URL: "
    set /p PLUGIN_MARKETPLACE_URL="Plugin Marketplace URL: "
    set /p PLUGIN_SUPPORT_URL="Plugin Support URL: "
) else (
    set "PLUGIN_DESCRIPTION="
    set "PLUGIN_CATEGORY="
    set "PLUGIN_AUTHOR_URL="
    set "PLUGIN_DOCS_URL="
    set "PLUGIN_MARKETPLACE_URL="
    set "PLUGIN_SUPPORT_URL="
)

:: Year
for /f "tokens=2 delims==" %%y in ('wmic os get LocalDateTime /value ^| find "="') do set "CURRENT_DATE=%%y"
set "YEAR=%CURRENT_DATE:~0,4%"

:: Destination
set "DEST_DIR=%OUTPUT_DIR%\%PLUGIN_NAME%"

:: -----------------------------
:: Copy Template
:: -----------------------------
xcopy "%TEMPLATE_DIR%" "%DEST_DIR%" /E /I /Y >nul

:: -----------------------------
:: Replace placeholders using PowerShell
:: -----------------------------
for /R "%DEST_DIR%" %%F in (*) do (
    powershell -Command "(gc '%%F') -replace '<PLUGIN_NAME>', '%PLUGIN_NAME%' `
                            -replace '<PLUGIN_AUTHOR>', '%PLUGIN_AUTHOR%' `
                            -replace '<YEAR>', '%YEAR%' `
                            -replace '<PLUGIN_DESCRIPTION>', '%PLUGIN_DESCRIPTION%' `
                            -replace '<PLUGIN_CATEGORY>', '%PLUGIN_CATEGORY%' `
                            -replace '<PLUGIN_AUTHOR_URL>', '%PLUGIN_AUTHOR_URL%' `
                            -replace '<PLUGIN_DOCS_URL>', '%PLUGIN_DOCS_URL%' `
                            -replace '<PLUGIN_MARKETPLACE_URL>', '%PLUGIN_MARKETPLACE_URL%' `
                            -replace '<PLUGIN_SUPPORT_URL>', '%PLUGIN_SUPPORT_URL%' | Out-File -Encoding UTF8 '%%F'"
)

:: -----------------------------
:: Rename files and directories containing PLUGIN_NAME
:: -----------------------------
:: Using PowerShell for safer renaming
powershell -Command "
Get-ChildItem -Path '%DEST_DIR%' -Recurse -Depth 5 -Force | Sort-Object FullName -Descending | ForEach-Object {
    if ($_.Name -like '*PLUGIN_NAME*') {
        $newName = $_.FullName -replace 'PLUGIN_NAME', '%PLUGIN_NAME%'
        Rename-Item -Path $_.FullName -NewName $newName -Force
    }
}
"

echo.
echo ✅ Plugin '%PLUGIN_NAME%' created successfully in %DEST_DIR%
echo You can now open it in Unreal Engine!
