<#
.SYNOPSIS
    Simple function to return all variables that start with a given prefix.
#>
function Get-AllVariablesWithPrefix {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)]
        [String]
        $Prefix
    )
    $Prefix = $Prefix.ToUpper()
    Get-Variable $Prefix*
}