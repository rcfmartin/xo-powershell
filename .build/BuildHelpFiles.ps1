param
(
    [Parameter()]
    [string]
    $OutputDirectory = (property OutputDirectory (Join-Path $BuildRoot 'output'))
)
begin
{

}
process
{
    task 'BuildHelpFiles' {
        $Script:OutputDirectory = Get-SamplerAbsolutePath -Path $OutputDirectory -RelativeTo $BuildRoot
        $Script:psd = Get-ChildItem -Path "$($BuildRoot)/src" -include *.psd1 -File -Force -Recurse
        $Script:ModuleInfo = Invoke-Expression "$(Get-Content $psd.FullName |Out-string)"
        $Script:ModuleName = $psd.BaseName
        $Script:ModuleDir = Join-Path "$($OutputDirectory)" -ChildPath "module" -AdditionalChildPath $ModuleName, $ModuleInfo.ModuleVersion
        $Script:help = Join-Path $ModuleDir 'en-US'
        $Script:docs = Join-Path $BuildRoot "docs"
        $Script:index = $(Join-Path $docs "index.md")
        Write-Build Magenta "Creating External Help"
        if (Test-Path $help)
        {
            $null = Remove-Item $help -Recurse -Force
        }
        if (Test-Path $index)
        {
            $null = Remove-Item -Path $index -Force
        }
        Import-Module $(Join-Path $ModuleDir "$($ModuleName).psd1") -Force
        New-MarkdownHelp -Module $ModuleName -OutputFolder $docs -Force

        # if (-not $(Test-Path $docs))
        # {
        #     Write-Build Magenta "$($docs) folder does not exist"
        #     New-MarkdownHelp -Module $ModuleName -OutputFolder $docs -Force
        # }
        # else
        # {
        #     Write-Build Magenta "$($docs) folder exist"

        #     Update-MarkdownHelpModule -Path $docs
        # }

        # $job = Start-ThreadJob -ScriptBlock {
        #     param([string]$ModuleName, [string]$docs, [string]$help, [string]$ModuleDir)
        #     pwsh -nop -noni -command "Import-Module '$ModuleDir/$($ModuleName).psd1' -Force;if (-not `$(Test-Path $docs)){New-MarkdownHelp -Module $ModuleName -OutputFolder $docs}else{Update-MarkdownHelpModule -Path $docs -ea silentlycontinue}"
        #     # pwsh -nop -noni -command "Start-sleep -s 5;Import-Module '$ModuleDir/$($ModuleName).psd1' -Force;try{New-MarkdownAboutHelp -OutputFolder $docs -Aboutname $ModuleName -ErrorAction Stop}catch{if (`$_.Exception.Message -inotmatch 'The\sfile.*already.*'){throw `$_.Exception.Message}}"
        #     # pwsh -nop -noni -command "start-sleep -s 10;Import-Module '$ModuleDir/$($ModuleName).psd1' -Force; New-ExternalHelp $docs -OutputPath $help"
        # } -ArgumentList $ModuleName, $docs, $help, $ModuleDir
        # $job | Wait-Job | Receive-Job
    }
}
