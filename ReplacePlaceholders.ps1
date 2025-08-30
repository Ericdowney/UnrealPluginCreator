param (
    [string]$FilePath,
    [string]$PluginName,
    [string]$PluginAuthor,
    [string]$Year,
    [string]$PluginDescription,
    [string]$PluginCategory,
    [string]$PluginAuthorURL,
    [string]$PluginDocsURL,
    [string]$PluginMarketplaceURL,
    [string]$PluginSupportURL
)

$content = Get-Content $FilePath -Raw
$content = $content -replace '<PLUGIN_NAME>', $PluginName
$content = $content -replace '<PLUGIN_AUTHOR>', $PluginAuthor
$content = $content -replace '<YEAR>', $Year
$content = $content -replace '<PLUGIN_DESCRIPTION>', $PluginDescription
$content = $content -replace '<PLUGIN_CATEGORY>', $PluginCategory
$content = $content -replace '<PLUGIN_AUTHOR_URL>', $PluginAuthorURL
$content = $content -replace '<PLUGIN_DOCS_URL>', $PluginDocsURL
$content = $content -replace '<PLUGIN_MARKETPLACE_URL>', $PluginMarketplaceURL
$content = $content -replace '<PLUGIN_SUPPORT_URL>', $PluginSupportURL

Set-Content -Path $FilePath -Value $content -Encoding UTF8
