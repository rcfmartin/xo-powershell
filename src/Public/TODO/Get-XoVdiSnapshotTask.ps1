# SPDX-License-Identifier: Apache-2.0

# TODO: implement. Swagger endpoint(s):
    #   /vdi-snapshots/{id}/tasks

function Get-XoVdiSnapshotTask
{
    <#
    .SYNOPSIS
        List tasks for a VDI snapshot.
    .DESCRIPTION
        Retrieve tasks associated with a specific Xen Orchestra VDI snapshot.
    .EXAMPLE
        Get-XoVdiSnapshotTask
    #>
    [CmdletBinding()]
    param ()

    process
    {
        $uri = "$script:XoHost/rest/v0/vdi-snapshots/{id}/tasks"

        throw [System.NotImplementedException]::new("Get-XoVdiSnapshotTask is not implemented yet.")
    }
}
