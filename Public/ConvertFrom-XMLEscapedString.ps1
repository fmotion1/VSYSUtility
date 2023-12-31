function ConvertFrom-XMLEscapedString {

    param (
        [Parameter(Mandatory, Position=0, ValueFromPipeline)]
        [String[]]
        $InputStrings
    )
    process {
        foreach ($String in $InputStrings) {
            $String = $String.replace('&amp;', "&")
            $String = $String.replace('&lt;', "<")
            $String = $String.replace('&gt;', ">")
            $String = $String.replace('&apos;', "'")
            $String = $String.replace('&quot;', '"')
            $String
        }
    }
    end {}
}