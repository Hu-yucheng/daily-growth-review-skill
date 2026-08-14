param(
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$failures = [System.Collections.Generic.List[string]]::new()

function Resolve-RepoPath([string]$RelativePath) {
    return Join-Path $RepositoryRoot $RelativePath
}

function Require-File([string]$RelativePath) {
    if (-not (Test-Path -LiteralPath (Resolve-RepoPath $RelativePath) -PathType Leaf)) {
        $failures.Add("missing-file:$RelativePath")
    }
}

function Require-Text([string]$RelativePath, [string[]]$Patterns) {
    $path = Resolve-RepoPath $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        $failures.Add("missing-file:$RelativePath")
        return
    }
    $content = Get-Content -Raw -Encoding UTF8 $path
    foreach ($pattern in $Patterns) {
        if ($content -notmatch $pattern) {
            $failures.Add("missing-text:${RelativePath}:${pattern}")
        }
    }
}

function Forbid-Text([string]$RelativePath, [string[]]$Patterns) {
    $path = Resolve-RepoPath $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        return
    }
    $content = Get-Content -Raw -Encoding UTF8 $path
    foreach ($pattern in $Patterns) {
        if ($content -match $pattern) {
            $failures.Add("forbidden-text:${RelativePath}:${pattern}")
        }
    }
}

function Require-EvenFences([string]$RelativePath) {
    $path = Resolve-RepoPath $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        return
    }
    $count = (Select-String -Path $path -Pattern '^\s*```' -Encoding UTF8).Count
    if (($count % 2) -ne 0) {
        $failures.Add("unbalanced-fences:${RelativePath}:${count}")
    }
}

function Validate-SkillFrontmatter([string]$RelativePath) {
    $path = Resolve-RepoPath $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        $failures.Add("missing-file:$RelativePath")
        return
    }

    $content = Get-Content -Raw -Encoding UTF8 $path
    $frontmatterMatch = [regex]::Match($content, '\A---\r?\n(?<body>.*?)\r?\n---(?:\r?\n|\z)', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    if (-not $frontmatterMatch.Success) {
        $failures.Add("invalid-frontmatter:$RelativePath:missing-delimiters")
        return
    }

    $fields = @{}
    foreach ($line in ($frontmatterMatch.Groups['body'].Value -split '\r?\n')) {
        if ([string]::IsNullOrWhiteSpace($line) -or $line.TrimStart().StartsWith('#')) { continue }
        $fieldMatch = [regex]::Match($line, '^(?<key>[A-Za-z0-9_-]+):\s*(?<value>.*)$')
        if (-not $fieldMatch.Success) {
            $failures.Add("invalid-frontmatter:$RelativePath:unparseable-line")
            continue
        }
        $fields[$fieldMatch.Groups['key'].Value] = $fieldMatch.Groups['value'].Value.Trim()
    }

    $allowedFields = @('name', 'description', 'license', 'allowed-tools', 'metadata', 'compatibility')
    foreach ($key in $fields.Keys) {
        if ($allowedFields -notcontains $key) {
            $failures.Add("invalid-frontmatter:$RelativePath:unexpected-field-$key")
        }
    }

    if (-not $fields.ContainsKey('name')) {
        $failures.Add("invalid-frontmatter:$RelativePath:missing-name")
    }
    else {
        $name = $fields['name']
        if ($name.Length -gt 64 -or $name -notmatch '^[a-z0-9-]+$' -or $name.StartsWith('-') -or $name.EndsWith('-') -or $name.Contains('--')) {
            $failures.Add("invalid-frontmatter:$RelativePath:bad-name")
        }
    }

    if (-not $fields.ContainsKey('description')) {
        $failures.Add("invalid-frontmatter:$RelativePath:missing-description")
    }
    else {
        $description = $fields['description']
        if ($description.Length -gt 1024 -or $description -match '[<>]') {
            $failures.Add("invalid-frontmatter:$RelativePath:bad-description")
        }
    }
}

