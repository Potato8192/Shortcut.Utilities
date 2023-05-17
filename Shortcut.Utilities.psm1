#Argument Completer
$scriptBlock = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    Get-ChildItem -Path "$PSScriptRoot\Shortcuts\*.url" | Where-Object { $_.BaseName -like "*$wordToComplete*" } | Select-Object -ExpandProperty BaseName
}
Register-ArgumentCompleter -CommandName Open-Shortcut -ParameterName Name -ScriptBlock $scriptBlock
Register-ArgumentCompleter -CommandName Remove-Shortcut -ParameterName Name -ScriptBlock $scriptBlock
Register-ArgumentCompleter -CommandName Get-Shortcut -ParameterName Name -ScriptBlock $scriptBlock

#Import Files/Fn
Get-ChildItem -Path $PSScriptRoot\Functions\*.ps1 | ForEach-Object { 
    #Imports the files.
    . $_.FullName
    #Imports the Function.
    Export-ModuleMember -Function $_.BaseName
}

#Import Classes
Get-ChildItem -Path $PSScriptRoot\ClassDefinitions\*.ps1 | ForEach-Object { . $_.FullName }

#Import Alias
Export-ModuleMember -Alias *

#Import Variable
$ShortcutsDir = "$PSScriptRoot\Shortcuts"
Export-ModuleMember -Variable *