function Invoke-Admin {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [String]$ScriptPath
    )
    
    if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::
        GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator'))
    {
        Start-Process -FilePath pwsh.exe -Args "-File `"$ScriptPath`"" -Verb RunAs
        exit
    }
}