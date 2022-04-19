$gcpNetBlockList = Invoke-WebRequest 'https://www.gstatic.com/ipranges/goog.json' | ConvertFrom-Json | 
    Select-Object -ExpandProperty prefixes | 
    Where-Object{($_.ipv4prefix -ne $null)} | 
    Select-Object -ExpandProperty ipv4Prefix 

Write-Host "Total "$gcpNetBlockList.count

foreach($gcpNetBlock in $gcpNetBlockList){
    Add-AzStorageAccountNetworkRule -ResourceGroupName "dave-test" -AccountName "comleximmutabletest" -IPAddressOrRange "$gcpNetBlock"
    }