$requiredReferences = @(
    'user-profile.md',
    'next-action-board.md',
    'scoring-and-growth.md',
    'learning-recall.md',
    'capture-inbox.md',
    'reflection-action-loop.md',
    'daily-template.md',
    'weekly-template.md',
    'yearly-template.md',
    'interview-prompts.md',
    'mentor-frameworks.md'
)

foreach ($name in $requiredReferences) {
    Require-File "daily-growth-review/references/$name"
    Require-File "claude/daily-growth-review/references/$name"
}

Validate-SkillFrontmatter 'daily-growth-review/SKILL.md'
Validate-SkillFrontmatter 'claude/daily-growth-review/SKILL.md'

Require-Text 'daily-growth-review/SKILL.md' @(
    '^---',
    'name:\s*daily-growth-review',
    'description:\s*Use when',
    'user-profile\.md',
    'next-action-board\.md',
    'scoring-and-growth\.md',
    'learning-recall\.md',
    'capture-inbox\.md',
    'baseline_missing',
    'completed.*partial.*missed.*unknown'
)

Require-Text 'daily-growth-review/references/user-profile.md' @(
    'stable',
    'current_cycle',
    'optional_context',
    'updated_at',
    'one question at a time',
    'skip',
    'delete'
)

Require-Text 'daily-growth-review/references/next-action-board.md' @(
    'primary_outcome',
    'definition_of_done',
    '3.?5',
    '100',
    'first_physical_action',
    'if_then_plan',
    'support_tasks',
    'progress_percent'
)

Require-Text 'daily-growth-review/references/scoring-and-growth.md' @(
    'evidence_score',
    'comparison_delta',
    'comparison_basis',
    'seven_day_trend',
    'baseline_missing',
    'insufficient_data'
)

Require-Text 'daily-growth-review/references/learning-recall.md' @(
    'recall_id',
    'due_dates',
    'upgrade_card',
    'before.*answer'
)

Require-Text 'daily-growth-review/references/capture-inbox.md' @(
    'capture_id',
    'captured_at',
    'raw_content',
    'confidence',
    'processed',
    'transcript|screenshots'
)

Require-Text 'daily-growth-review/references/daily-template.md' @(
    'Context Check',
    'Previous Commitment Audit',
    'Today in Evidence',
    'Comparable Growth',
    'Tomorrow Execution Board',
    'Delayed Recall Queue',
    'primary_outcome',
    'progress_percent'
)

Require-Text 'daily-growth-review/agents/openai.yaml' @(
    'display_name:',
    'short_description:',
    'default_prompt:'
)

$coreFiles = @(
    'daily-growth-review/SKILL.md',
    'daily-growth-review/agents/openai.yaml',
    'daily-growth-review/references/daily-template.md',
    'daily-growth-review/references/weekly-template.md',
    'daily-growth-review/references/yearly-template.md',
    'daily-growth-review/references/interview-prompts.md',
    'daily-growth-review/references/mentor-frameworks.md',
    'daily-growth-review/references/reflection-action-loop.md',
    'shared/core-method.md',
    'deepseek/system-prompt.md',
    'deepseek/system-prompt.txt'
)

$personalDefaults = @(
    '\u79D1\u7814\u4EA7\u51FA',
    '\u8EAB\u6750\u7BA1\u7406',
    '\u5DE5\u4F5C\u7BA1\u7406',
    '\u738B\u9633\u660E',
    '\u66FE\u56FD\u85E9',
    '\u9A6C\u65AF\u514B',
    'candidate_question_count',
    '\u4E09\u4E2A\u5019\u9009\u79D1\u5B66\u95EE\u9898'
)

foreach ($file in $coreFiles) {
    Forbid-Text $file $personalDefaults
    Require-EvenFences $file
}

