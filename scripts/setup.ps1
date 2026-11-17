[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$tooling = Join-Path $root '.tooling'
$checkout = Join-Path $tooling 'dsh-skins'
$cache = Join-Path $tooling '.npm-cache'

New-Item -ItemType Directory -Path $tooling -Force | Out-Null
if (-not (Test-Path -LiteralPath $checkout -PathType Container)) {
    & git clone --depth 1 https://github.com/zhu1090093659/dsh-skins.git $checkout
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

if (-not (Test-Path -LiteralPath (Join-Path $checkout 'lib/index.js') -PathType Leaf)) {
    throw 'The checkout has no prebuilt lib. Use a current dsh-skins revision with lib/index.js.'
}

# Keep npm's cache inside the gitignored tooling directory for local sandboxes.
$env:npm_config_cache = $cache
Push-Location $checkout
try {
    & npm install @deepseek-ai/schemastery lightningcss --ignore-scripts --no-save --no-package-lock --legacy-peer-deps --no-audit --no-fund
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
finally {
    Pop-Location
}

& (Join-Path $PSScriptRoot 'validate.ps1')
exit $LASTEXITCODE
