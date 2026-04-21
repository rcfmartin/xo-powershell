# SPDX-License-Identifier: Apache-2.0

function Get-XoHostSmt
{
    <#
    .SYNOPSIS
        List smt for a Host.
    .DESCRIPTION
        Retrieve smt associated with a specific Xen Orchestra Host.
    .PARAMETER HostUuid
        The UUID of the Host whose smt to retrieve.
    .EXAMPLE
        Get-XoHostSmt -HostUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("System.Management.Automation.PSCustomObject")]
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
            $uri = "$script:XoHost/rest/v0/hosts/$id/smt"
            Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params
        }
    }
}
