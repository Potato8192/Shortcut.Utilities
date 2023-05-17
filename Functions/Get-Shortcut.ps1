function Get-Shortcut{
    [CmdletBinding()]
    param(
        [parameter(Mandatory=$false,Position=0)]
        [string]$Name
    )
    process{
        $Shortcuts = Get-ChildItem -Path "$ShortcutsDir" -File | ForEach-Object{
            $ShortcutShell = New-Object -ComObject WScript.Shell
            $Shortcut = $ShortcutShell.CreateShortcut($_.FullName)
            $Shortcut | Add-Member -MemberType NoteProperty -Name 'BaseName' -Value $_.BaseName
            Write-Output $Shortcut
        }
        if($Name){
            return $Shortcuts | Where-Object BaseName -eq $Name
        }else{
            return $Shortcuts
        }
    }
}