# SPDX-License-Identifier: Apache-2.0

function Get-XoHostLogBundle
{
    <#
    .SYNOPSIS
        Download the host log bundle.
    .DESCRIPTION
        Download the compressed log bundle for a specific host.
    .PARAMETER HostUuid
        The UUID of the host whose log bundle to download.
    .PARAMETER OutFile
        Path to save the downloaded content to. If omitted, content is returned.
    .EXAMPLE
        Get-XoHostLogBundle -HostUuid "00000000-0000-0000-0000-000000000000" -OutFile "./output.bin"
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string]$HostUuid,

        [Parameter()]
        [string]$OutFile
    )

    process
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }

        $uri = "$script:XoHost/rest/v0/hosts/$HostUuid/logs.tgz"
        if ($OutFile)
        {
            Invoke-RestMethod -Uri $uri @script:XoRestParameters -OutFile $OutFile
            Get-Item $OutFile
        }
        else
        {
            Invoke-RestMethod -Uri $uri @script:XoRestParameters
        }
    }
}
