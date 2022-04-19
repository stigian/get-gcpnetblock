function Get-GcpNetBlock{
[CmdletBinding()]
param ()
$gcpNetBlockList = @()
$gcpNetBlockList = Invoke-WebRequest 'https://www.gstatic.com/ipranges/goog.json' | ConvertFrom-Json | 
    Select-Object -ExpandProperty prefixes | 
    Where-Object{($_.ipv4prefix -ne $null)} | 
    Select-Object -ExpandProperty ipv4Prefix 
return $gcpNetBlockList
}
