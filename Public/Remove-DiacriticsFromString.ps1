function Remove-DiacriticsFromString {
    [CmdletBinding()]
    Param (
        [ValidateNotNullOrEmpty()]
        [Alias('t')]
        [String]
        $Text,
        [System.Text.NormalizationForm]
        $NormalizationForm = "FormD"
    )

    foreach ($StringValue in $Text) {
        $Normalized = $StringValue.Normalize($NormalizationForm)
        $sb = New-Object Text.StringBuilder   
        $normalized.ToCharArray() | % { 
            if ( [Globalization.CharUnicodeInfo]::GetUnicodeCategory($_) -ne [Globalization.UnicodeCategory]::NonSpacingMark) {
                [void]$sb.Append($_)
            }
        }
        $sb.ToString()
    }
}