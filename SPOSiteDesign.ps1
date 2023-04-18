$Title = "Betasoft Custom Site Template"
$Description = "Site Design & Site Script for Betasoft custom site template"
$WebTemplate = "68" # 64 Team site template # 1 Team site (with group creation disabled) # 68 Communication site template # 69 Channel site template
$ThumbnailUrl = ""
$PreviewImageUrl = ""
$TenantName = "betasoft365dev"
$SiteScriptJson = ".\SiteScriptContoso.json"
$SiteScriptJsonContent = Get-Content $SiteScriptJson -Raw

Connect-SPOService -Url https://$TenantName-admin.sharepoint.com

#Creating a new Site Script & Site Design
$SiteScript = Add-SPOSiteScript -Title $Title -Description $Description -Content $SiteScriptJsonContent
Add-SPOSiteDesign `
  -Title $Title `
  -Description $Description `
  -SiteScripts $SiteScript.Id `
  -WebTemplate $WebTemplate
  -ThumbnailUrl $ThumbnailUrl `
  -PreviewImageUrl $PreviewImageUrl

#Updating an existing one
Get-SPOSiteDesign c765f79a-2bcf-4eec-923d-0b874ec57453
Set-SPOSiteDesign -Identity 00f3961a-92f8-4fd2-bef8-20b59f23b5ef `
    -ThumbnailUrl $ThumbnailUrl `
    -PreviewImageUrl $PreviewImageUrl

Get-SPOSiteScript $SiteScript.Id
Set-SPOSiteScript -Identity $SiteScript.Id -Content $SiteScriptJsonContent

