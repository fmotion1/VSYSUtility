function ConvertTo-HtmlEncode {
<#
.SYNOPSIS
    To encode plaintext using [Web.HttpUtility]::HtmlEncode()
.DESCRIPTION
    To encode plaintext using [Web.HttpUtility]::HtmlEncode()
.PARAMETER Text
    The original text that you want encoded. Can be a string or an array of strings. Accepts pipeline input.
.PARAMETER IncludeInput
    A switch to determine if you want original text in the output.
.EXAMPLE
    ConvertTo-HtmlEncode -Text '<This is text & goodbye>' -IncludeInput

    PlainText                   HtmlEncoded
    ---------                   -----------
    <This is text & goodbye>;   This is text &amp; goodbye&gt;

.NOTES
    Inspired by: https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/html-encoding
#>

    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)]
        [string[]] $Text,

        [switch] $IncludeInput
    )

    begin {
        Write-Verbose -Message "Starting [$($MyInvocation.Mycommand)]"
    }

    process {
        foreach ($currentText in $Text) {
            $Encode = [Web.HttpUtility]::HTMLEncode($currentText)
            if ($IncludeInput) {
                New-Object -TypeName 'psobject' -Property ([ordered] @{
                        PlainText = $currentText
                        HtmlEncoded   = $Encode
                    })
            } else {
                Write-Output -InputObject $Encode
            }
        }
    }

    end {
        Write-Verbose -Message "Ending [$($MyInvocation.Mycommand)]"
    }
}


