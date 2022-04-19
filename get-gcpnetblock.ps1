function Get-GcpNetBlock{
[CmdletBinding()]
param ()
$gcpNetBlockList = @()
$gcpNetBlockList = (Resolve-DnsName _cloud-netblocks.googleusercontent.com -type TXT).strings | 
    ForEach-Object{$_ -split '\s'} | 
    Where-Object{$_ -match 'Include'} | 
    ForEach-Object{$_ -replace 'include:'} | 
    ForEach{(Resolve-DnsName $_ -type TXT).strings} |
    ForEach-Object{$_ -split '\s'} | 
    Where-Object{$_ -match 'ip4'} | 
    ForEach-Object{$_ -replace 'ip4:'}
return $gcpNetBlockList
}
