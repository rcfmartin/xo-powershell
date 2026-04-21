# SPDX-License-Identifier: Apache-2.0

function Get-XoHostStat
{
    <#
    .SYNOPSIS
        List stats for a Host.
    .DESCRIPTION
        Retrieve stats associated with a specific Xen Orchestra Host.
    .PARAMETER HostUuid
        The UUID of the Host whose stats to retrieve.
    .EXAMPLE
        Get-XoHostStat -HostUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Stat")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$HostUuid
    )

    begin
    {
        if (-not $script:XoHost -or -not $script:XoRestParameters)
        {
            throw "Not connected to Xen Orchestra. Call Connect-XoSession first."
        }

        $params = @{}

    }

    process
    {
        foreach ($id in $HostUuid)
        {
            $uri = "$script:XoHost/rest/v0/hosts/$id/stats"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoStatObject
        }
    }
}
