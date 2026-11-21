param(
 [string]$path = "C:\Users\Public\Documents\Mikroelektronika\mikroC PRO for PIC32\Uses"
 )
 
$path = [System.IO.Path]::Combine($path,"__Lib_CType.emcl")


$bytes = [System.IO.File]::ReadAllBytes($path)
$content = [System.Text.ASCIIEncoding]::ASCII.GetString($bytes) 



$Matches = [regex]::Matches(
    $Content,
    '_([A-Za-z_][A-Za-z0-9_]*)'
)

$Matches |
    ForEach-Object {$_.Groups[1].Value} |
    Where-Object {$_.Length -ge 2} |
    Sort-Object -Unique

