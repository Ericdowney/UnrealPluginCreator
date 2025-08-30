param (
    [string]$RootPath,
    [string]$PluginName
)

# Sort descending so files are renamed before folders
Get-ChildItem -Path $RootPath -Recurse -Force | Sort-Object FullName -Descending | ForEach-Object {
    if ($_.Name -like '*PLUGIN_NAME*') {
        $newName = $_.Name -replace 'PLUGIN_NAME', $PluginName

        if ($_.PSIsContainer) {
            # It's a directory
            $parentPath = Split-Path $_.FullName -Parent
            $newPath = Join-Path -Path $parentPath -ChildPath $newName
        } else {
            # It's a file
            $newPath = Join-Path -Path $_.DirectoryName -ChildPath $newName
        }

        Rename-Item -Path $_.FullName -NewName $newPath -Force
    }
}
