function Convert-HtmlColorToRgb {
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$HtmlColorCode
    )

    # Remove the '#' symbol from the HTML color code
    $colorCode = $HtmlColorCode.TrimStart('#')

    # Extract individual color components
    $red = [Convert]::ToInt32($colorCode.Substring(0, 2), 16)
    $green = [Convert]::ToInt32($colorCode.Substring(2, 2), 16)
    $blue = [Convert]::ToInt32($colorCode.Substring(4, 2), 16)

    # Return the RGB values as a formatted string

    $colorObj = [PSCustomObject]@{
        Red   = $red
        Green = $green
        Blue  = $blue
    }

    return $colorObj
}