function Test-IsHTMLColorCode {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $colorCode
    )

    # Define the regular expression pattern for HTML hex color code
    $pattern = '^#([A-Fa-f0-9]{3}){1,2}$'

    # Check if the color code matches the pattern
    $isMatch = $colorCode -match $pattern

    return $isMatch

}