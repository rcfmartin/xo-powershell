# SPDX-License-Identifier: Apache-2.0

function Get-XoPoolDashboard
{
    <#
    .SYNOPSIS
        List dashboard for a Pool.
    .DESCRIPTION
        Retrieve dashboard associated with a specific Xen Orchestra Pool.
    .PARAMETER PoolUuid
        The UUID of the Pool whose dashboard to retrieve.
    .EXAMPLE
        Get-XoPoolDashboard -PoolUuid "00000000-0000-0000-0000-000000000000"
    #>
    [CmdletBinding()]
    [OutputType("XoPowershell.Dashboard")]
    param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName, Position = 0)]
        [ValidatePattern("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")]
        [string[]]$PoolUuid
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
        foreach ($id in $PoolUuid)
        {
            $uri = "$script:XoHost/rest/v0/pools/$id/dashboard"
            (Invoke-RestMethod -Uri $uri @script:XoRestParameters -Body $params) | ConvertTo-XoDashboardObject
        }
    }
}
