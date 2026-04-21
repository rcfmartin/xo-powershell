# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /networks/{id}/tasks

function Get-XoNetworkTask
{
    <#
    .SYNOPSIS
        List tasks for a network.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra network.
    .EXAMPLE
        Get-XoNetworkTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/networks/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoNetworkTask is not implemented yet.")
    }
}
