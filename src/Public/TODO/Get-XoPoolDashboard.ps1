# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /pools/{id}/dashboard

function Get-XoPoolDashboard
{
    <#
    .SYNOPSIS
        Get dashboard data for a pool.
    .DESCRIPTION
        Retrieve the dashboard summary for a specific Xen Orchestra pool.
    .EXAMPLE
        Get-XoPoolDashboard
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/pools/{id}/dashboard"

        throw [System.NotImplementedException]::new("Get-XoPoolDashboard is not implemented yet.")
    }
}
