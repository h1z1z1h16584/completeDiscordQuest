$PluginName = "completeDiscordQuest"
$ErrorActionPreference = "Stop"

try {
    # 1. Kill Discord
    Write-Host "Closing Discord to release file locks..." -ForegroundColor Yellow
    Stop-Process -Name "Discord" -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2

    # 2. Setup Paths
    $ScriptDir = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path -Parent $MyInvocation.MyCommand.Path }
    $VencordPath = "$env:USERPROFILE\Documents\Vencord"
    $PluginDestDir = Join-Path $VencordPath "src\userplugins\$PluginName"

    Write-Host "--- LOCAL UPDATER ---" -ForegroundColor Cyan

    if (-not (Test-Path $VencordPath)) {
        Write-Host "[ERROR] Vencord source not found at $VencordPath" -ForegroundColor Red
        exit 1
    }

    # 3. Sync Files
    Write-Host "Syncing files to: $PluginDestDir" -ForegroundColor Yellow
    if (-not (Test-Path $PluginDestDir)) { New-Item -ItemType Directory -Path $PluginDestDir -Force | Out-Null }
    
    Get-ChildItem $ScriptDir -Exclude ".git", "*.ps1", "*.bat" | Copy-Item -Destination $PluginDestDir -Recurse -Force
    Write-Host "[SUCCESS] Local files moved to Vencord." -ForegroundColor Green

    # 4. Build
    Write-Host "Building Vencord..." -ForegroundColor Gray
    Set-Location $VencordPath
    cmd /c "pnpm build"
    
    Write-Host "Build Complete!" -ForegroundColor Green
    exit 0
}
catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}