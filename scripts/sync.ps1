[CmdletBinding()]
param(
    [switch]$Use
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$source = Join-Path $root 'skins/frost'
$dshHome = if ($env:DSH_HOME) { $env:DSH_HOME } else { Join-Path $HOME '.dsh' }
$destination = Join-Path $dshHome 'skins/frost'

if (-not (Test-Path -LiteralPath $source -PathType Container)) {
    throw "Skin source not found: $source"
}

# Skin Center enumerates real directories; do not use a junction or symlink.
New-Item -ItemType Directory -Path $destination -Force | Out-Null
Get-ChildItem -LiteralPath $source -Recurse -File | ForEach-Object {
    $relative = $_.FullName.Substring($source.Length).TrimStart('\')
    $target = Join-Path $destination $relative
    $parent = Split-Path -Parent $target
    New-Item -ItemType Directory -Path $parent -Force | Out-Null
    Copy-Item -LiteralPath $_.FullName -Destination $target -Force
}

$sourceFiles = Get-ChildItem -LiteralPath $source -Recurse -File
$expected = @{}
foreach ($file in $sourceFiles) {
    $relative = $file.FullName.Substring($source.Length).TrimStart('')
    $expected[$relative.ToLowerInvariant()] = $true
}

# Mirror only the verified skins/frost destination. Remove stale files left by
# deleted or renamed source assets, then remove empty directories bottom-up.
Get-ChildItem -LiteralPath $destination -Recurse -File | ForEach-Object {
    $relative = $_.FullName.Substring($destination.Length).TrimStart('')
    if (-not $expected.ContainsKey($relative.ToLowerInvariant())) {
        Remove-Item -LiteralPath $_.FullName -Force
    }
}
Get-ChildItem -LiteralPath $destination -Recurse -Directory |
    Sort-Object { $_.FullName.Length } -Descending | ForEach-Object {
        if (-not (Get-ChildItem -LiteralPath $_.FullName -Force | Select-Object -First 1)) {
            Remove-Item -LiteralPath $_.FullName -Force
        }
    }

foreach ($file in $sourceFiles) {
    $relative = $file.FullName.Substring($source.Length).TrimStart('')
    $target = Join-Path $destination $relative
    $sourceHash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash
    $targetHash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    if ($sourceHash -ne $targetHash) {
        throw "Sync verification failed: $relative"
    }
}

Write-Host "Frost synced to $destination"
Write-Host 'Reload the DSH page, then select Frost in Settings > Skins.'

if ($Use) {
    $tool = Join-Path $root '.tooling/dsh-skins/scripts/dsh-skin.cjs'
    if (-not (Test-Path -LiteralPath $tool -PathType Leaf)) {
        throw 'Local dsh-skin tooling is not installed. Run scripts/setup.ps1 first.'
    }
    & node $tool use frost
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
