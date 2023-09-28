function Format-FileSizeBytesToAuto {
    [CmdletBinding(DefaultParameterSetName = 'AutoSuffixes')]
    param (

        [Parameter(Mandatory,Position=0,ParameterSetName='AutoSuffixes')]
        [Parameter(Mandatory,Position=0,ParameterSetName='OverrideIndividualSuffixes')]
        [ValidateNotNullOrEmpty()]
        [Alias("b")]
        [float]
        $Bytes,

        [Parameter(Mandatory=$false,ParameterSetName='AutoSuffixes')]
        [Alias("ls")]
        [Switch]
        $LongSuffixes,

        [Parameter(Mandatory=$false,ParameterSetName='AutoSuffixes')]
        [Alias("ss")]
        [Switch]
        $ShortSuffixes,


        [Parameter(Mandatory=$false,ParameterSetName='OverrideIndividualSuffixes')]
        [System.String]
        $OverrideBytesSuffix = $null,


        [Parameter(Mandatory=$false,ParameterSetName='OverrideIndividualSuffixes')]
        [System.String]
        $OverrideKilobytesSuffix = $null,


        [Parameter(Mandatory=$false,ParameterSetName='OverrideIndividualSuffixes')]
        [System.String]
        $OverrideMegabytesSuffix = $null,


        [Parameter(Mandatory=$false,ParameterSetName='OverrideIndividualSuffixes')]
        [System.String]
        $OverrideGigabytesSuffix = $null,


        [Parameter(Mandatory=$false,ParameterSetName='OverrideIndividualSuffixes')]
        [System.String]
        $OverrideTerrabytesSuffix = $null,


        [Parameter(Mandatory=$false,ParameterSetName='OverrideIndividualSuffixes')]
        [System.String]
        $OverridePetabytesSuffix = $null,


        [Parameter(Mandatory=$false,ParameterSetName='OverrideIndividualSuffixes')]
        [System.String]
        $OverrideExabytesSuffix = $null,


        [Parameter(Mandatory=$false,ParameterSetName='OverrideIndividualSuffixes')]
        [System.String]
        $OverrideZettabytesSuffix = $null,


        [Parameter(Mandatory=$false,ParameterSetName='OverrideIndividualSuffixes')]
        [System.String]
        $OverrideYottabytesSuffix = $null,

        [Parameter(Mandatory=$false,ParameterSetName='AutoSuffixes')]
        [Parameter(Mandatory=$false,ParameterSetName='OverrideIndividualSuffixes')]
        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [Alias("d")]
        [int]
        $DecmialPlaces = 2
    )

    if(([String]::IsNullOrEmpty($Bytes)) -or [String]::IsNullOrWhiteSpace($Bytes)){
        throw "The value passed to the bytes parameter is either null or empty. Please re-check your script."
    }

    $Base = 1024  # Base2: 1024, Base10: 1000
    $Unit = [math]::floor( [math]::log($Bytes) / [math]::log($Base) )
    $Bytes = $Bytes / [math]::pow($Base, $Unit)

    [System.Array]$LSuffixes = ("Bytes", "Kilobytes", "Megabytes", "Gigabytes", "Terrabytes", "Petabytes", "Exabytes", "Zettabytes", "Yottabytes")
    [System.Array]$SSuffixes = ("B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB")
    [System.Array]$SuffixesToUse = $SSuffixes

    switch ($PsCmdlet.ParameterSetName) {
        "AutoSuffixes" {
            if($LongSuffixes){
                [System.Array]$SuffixesToUse = $LSuffixes
            }else{
                [System.Array]$SuffixesToUse = $SSuffixes
            }
        }

        "OverrideIndividualSuffixes" {
            $StartingSuffixes = $SSuffixes
            if(-not([String]::IsNullOrWhiteSpace($OverrideBytesSuffix)))      { $StartingSuffixes[0] = $OverrideBytesSuffix      }
            if(-not([String]::IsNullOrWhiteSpace($OverrideKilobytesSuffix)))  { $StartingSuffixes[1] = $OverrideKilobytesSuffix  }
            if(-not([String]::IsNullOrWhiteSpace($OverrideMegabytesSuffix)))  { $StartingSuffixes[2] = $OverrideMegabytesSuffix  }
            if(-not([String]::IsNullOrWhiteSpace($OverrideGigabytesSuffix)))  { $StartingSuffixes[3] = $OverrideGigabytesSuffix  }
            if(-not([String]::IsNullOrWhiteSpace($OverrideTerrabytesSuffix))) { $StartingSuffixes[4] = $OverrideTerrabytesSuffix }
            if(-not([String]::IsNullOrWhiteSpace($OverridePetabytesSuffix)))  { $StartingSuffixes[5] = $OverridePetabytesSuffix  }
            if(-not([String]::IsNullOrWhiteSpace($OverrideExabytesSuffix)))   { $StartingSuffixes[6] = $OverrideExabytesSuffix   }
            if(-not([String]::IsNullOrWhiteSpace($OverrideZettabytesSuffix))) { $StartingSuffixes[7] = $OverrideZettabytesSuffix }
            if(-not([String]::IsNullOrWhiteSpace($OverrideYottabytesSuffix))) { $StartingSuffixes[8] = $OverrideYottabytesSuffix }
            $SuffixesToUse = $StartingSuffixes
        }
    }

    "{0:N$DecmialPlaces} {1}" -f $Bytes, $SuffixesToUse[$Unit]
}

Format-FileSizeBytesToAuto -Bytes 12314135