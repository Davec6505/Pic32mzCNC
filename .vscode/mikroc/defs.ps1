param(
    [string]$Path = "C:\Users\Public\Documents\Mikroelektronika\mikroC PRO for PIC32",
    [string]$File = "P32MZ2048EFH100",
    [string]$OutPath = ".vscode\mikroc",
    [string]$OutFile = "pic32mz_defs.h"
)

$null = [System.IO.Directory]::CreateDirectory($OutPath)

$SourceFile = Join-Path $Path "Defs\$File.cp"
$OutputFile = Join-Path $OutPath $OutFile

$Defs = New-Object System.Collections.Generic.HashSet[string]

$VectorCount = 0
$RegisterCount = 0
$SbitCount = 0


@"
#pragma once

/*
 * AUTO GENERATED
 * Source: $File.cp
 * Do not edit manually.
 */

#ifdef __INTELLISENSE__

"@ | Set-Content $OutputFile

Get-Content $SourceFile | ForEach-Object {

    $Line = $_.Trim()

    #
    # const unsigned int IVT_UART2_RX = 0x0092;
    #
    if ($Line -match '^const\s+unsigned\s+int\s+(\w+)\s*=\s*(0x[0-9A-Fa-f]+)')
    {
        $Def = "#define $($Matches[1]) $($Matches[2])"

        if ($Defs.Add($Def))
        {
            Add-Content $OutputFile $Def
            $VectorCount++
        }

        return
    }

    #
    # const register unsigned short int UARTEN = 15;
    #
    if ($Line -match '^const\s+register\s+unsigned\s+short\s+int\s+(\w+)\s*=\s*(\d+)')
    {
        $Def = "#define $($Matches[1]) $($Matches[2])"

        if ($Defs.Add($Def))
        {
            Add-Content $OutputFile $Def
            $RegisterCount++
        }

        return
    }

    #
    # sbit UARTEN_bit at U1MODE.B15;
    #
    if ($Line -match '^sbit\s+(\w+)\s+at\s+')
    {
        $Def = "extern volatile unsigned int $($Matches[1]);"

        if ($Defs.Add($Def))
        {
            Add-Content $OutputFile $Def
            $SbitCount++
        }

        return
    }
}

@"

#endif

"@ | Add-Content $OutputFile

Write-Host ""
Write-Host "Generated $OutputFile"
Write-Host "Vectors   : $VectorCount"
Write-Host "Registers : $RegisterCount"
Write-Host "SBits     : $SbitCount"
Write-Host "Total     : $($Defs.Count)"
