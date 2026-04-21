# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /dashboard

function Get-XoDashboard
{
    <#
    .SYNOPSIS
        Get the global dashboard data.
    .DESCRIPTION
        Retrieve the global Xen Orchestra dashboard summary.
    .EXAMPLE
        Get-XoDashboard
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/dashboard"

        throw [System.NotImplementedException]::new("Get-XoDashboard is not implemented yet.")
    }
}
