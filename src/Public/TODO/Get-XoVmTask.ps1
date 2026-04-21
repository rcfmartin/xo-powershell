# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vms/{id}/tasks

function Get-XoVmTask
{
    <#
    .SYNOPSIS
        List tasks for a VM.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra VM.
    .EXAMPLE
        Get-XoVmTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vms/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoVmTask is not implemented yet.")
    }
}
