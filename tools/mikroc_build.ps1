. "$PSScriptRoot\mikroc_codes.ps1"

$CompileTime = ""
$LinkTime = ""
$TotalTime = ""

$BuildFailed = $false
$WarningCount = 0
$WarningTypeCount = @{}
$ErrorCount = 0
$WarningList = @()
$ErrorList = @()


$input | ForEach-Object {

    $line = $_

    if($line -match '^(\d+)\s+(\d+)\s+(.*?)\s+(.*)$')
    {
        $code = [int]$matches[1]
        

        if($line -match 'All files Compiled in (\d+) ms')
        {
            $CompileTime = $matches[1]
        }

        if($line -match 'Linked in (\d+) ms')
        {
            $LinkTime = $matches[1]
        }

        if($line -match "completed: (\d+) ms")
        {
            $TotalTime = $matches[1]
        }

        if($FatalErrors -contains $code)
        {
            $BuildFailed = $true
            $ErrorCount++
            $ErrorList += $line
        }
        elseif(
            (
                $null -ne $WarningPatterns -and
                $WarningPatterns.ContainsKey($code) -and
                $line -match $WarningPatterns[$code]
            ) -or
            (
                $Colours.ContainsKey($code) -and
                $Colours[$code] -eq 'Yellow'
            )
        )      
        {
            $WarningCount++
            $WarningList += $line

            if($WarningTypeCount.ContainsKey($code))
            {
                $WarningTypeCount[$code]++
            }
            else
            {
                $WarningTypeCount[$code] = 1
            }
        }

        if($Colours.ContainsKey($code))
        {
            Write-Host $line -ForegroundColor $Colours[$code]
        }
        else
        {
            Write-Host $line -ForegroundColor White
        }
    }
    else
    {
        Write-Host $line
    }
}

if($BuildFailed)
{
    Write-Host ""
    Write-Host "*** BUILD FAILED ***" -ForegroundColor DarkRed
    exit 1
}

Write-Host ""
Write-Host "=============================================" -ForegroundColor White
Write-Host "Build Summary" -ForegroundColor White
Write-Host "=============================================" -ForegroundColor White

Write-Host ("Errors   : {0}" -f $ErrorCount) -ForegroundColor DarkRed
Write-Host ("Warnings : {0}" -f $WarningCount) -ForegroundColor Yellow

Write-Host ""
Write-Host ("Compile Time : {0} ms" -f $CompileTime) -ForegroundColor Cyan
Write-Host ("Link Time    : {0} ms" -f $LinkTime) -ForegroundColor Cyan
Write-Host ("Total Time   : {0} ms" -f $TotalTime) -ForegroundColor Cyan


if($WarningTypeCount.Count -gt 0)
{
    Write-Host ""
    Write-Host "Warning Types:" -ForegroundColor Yellow
    Write-Host "---------------------------------------------" -ForegroundColor Yellow

    foreach($entry in ($WarningTypeCount.GetEnumerator() | Sort-Object Name))
    {
        $code = [int]$entry.Key
        $count = $entry.Value

        if($code -eq 1004)
        {
            $description = "Stack overflow / recursion"
        }
        else
        {
            $description = $Descriptions[$code]
        }

        Write-Host (
            "{0,-5} {1,-30} ({2})" -f `
            $code,
            $description,
            $count
        ) -ForegroundColor Yellow
    }
}

if($ErrorCount -gt 0)
{
    Write-Host ""
    Write-Host "Errors:" -ForegroundColor DarkRed

    $ErrorList | Sort-Object -Unique | ForEach-Object {
        Write-Host "  $_" -ForegroundColor DarkRed
    }
}

if($WarningCount -gt 0)
{
    Write-Host ""
    Write-Host "Warnings:" -ForegroundColor Yellow

    $WarningList | Sort-Object -Unique | ForEach-Object {

        if($_ -match '^(\d+)\s+(\d+)\s+(.*?)\s+(.*)$')
        {
            $code = $matches[1]
            $line = $matches[2]
            $file = $matches[3]
            $msg  = $matches[4]

            if($file -eq "File")
            {
                Write-Host "BUILD: warning $($code): $($msg)" -ForegroundColor Yellow
            }
            else
            {
                Write-Host "$($file):$($line): warning $($code): $($msg)" -ForegroundColor Yellow
            }
        }
        else
        {
            Write-Host $_ -ForegroundColor Yellow
        }
    }
}

Write-Host ""

if($BuildFailed)
{
    Write-Host "*** BUILD FAILED ***" -ForegroundColor DarkRed
    exit 1
}

Write-Host "*** BUILD SUCCESSFUL ***" -ForegroundColor DarkGreen
exit 0
