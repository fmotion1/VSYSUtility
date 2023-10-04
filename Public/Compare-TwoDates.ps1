function Compare-TwoDates {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0)]
        [DateTime]
        $StartDate,

        [Parameter(Mandatory,Position=1)]
        [DateTime]
        $EndDate
    )

    $Duration = New-TimeSpan -Start $StartDate -End $EndDate

    $Day = switch ($Duration.Days) {
        0 { $null; break }
        1 { "{0} Day" -f $Duration.Days; break }
        Default {"{0} Days" -f $Duration.Days}
    }

    $Hour = switch ($Duration.Hours) {
        #0 { $null; break }
        1 { "{0} Hour" -f $Duration.Hours; break }
        Default { "{0} Hours" -f $Duration.Hours }
    }

    $Minute = switch ($Duration.Minutes) {
        #0 { $null; break }
        1 { "{0} Minute" -f $Duration.Minutes; break }
        Default { "{0} Minutes" -f $Duration.Minutes }
    }

    $Second = switch ($Duration.Seconds) {
        #0 { $null; break }
        1 { "{0} Second" -f $Duration.Seconds; break }
        Default { "{0} Seconds" -f $Duration.Seconds }
    }

    $Millisecond = switch ($Duration.Milliseconds) {
        #0 { $null; break }
        1 { "{0} Millisecond" -f $Duration.Milliseconds; break }
        Default { "{0} Milliseconds" -f $Duration.Milliseconds }
    }

    [PSCustomObject][ordered]@{
        Days                = $Duration.Days
        Hours               = $Duration.Hours
        Minutes             = $Duration.Minutes
        Seconds             = $Duration.Seconds
        Milliseconds        = $Duration.Milliseconds
        TotalDays           = $Duration.TotalDays
        TotalHours          = $Duration.TotalHours
        TotalMinutes        = $Duration.TotalMinutes
        TotalSeconds        = $Duration.TotalSeconds
        TotalMilliseconds   = $Duration.TotalMilliseconds
        FormattedDifference = "$Day, $Hour, $Minute, $Second, $Millisecond"
    }
}