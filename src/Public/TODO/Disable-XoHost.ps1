# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /hosts/{id}/actions/disable

function Disable-XoHost
{
    <#
    .SYNOPSIS
        Disable a Xen Orchestra host.
    .DESCRIPTION
        Disable the specified host so new VMs will not be scheduled on it.
    .EXAMPLE
        Disable-XoHost
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/hosts/{id}/actions/disable"

        throw [System.NotImplementedException]::new("Disable-XoHost is not implemented yet.")
    }
}
