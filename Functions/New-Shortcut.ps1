function New-Shortcut{
    [CmdletBinding()]
    param(
        [parameter(Mandatory=$true,Position=0)]
        [string]$BaseName,
        [parameter(Mandatory=$true,Position=1)]
        [string]$Url
    )
    process{
        $ShortcutShell = New-Object -ComObject WScript.Shell
        $FullName = "$ShortcutsDir\$BaseName.url"
        $Shortcut = $ShortcutShell.CreateShortcut($FullName)
        $Shortcut.TargetPath = $Url
        $Shortcut.Save()
        return $Shortcut
    }
}