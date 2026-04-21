# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vm-snapshots/{id}/tasks

function Get-XoVmSnapshotTask
{
    <#
    .SYNOPSIS
        List tasks for a VM snapshot.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra VM snapshot.
    .EXAMPLE
        Get-XoVmSnapshotTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vm-snapshots/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoVmSnapshotTask is not implemented yet.")
    }
}
