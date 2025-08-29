#!/bin/bash

# ------------------------------------------
# UnrealPluginCreator Bash Script
# ------------------------------------------

TEMPLATE_DIR="./__TEMPLATE"

# ANSI codes for styling
BOLD="\033[1m"
RESET="\033[0m"
RED="\033[0;31m"

# Function to display help
function show_help() {
    echo -e "${BOLD}Usage:${RESET} $0 --output-dir <directory> [--help] [--defaults]"
    echo ""
    echo -e "${BOLD}UnrealPluginCreator:${RESET} Scaffold Unreal Engine plugins in seconds!"
    echo ""
    echo "This tool generates a fully structured Unreal Engine plugin including:"
    echo "- Runtime module"
    echo "- Editor module with a Slate UI tab"
    echo "- Automated test module"
    echo ""
    echo "It also replaces template placeholders with your plugin's information and"
    echo "renames directories and files accordingly. Perfect for quickly starting"
    echo "new plugin projects without boilerplate setup."
    echo ""
    echo -e "${BOLD}Required inputs:${RESET} PLUGIN_NAME, PLUGIN_AUTHOR, --output-dir"
    echo -e "${BOLD}Optional inputs:${RESET} Description, Category, URLs (Author, Docs, Marketplace, Support)"
    echo ""
    echo -e "${BOLD}Options:${RESET}"
    echo "--output-dir <dir>   Specify the directory where the plugin will be created (required)"
    echo "--help               Show this help message"
    echo "--defaults           Generate plugin with minimal input (PLUGIN_NAME and PLUGIN_AUTHOR)"
    echo ""
    exit 0
}

# ---- Parse CLI arguments ----
DEFAULTS=false
OUTPUT_DIR=""

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --help)
            show_help
            ;;
        --defaults)
            DEFAULTS=true
            shift
            ;;
        --output-dir)
            if [ -n "$2" ]; then
                OUTPUT_DIR="$2"
                shift 2
            else
                echo -e "${RED}Error: --output-dir requires a value.${RESET}"
                echo ""
                exit 1
            fi
            ;;
        *)
            echo "Unknown argument: $1"
            show_help
            ;;
    esac
done

# Check required argument
if [ -z "$OUTPUT_DIR" ]; then
    echo -e "${RED}Error: --output-dir is required.${RESET}"
    echo ""
    show_help
fi

# ---- Collect Input ----
echo ""
echo "=============================="
echo ""
echo "🛠 Welcome to UnrealPluginCreator!"
echo ""
echo "=============================="
echo ""
echo "This wizard will scaffold your Unreal Engine plugin."

# Required fields
while true; do
    read -p "Plugin Name (required): " PLUGIN_NAME
    if [ -n "$PLUGIN_NAME" ]; then break; fi
    echo -e "${RED}Plugin Name is required.${RESET}"
    echo ""
done

while true; do
    read -p "Plugin Author (required): " PLUGIN_AUTHOR
    if [ -n "$PLUGIN_AUTHOR" ]; then break; fi
    echo -e "${RED}Plugin Author is required.${RESET}"
    echo ""
done

# Optional fields (skip if --defaults)
if [ "$DEFAULTS" = false ]; then
    read -p "Plugin Description: " PLUGIN_DESCRIPTION
    read -p "Plugin Category: " PLUGIN_CATEGORY
    read -p "Plugin Author URL: " PLUGIN_AUTHOR_URL
    read -p "Plugin Docs URL: " PLUGIN_DOCS_URL
    read -p "Plugin Marketplace URL: " PLUGIN_MARKETPLACE_URL
    read -p "Plugin Support URL: " PLUGIN_SUPPORT_URL
else
    PLUGIN_DESCRIPTION=""
    PLUGIN_CATEGORY=""
    PLUGIN_AUTHOR_URL=""
    PLUGIN_DOCS_URL=""
    PLUGIN_MARKETPLACE_URL=""
    PLUGIN_SUPPORT_URL=""
fi

# Year
YEAR=$(date +"%Y")

# Destination
DEST_DIR="${OUTPUT_DIR%/}/$PLUGIN_NAME"  # Ensure no trailing slash in OUTPUT_DIR

# ---- Copy Template ----
cp -R "$TEMPLATE_DIR" "$DEST_DIR"

# ---- Replace Placeholders in all files ----
function replace_placeholders() {
    local file="$1"
    LC_ALL=C sed -i "" "s|<PLUGIN_NAME>|$PLUGIN_NAME|g" "$file"
    LC_ALL=C sed -i "" "s|<PLUGIN_AUTHOR>|$PLUGIN_AUTHOR|g" "$file"
    LC_ALL=C sed -i "" "s|<YEAR>|$YEAR|g" "$file"
    LC_ALL=C sed -i "" "s|<PLUGIN_DESCRIPTION>|$PLUGIN_DESCRIPTION|g" "$file"
    LC_ALL=C sed -i "" "s|<PLUGIN_CATEGORY>|$PLUGIN_CATEGORY|g" "$file"
    LC_ALL=C sed -i "" "s|<PLUGIN_AUTHOR_URL>|$PLUGIN_AUTHOR_URL|g" "$file"
    LC_ALL=C sed -i "" "s|<PLUGIN_DOCS_URL>|$PLUGIN_DOCS_URL|g" "$file"
    LC_ALL=C sed -i "" "s|<PLUGIN_MARKETPLACE_URL>|$PLUGIN_MARKETPLACE_URL|g" "$file"
    LC_ALL=C sed -i "" "s|<PLUGIN_SUPPORT_URL>|$PLUGIN_SUPPORT_URL|g" "$file"
}

# Recursively process files
find "$DEST_DIR" -type f | while read -r file; do
    replace_placeholders "$file"
done

# ---- Rename directories and files containing PLUGIN_NAME ----
function rename_plugin_paths() {
    local base="$1"
    find "$base" -depth -name "*PLUGIN_NAME*" | while read -r path; do
        new_path=$(echo "$path" | sed "s|PLUGIN_NAME|$PLUGIN_NAME|g")
        mkdir -p "$(dirname "$new_path")"
        mv "$path" "$new_path"
    done
}

rename_plugin_paths "$DEST_DIR"

echo ""
echo "=============================="
echo ""
echo "✅ Plugin '$PLUGIN_NAME' created successfully in $DEST_DIR"
echo "You can now open it in Unreal Engine!"
echo ""
echo "=============================="
echo ""
