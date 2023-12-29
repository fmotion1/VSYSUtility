function Test-EmptyDirectory {
    [OutputType([pscustomobject])]
    [cmdletbinding(DefaultParameterSetName = 'Path')]
    param(

        [parameter(
            Mandatory,
            ParameterSetName = 'Path',
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [string]$Path,

        [parameter(
            Mandatory,
            ParameterSetName = 'LiteralPath',
            Position = 0,
            ValueFromPipelineByPropertyName
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('PSPath')]
        [string]$LiteralPath

    )

    process {

        # Resolve path(s)
        if ($PSCmdlet.ParameterSetName -eq 'Path') {
            $folder = Resolve-Path -Path $Path | Select-Object -ExpandProperty Path
        } elseif ($PSCmdlet.ParameterSetName -eq 'LiteralPath') {
            $folder = Resolve-Path -LiteralPath $LiteralPath | Select-Object -ExpandProperty Path
        }

        if (-Not(Test-Path -Path $folder -PathType Container)) {
            Write-Error "The specified path is not a directory: $folder"
            return $false
        }

        $items = Get-ChildItem -Path $folder -Force

        if($items.Count -eq 0){
            return $true
        }

        $false
    }
}