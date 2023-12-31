function Convert-Base64StringToFile
{
    [CmdletBinding()]
    [OutputType([System.IO.FileInfo])]
    param (
        [Parameter(Mandatory,ValueFromPipeline,ValueFromPipelineByPropertyName)]
        [String]
        $Base64String,
        [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
        [String]
        $FilePath,
        [Parameter(Mandatory=$false,ValueFromPipelineByPropertyName)]
        [Switch]
        $Force
    )

    if ((Test-Path -LiteralPath $FilePath) -and $Force.IsPresent -eq $false) {
        throw "$FilePath already exists! Specify -Force to Overwrite"
    }

    try {
        $ContentBytes = [Convert]::FromBase64String($Base64String)
    }
    catch{
        throw
    }

    $ContentBytes | Set-Content -LiteralPath $FilePath -AsByteStream -Force:$Force
    Get-Item -Path $FilePath
}