# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /hosts/{id}/actions/enable

function Enable-XoHost
{
    <#
    .SYNOPSIS
        Enable a Xen Orchestra host.
    .DESCRIPTION
        Enable the specified host so it becomes available for VM placement.
    .EXAMPLE
        Enable-XoHost
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/hosts/{id}/actions/enable"

        throw [System.NotImplementedException]::new("Enable-XoHost is not implemented yet.")
    }
}
