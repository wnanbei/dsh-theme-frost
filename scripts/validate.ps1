[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$tool = Join-Path $root '.tooling/dsh-skins/scripts/dsh-skin.cjs'
$skin = Join-Path $root 'skins/frost'

if (-not (Test-Path -LiteralPath $tool -PathType Leaf)) {
    throw 'Local dsh-skin tooling is not installed. Run scripts/setup.ps1 first.'
}

& node $tool validate $skin
exit $LASTEXITCODE
