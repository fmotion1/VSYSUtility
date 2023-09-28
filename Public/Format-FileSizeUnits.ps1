function Format-FileSizeUnits {
    [cmdletbinding()]
    param(

        [Parameter(Mandatory, Position = 0)]
        [double]
        $Value,

        [Parameter(Mandatory, Position = 1)]
        [validateset("Bytes", "KB", "MB", "GB", "TB", IgnoreCase = $true)]
        [string]
        $From,

        [Parameter(Mandatory, Position = 2)]
        [validateset("Bytes", "KB", "MB", "GB", "TB", IgnoreCase = $true)]
        [string]
        $To,

        [Parameter(Mandatory=$false)]
        [int]
        $Precision = 4,

        [Parameter(Mandatory=$false)]
        [Switch]
        $DisplayLabel
    )

    switch ($From) {
        "Bytes" { $Value = $Value }
        "KB" { $Value = $Value * 1024 }
        "MB" { $Value = $Value * 1024 * 1024 }
        "GB" { $Value = $Value * 1024 * 1024 * 1024 }
        "TB" { $Value = $Value * 1024 * 1024 * 1024 * 1024 }
    }

    switch ($To) {
        "Bytes" { $Value = $Value }
        "KB" { $Value = $Value / 1KB }
        "MB" { $Value = $Value / 1MB }
        "GB" { $Value = $Value / 1GB }
        "TB" { $Value = $Value / 1TB }
    }

    if(!$DisplayLabel){
        [Math]::Round($Value, $Precision, [MidPointRounding]::AwayFromZero)
    }else{
        ([Math]::Round($Value, $Precision, [MidPointRounding]::AwayFromZero)).ToString() + " $To"
    }
}