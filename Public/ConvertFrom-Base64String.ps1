function ConvertFrom-Base64String {
<#
.SYNOPSIS
    Convert from a Base64 string to normal string
.DESCRIPTION
    Convert from a Base64 string to normal string. Function aliased to 'Base64Decode'.
.PARAMETER Base64
    A base64 encoded string
.PARAMETER IncludeInput
    Switch to enable including the input to appear in the output
.EXAMPLE
    ConvertFrom-Base64String "SABlAGwAbABvAA=="

    Would return
    Hello
.EXAMPLE
    ConvertFrom-Base64String "SABlAGwAbABvAA==" -IncludeInput

    Would return
    Base64           String
    ------           ------
    SABlAGwAbABvAA== Hello
.OUTPUTS
    [string[]]
#>

    #region Parameter
    [CmdletBinding(ConfirmImpact='None')]
    [alias('Base64Decode')]
    Param(
        [Parameter(Position = 0, Mandatory, ValueFromPipeLine)]
        [string[]] $Base64,

        [switch] $IncludeInput
    )
    #endregion Parameter

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    } #close begin block

    process {
        foreach ($curBase64 in $Base64) {
            $bytesfrom = [Convert]::FromBase64String($curBase64)
            $decodedfrom = [Text.Encoding]::Unicode.GetString($bytesfrom)
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                    Base64 = $curBase64
                    String = $decodedfrom
                })
            } else {
                Write-Output -InputObject $decodedfrom
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }

}
