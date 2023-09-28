function Format-TitleCase {
    [cmdletbinding()]
    [OutputType('string')]
    param (
        [parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string[]]
        $String,

        [switch]
        $ToLowerFirst,

        [switch]
        $IncludeInput
    )

    begin {
        $TI = (Get-Culture).TextInfo
    }

    process {
        foreach ($curString in $String) {
            if ($ToLowerFirst) {
                $ReturnString = $TI.ToTitleCase($curString.ToLower())
            } else {
                $ReturnString = $TI.ToTitleCase($curString)
            }
            if ($IncludeInput) {
                New-Object -TypeName psobject -Property ([ordered] @{
                    Original     = $curString
                    ToLowerFirst = $ToLowerFirst
                    TitleCase    = $ReturnString
                })
            } else {
                Write-Output -InputObject $ReturnString
            }
        }
    }

    end {
    }
}
