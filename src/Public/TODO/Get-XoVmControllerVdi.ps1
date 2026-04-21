# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-controllers/{id}/vdis

function Get-XoVmControllerVdi
{
    <#
    .SYNOPSIS
        List VDIs for a VM controller.
    .DESCRIPTION
        Retrieve VDIs attached to a specific Xen Orchestra VM controller.
    .EXAMPLE
        Get-XoVmControllerVdi
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-controllers/{id}/vdis"

        throw [System.NotImplementedException]::new("Get-XoVmControllerVdi is not implemented yet.")
    }
}
