# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vms/{id}/dashboard

function Get-XoVmDashboard
{
    <#
    .SYNOPSIS
        Get dashboard data for a VM.
    .DESCRIPTION
        Retrieve the dashboard summary for a specific Xen Orchestra VM.
    .EXAMPLE
        Get-XoVmDashboard
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vms/{id}/dashboard"

        throw [System.NotImplementedException]::new("Get-XoVmDashboard is not implemented yet.")
    }
}
