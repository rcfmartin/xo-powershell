# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /pools/{id}/vms

function Get-XoPoolVm
{
    <#
    .SYNOPSIS
        List VMs in a pool.
    .DESCRIPTION
        Retrieve VMs that belong to a specific Xen Orchestra pool.
    .EXAMPLE
        Get-XoPoolVm
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/pools/{id}/vms"

        throw [System.NotImplementedException]::new("Get-XoPoolVm is not implemented yet.")
    }
}
