
function Get-ShortcutsInFolder {
    [CmdletBinding()]
    [OutputType([System.Object])]
    param (
        [Parameter(Mandatory,Position=0,ValueFromPipeline)]
        [Alias("p")]
        $Path,

        [Parameter(Mandatory=$false,ValueFromPipelineByPropertyName)]
        [Alias("f","filter")]
        [String]
        $TargetPathFilter,

        [Parameter(Mandatory=$false,ValueFromPipelineByPropertyName)]
        [Alias("all")]
        [Switch]
        $ShowAllDetails
    )

    begin {
        $sh = New-Object -ComObject WScript.Shell
    }

    process {
        
        if (Test-Path -LiteralPath $Path -PathType Container) {
            $Shortcuts = Get-ChildItem -path $Path -filter "*.lnk" -Recurse
            $Results = foreach ($Link in $Shortcuts) {
                $SC = $sh.CreateShortcut($Link.FullName)
                if($ShowAllDetails){
                    [PSCustomObject]@{
                        FullName         = $SC.FullName
                        Arguments        = $SC.Arguments
                        Description      = $SC.Description
                        Hotkey           = $SC.Hotkey
                        IconLocation     = $SC.IconLocation
                        RelativePath     = $SC.RelativePath
                        TargetPath       = $SC.TargetPath
                        WindowStyle      = $SC.WindowStyle
                        WorkingDirectory = $SC.WorkingDirectory
                    }
                } else {
                    [PSCustomObject]@{
                        FullName         = $SC.FullName
                        TargetPath       = $SC.TargetPath
                        WorkingDirectory = $SC.WorkingDirectory
                    }
                }
            }    
        } else {
           Write-Error "Folder doesn't exist ($Path)"
           return
        }

        if($TargetPathFilter){
            $Results = $Results | Where-Object { 
                $_.TargetPath -Like $TargetPathFilter 
            }
        }

        $Results
    }

    end { }
}