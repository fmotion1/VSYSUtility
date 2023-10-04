
@{
    RootModule = 'VSYSUtility.psm1'
    ModuleVersion = '1.0.0'
    GUID = '3f9a266c-a4b7-5dc6-ae02-f288d726b535'
    Author = 'futur'
    CompanyName = 'Futuremotion'
    Copyright = '(c) Futuremotion. All rights reserved.'

    CompatiblePSEditions = @('Core')

    Description = 'Provides miscellaneous helper functions.'
    PowerShellVersion = '7.0'

    RequiredModules = @('BurntToast')
    RequiredAssemblies = @('System.Drawing', 'System.Windows.Forms')
    CmdletsToExport = @()
    VariablesToExport = '*'
    AliasesToExport = @()
    ScriptsToProcess = @()
    TypesToProcess = @()
    FormatsToProcess = @()
    FileList = @()

    # Leave commented out to import into any host.
    # PowerShellHostName = ''

    FunctionsToExport = 'Get-ModulePrivateFunctions', 
                        'Get-RandomAlphanumericString', 
                        'Test-IsAdmin',
                        'Get-Enum', 
                        'Get-BashPath', 
                        'Format-TitleCase',
                        'ConvertFrom-Binary',
                        'ConvertFrom-HexString',
                        'ConvertTo-HexString',
                        'ConvertFrom-DateTime',
                        'ConvertFrom-Hex',
                        'ConvertTo-UrlEncode',
                        'ConvertFrom-UrlEncode',
                        'ConvertTo-Binary',
                        'ConvertTo-DateTime',
                        'ConvertFrom-HtmlEncode',
                        'ConvertTo-HtmlEncode',
                        'ConvertTo-Hex',
                        'Convert-ObjectToHashtable',
                        'ConvertFrom-Base64String',
                        'ConvertTo-Base64String',
                        'Expand-Properties',
                        'New-TempDirectory',
                        'Get-RandomString',
                        'Test-IsFileEmpty',
                        'Test-IsWindowsPathUnsafe',
                        'Get-AllLoadedAssemblies',
                        'Get-TextWithin',
                        'Convert-Base64StringFromFile',
                        'Convert-Base64StringToFile',
                        'Convert-StringToArrayByNewline',
                        'Convert-StringToArray',
                        'Test-StringPriority3Way',
                        'Test-StringPriority2Way',
                        'ConvertFrom-XMLEscapedString',
                        'ConvertTo-XMLEscapedString',
                        'Get-StringCharCount',
                        'Remove-DiacriticsFromString',
                        'Confirm-ValidEmail',
                        'Get-ArrayDeepClone',
                        'Confirm-ObjectContentsIdentical',
                        'Confirm-ValidURLDotNET',
                        'Get-CurrentScriptInfo',
                        'Confirm-ValidURL',
                        'Confirm-ValidWindowsPath',
                        'Copy-HashToClipboard',
                        'Test-IsHTMLColorCode',
                        'Convert-Color',
                        'Convert-HtmlColorToRgb',
                        'Format-FileSizeBytesToAuto',
                        'Format-SortNumerical',
                        'Format-FileSizeUnits',
                        'Invoke-Admin',
                        'Get-AllVariablesWithPrefix',
                        'Compare-TwoDates'

    PrivateData = @{
        PSData = @{
            Tags = @('Utility', 'Helper', 'Misc', 'Functions', 'Formatting', 'Sorting', 'Conversion')
            LicenseUri = 'https://github.com/fmotion1/VSYSUtility/blob/main/LICENSE'
            ProjectUri = 'https://github.com/fmotion1/VSYSUtility'
            IconUri = 'https://raw.githubusercontent.com/fmotion1/VSYSUtility/main/Img/VSYSUtilityIconUri.png'
            ReleaseNotes = '1.0.0: (09-29-2023) - Initial Release'
        }
    }
}