Require-Text 'shared/core-method.md' @(
    'profile',
    'primary outcome',
    'evidence',
    'similar situation',
    'delayed recall',
    'connector'
)

Require-Text 'deepseek/system-prompt.md' @(
    'profile',
    'primary outcome',
    '0.?4',
    '-2.*\+2',
    'recall',
    'Inbox',
    'connector'
)

Require-Text 'README.md' @(
    'v2',
    'profile',
    'primary outcome',
    'progress',
    'recall',
    'WeChat',
    'Douyin',
    'Notion'
)

Require-Text '.gitignore' @(
    '(?m)^second-brain/$',
    '(?m)^profiles/\*\.local\.md$',
    '(?m)^private/$',
    '(?m)^\.env$',
    'connector-secrets'
)

$codexRefRoot = Resolve-RepoPath 'daily-growth-review/references'
$claudeRefRoot = Resolve-RepoPath 'claude/daily-growth-review/references'
if ((Test-Path $codexRefRoot) -and (Test-Path $claudeRefRoot)) {
    foreach ($name in $requiredReferences) {
        $codexPath = Join-Path $codexRefRoot $name
        $claudePath = Join-Path $claudeRefRoot $name
        if ((Test-Path $codexPath) -and (Test-Path $claudePath)) {
            $codexHash = (Get-FileHash -Algorithm SHA256 $codexPath).Hash
            $claudeHash = (Get-FileHash -Algorithm SHA256 $claudePath).Hash
            if ($codexHash -ne $claudeHash) {
                $failures.Add("mirror-mismatch:references/$name")
            }
        }
    }
}

if ((Test-Path (Resolve-RepoPath 'daily-growth-review/SKILL.md')) -and (Test-Path (Resolve-RepoPath 'claude/daily-growth-review/SKILL.md'))) {
    $codexSkillHash = (Get-FileHash -Algorithm SHA256 (Resolve-RepoPath 'daily-growth-review/SKILL.md')).Hash
    $claudeSkillHash = (Get-FileHash -Algorithm SHA256 (Resolve-RepoPath 'claude/daily-growth-review/SKILL.md')).Hash
    if ($codexSkillHash -ne $claudeSkillHash) {
        $failures.Add('mirror-mismatch:SKILL.md')
    }
}

$distributableRoots = @('daily-growth-review', 'claude', 'deepseek', 'shared')
foreach ($root in $distributableRoots) {
    $rootPath = Resolve-RepoPath $root
    if (-not (Test-Path $rootPath)) { continue }
    Get-ChildItem -LiteralPath $rootPath -Recurse -File | ForEach-Object {
        $content = Get-Content -Raw -Encoding UTF8 $_.FullName
        if ($content -match 'collection://[0-9a-fA-F-]{20,}') {
            $failures.Add("private-marker:$($_.FullName):notion-collection")
        }
        if ($content -match 'qyapi\.weixin\.qq\.com/cgi-bin/webhook/send\?key=[A-Za-z0-9-]{8,}') {
            $failures.Add("private-marker:$($_.FullName):wecom-webhook")
        }
        if ($content -match '(?i)(access[_-]?token|secret)\s*[:=]\s*[A-Za-z0-9._-]{16,}') {
            $failures.Add("private-marker:$($_.FullName):credential")
        }
    }
}

Push-Location $RepositoryRoot
try {
    $trackedPrivate = @(git ls-files -- 'second-brain' 'profiles/*.local.md' 'private' '.env' '.env.*')
    if ($trackedPrivate.Count -gt 0) {
        $failures.Add("tracked-private:$($trackedPrivate -join ',')")
    }
}
finally {
    Pop-Location
}

if ($failures.Count -gt 0) {
    Write-Host "V2_VALIDATION_FAILED count=$($failures.Count)"
    $failures | Sort-Object -Unique | ForEach-Object { Write-Host $_ }
    exit 1
}

Write-Host 'V2_VALIDATION_OK'
exit 0
