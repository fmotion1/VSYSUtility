function Expand-Properties {
    [Cmdletbinding()]
    param(
        [Parameter(ValueFromPipeline)]
        $InputObject,
        [Parameter()]
        [Alias('All')]
        [switch]
        $ExpandAll,
        [Parameter()]
        [switch]
        $SortHeaders
    )

    begin {
        $collection = [System.Collections.ArrayList]::new()
        $properties = [System.Collections.ArrayList]::new()
    }

    process {
        [void]$collection.Add($InputObject)
        $properties.AddRange((($InputObject.PSObject.Properties).Name))
    }

    end {
        if ($SortHeaders) {
            $properties = $properties | Sort-Object -Unique
        } else {
            $properties = $properties | Select-Object -Unique
        }
        if ($ExpandAll) {
            for ($i = 0; $i -lt $collection.Count; ++$i) {
                $collection[$i] = $collection[$i] | Select-Object -Property $properties
            }
        } else {
            $collection[0] = $collection[0] | Select-Object -Property $properties
        }
        $collection
    }
}