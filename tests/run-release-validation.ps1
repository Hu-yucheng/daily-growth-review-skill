param(
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$failures = [System.Collections.Generic.List[string]]::new()

function Resolve-RepoPath([string]$RelativePath) {
    Join-Path $RepositoryRoot $RelativePath
}

function Require-File([string]$RelativePath) {
    if (-not (Test-Path -LiteralPath (Resolve-RepoPath $RelativePath) -PathType Leaf)) {
        $failures.Add("missing-file:$RelativePath")
    }
}

function Require-Png([string]$RelativePath) {
    $path = Resolve-RepoPath $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        $failures.Add("missing-file:$RelativePath")
        return
    }

    Add-Type -AssemblyName System.Drawing
    $image = [System.Drawing.Image]::FromFile($path)
    try {
        if ($image.RawFormat.Guid -ne [System.Drawing.Imaging.ImageFormat]::Png.Guid) {
            $failures.Add("not-png:$RelativePath")
        }
        if ($image.Width -notin @(1671, 1672) -or $image.Height -ne 941) {
            $failures.Add("unexpected-dimensions:${RelativePath}:$($image.Width)x$($image.Height)")
        }
    }
    finally {
        $image.Dispose()
    }
}

function Require-Text([string]$RelativePath, [string[]]$Patterns) {
    $path = Resolve-RepoPath $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        $failures.Add("missing-file:$RelativePath")
        return
    }
    $content = Get-Content -LiteralPath $path -Raw -Encoding UTF8
    foreach ($pattern in $Patterns) {
        if ($content -notmatch $pattern) {
            $failures.Add("missing-text:${RelativePath}:${pattern}")
        }
    }
}

function Require-LocalMarkdownLinks([string]$RelativePath) {
    $path = Resolve-RepoPath $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { return }
    $content = Get-Content -LiteralPath $path -Raw -Encoding UTF8
    $matches = [regex]::Matches($content, '!?(?:\[[^\]]*\])\((?<target>[^)]+)\)')
    foreach ($match in $matches) {
        $target = $match.Groups['target'].Value.Trim()
        if ($target -match '^(?:https?:|mailto:|#)') { continue }
        $target = [uri]::UnescapeDataString(($target -split '#')[0])
        if ([string]::IsNullOrWhiteSpace($target)) { continue }
        $resolved = Join-Path (Split-Path -Parent $path) $target
        if (-not (Test-Path -LiteralPath $resolved)) {
            $failures.Add("broken-link:${RelativePath}:${target}")
        }
    }
}

$slugs = @(
    '01-overview',
    '02-adaptive-context',
    '03-evidence-progress',
    '04-verified-completion',
    '05-capture-recall-action'
)

foreach ($slug in $slugs) {
    Require-Png "assets/v2/zh/$slug.png"
    Require-Png "assets/v2/en/$slug.png"
}

Require-File 'README.zh-CN.md'
Require-File 'docs/version-history.md'

Require-Text 'README.md' @(
    'README\.zh-CN\.md',
    'assets/v2/en/01-overview\.png',
    'assets/v2/en/02-adaptive-context\.png',
    'assets/v2/en/03-evidence-progress\.png',
    'assets/v2/en/04-verified-completion\.png',
    'assets/v2/en/05-capture-recall-action\.png',
    'docs/version-history\.md'
)

Require-Text 'README.zh-CN.md' @(
    'README\.md',
    'assets/v2/zh/01-overview\.png',
    'assets/v2/zh/02-adaptive-context\.png',
    'assets/v2/zh/03-evidence-progress\.png',
    'assets/v2/zh/04-verified-completion\.png',
    'assets/v2/zh/05-capture-recall-action\.png',
    'docs/version-history\.md'
)

Require-Text 'docs/version-history.md' @(
    'v1\.0\.0',
    'ffb70e7',
    'v2\.0\.0'
)

Require-LocalMarkdownLinks 'README.md'
Require-LocalMarkdownLinks 'README.zh-CN.md'
Require-LocalMarkdownLinks 'docs/version-history.md'

if ($failures.Count -gt 0) {
    Write-Host "RELEASE_VALIDATION_FAILED count=$($failures.Count)"
    $failures | Sort-Object -Unique | ForEach-Object { Write-Host $_ }
    exit 1
}

Write-Host 'RELEASE_VALIDATION_OK'
exit 0
