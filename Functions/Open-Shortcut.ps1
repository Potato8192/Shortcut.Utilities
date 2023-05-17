function Open-Shortcut{
    [CmdletBinding()]
    [Alias('os')]
    param(
        [parameter(Mandatory=$true,Position=0)]
        [string]$Name
    )
    process{
        $FilePath = "$ShortcutsDir\$Name.url"
        Start-Process -FilePath $FilePath
    }
}