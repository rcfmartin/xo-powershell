# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-controllers/{id}/tasks

function Get-XoVmControllerTask
{
    <#
    .SYNOPSIS
        List tasks for a VM controller.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra VM controller.
    .EXAMPLE
        Get-XoVmControllerTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-controllers/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoVmControllerTask is not implemented yet.")
    }
}
