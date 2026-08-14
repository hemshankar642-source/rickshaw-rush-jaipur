param(
    [Parameter(Mandatory = $true)]
    [ValidateScript({ Test-Path $_ -PathType Leaf })]
    [string]$SourceFile,

    [string]$Message = "Update game"
)

$ErrorActionPreference = "Stop"
$RepoRoot = $PSScriptRoot
$TargetFile = Join-Path $RepoRoot "index.html"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Git is not installed or is not available in PATH."
}

git -C $RepoRoot rev-parse --is-inside-work-tree | Out-Null
Copy-Item -LiteralPath (Resolve-Path $SourceFile) -Destination $TargetFile -Force
git -C $RepoRoot add -- index.html

git -C $RepoRoot diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host "No changes found in index.html." -ForegroundColor Yellow
    exit 0
}

git -C $RepoRoot commit -m $Message
git -C $RepoRoot push origin main

Write-Host "Game update pushed successfully." -ForegroundColor Green
Write-Host "Live URL: https://hemshankar642-source.github.io/rickshaw-rush-jaipur/"
Write-Host "The Android app will load this version the next time it opens online."
